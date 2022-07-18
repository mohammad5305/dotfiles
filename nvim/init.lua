vim.g.mapleader=' '
local opt = vim.opt

-- opt.leader = "<Space>"

opt.termbidi = true
opt.scrolloff = 5
--opt.laststatusline = 3
opt.swapfile = false
opt.backspace = 'indent,eol,start'
opt.ai = true
opt.si = true
opt.autochdir = true

opt.splitbelow = true
opt.termguicolors = true
opt.shiftwidth=4
opt.wrap=false
opt.hls = false
opt.undofile=true
opt.hidden = false
-- opt.formatoptions-=cro
opt.colorcolumn='80'
opt.joinspaces=false
opt.mouse='n'
opt.lazyredraw = true
opt.autoread=true

--  clipboard
opt.clipboard="unnamedplus"

-- line number
opt.relativenumber=true
opt.number = true

-- tab stuff
opt.expandtab=true
opt.smarttab=true

opt.bg = 'dark'

vim.cmd('colorscheme gruvbox')


vim.g.vimwiki_list = {
    {
        ['path'] = "~/.vimwiki",
    }
}

vim.g.netrw_banner = false
vim.g.netrw_winsize = 40


require 'packages'
require 'au'
require("luasnip/loaders/from_vscode").lazy_load()
require('nvim-ts-autotag').setup()
require "lsp"
-- require "statusline"
require "treesitter"
require "mapping"

