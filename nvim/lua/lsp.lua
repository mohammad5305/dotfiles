Cmp = require("cmp")
local lspkind = require('lspkind')
lspkind.init()

local function has_words_before()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local l, c = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, l-1, l, true)[1]:sub(c,c):match("%s") == nil
end

local function repltermcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function feedkey(k, mode)
    vim.api.nvim_feedkeys(repltermcodes(k), mode, true)
end

-- this is unnecesary for this config, but useful as reference
local function tabfunc(fallback)
    if vim.fn.pumvisible() == 1 then
        feedkey("<c-n>", "n")
    elseif has_words_before() then
        Cmp.complete()
    else
        fallback()
    end
end

Cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = "buffer" },
        { name = 'path' },
        { name = 'treesitter' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<C-d>'] = Cmp.mapping(Cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = Cmp.mapping(Cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<tab>"] = Cmp.mapping.select_next_item(),
        ["<s-tab>"] = Cmp.mapping.select_prev_item(),
        -- ["<c-n>"] = Cmp.mapping.select_next_item(),
        -- ["<c-p>"] = Cmp.mapping.select_prev_item(),
        ["<c-y>"] = Cmp.mapping.confirm({
            behavior = Cmp.ConfirmBehavior.Insert,
            select = false,
        }),
        ["<c-e>"] = Cmp.mapping.close(),
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
            },
        },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,

    }
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', 'C-k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'C-p', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', 'C-n', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>Lspsaga code_action()<CR>', opts)
  buf_set_keymap('x', 'ga', '<cmd>Lspsaga range_code_action()<CR>', opts)
end


local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = on_attach
        }
    end
end

local sumneko_root_path = '/home/mohammad/.config/nvim/lua_lsp'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

setup_servers()

-- Automatically reload after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
