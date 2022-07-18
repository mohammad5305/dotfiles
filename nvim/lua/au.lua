local api = vim.api

local yankGrp = api.nvim_create_augroup("highlightyank", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({timeout=50})",
    group = yankGrp,
})

local wiki = api.nvim_create_augroup("wiki", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = {"vimwiki"},
    command = "silent! setlocal wrap spell",
    group = wiki,
})


api.nvim_create_autocmd("FileType", {
    pattern = {"c"},
    command = "silent! set shiftwidth=8 tabstop=8 softtabstop=8",
})

api.nvim_create_autocmd("FileType", {
    pattern = {"vim","lua","nginx","sh","sent"},
    command = "silent! set shiftwidth=4 tabstop=4 softtabstop=4",
})

api.nvim_create_autocmd("FileType", {
    pattern = {"python", "rmd"},
    command = "silent! set expandtab shiftwidth=4 tabstop=4 softtabstop=4",
})

api.nvim_create_autocmd("FileType", {
    pattern = {"php", ""},
    command = "silent! setlocal autoindent",
})



local litecorrect = api.nvim_create_augroup("litecorrect", { clear = true })

api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "mkd", "textile", "wiki"},
    command = "silent! call litecorrect#init()",
    group = litecorrect
})

