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
        { name = 'luasnip' }
    },
    mapping = {
        ['<C-d>'] = Cmp.mapping(Cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = Cmp.mapping(Cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<tab>"] = Cmp.mapping.select_next_item(),
        ["<s-tab>"] = Cmp.mapping.select_prev_item(),
        ["<cr>"] = Cmp.mapping.confirm({
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

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        }
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
