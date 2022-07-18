function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- normal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Better tabbing
map("v", "<", "<gv")
map("v", ">", ">gv")

-- buffer stuff
map("n", "<C-j>", ":bnext<CR>")
map("n", "<C-k>", ":bprev<CR>")
map("n", "<Leader>o", ":enew<CR>")
map("n", "<Leader>q", ":bdelete<CR>")


 -- Go to end of page and center
map("n", "G", "Gzz")

 -- Clear search
map("n", "<Leader><Esc>", ":let @/=''<CR>", { silent=true })

-- Append colon and semicolon
map("n", "<leader>,", "A,<ESC>")
map("n", "<leader>;", "A;<ESC>")

-- neoformat map
map("n", "<C-A-f>", ":lua vim.lsp.buf.formatting()<CR>")

-- sweet map
map("n", "Y", "y$")


-- nice moving
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "<C-j>", "<esc>:m .+1<CR>==")
map("i", "<C-k>", "<esc>:m .-2<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")


-- shortcut for comment
map("n", "<C-_>", ":Commentary<CR>")
map("v", "<C-_>", ":Commentary<CR>")
map("i", "<C-_>", "<ESC>:Commentary<CR>")


-- pylint
map("n", "<F2>", ":!pylint %<CR>")


-- telescope find_files
map('n', '<leader>tf', ":Telescope find_files <CR>", { silent = true })
map('n', '<leader>tg', ":Telescope git_files <CR>", { silent = true })
map('n', '<leader>tbn', ":lua require('telescope.builtin').find_files({cwd='/home/mohammad/.config/nvim'})<CR>", { silent = true })
map('n', '<leader>tbc', ":lua require('telescope.builtin').find_files({cwd='/home/mohammad/code/'})<CR>", { silent = true })


-- harpoon
map("n", "<leader>a", ':lua require("harpoon.mark").add_file()<CR>', { silent = true })
map("n", "<C-e>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { silent = true})
map("n", "<leader>tc", ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', { silent = true })
map("n", "<leader>hu", ':lua require("harpoon.term").gotoTerminal(1)<CR>', { silent = true })
map("n", "<leader>he", ':lua require("harpoon.term").gotoTerminal(2)<CR>', { silent = true })
map("n", "<C-s>", ':lua require("harpoon.ui").nav_file(1)<CR>', { silent = true })
map("n", "<C-n>", ':lua require("harpoon.ui").nav_file(2)<CR>', { silent = true })
map("n", "<C-t>", ':lua require("harpoon.ui").nav_file(3)<CR>', { silent = true })
map("n", "<C-h>", ':lua require("harpoon.ui").nav_file(4)<CR>', { silent = true })

-- netrw
map("n", "-", ':Lexplore<CR>', { silent = true })

