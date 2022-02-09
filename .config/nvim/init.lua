local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

local opts = { noremap = true, silent = true }

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- Saving file
map("n", "<C-s>", ":w<CR>", opts)

-- Execute python
map("n", "<F9>", ":!st -e python3 %<CR>", opts)
cmd [[autocmd filetype python nnoremap <F8> :exec '!python3 '.shellescape('%')<CR>]]

-- Move on insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP', opts)

-- don't yank text on cut ( x )
map("n", "x", '"_x', opts)
map("v", "x", '"_x', opts)

-- don't yank text on delete ( d | dd )
map("n", "dd", '"_dd', opts)
map("n", "d", '"_d', opts)
map("v", "dd", '"_dd', opts)
map("v", "d", '"_d', opts)

-- stay selected on visual mode
map("v", "y", "ygv", opts)

-- Select all
map("n", "yg", "ggVG", opts)

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {expr = true})
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {expr = true})

-- Move lines/selected lines
map("n", "<C-j>", ":m .+1<CR>==", opts)
map("n", "<C-k>", ":m .-2<CR>==", opts)
map("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Jump words on insert mode
map("i", "<C-w>", "<C-\\><C-O>w", opts)
map("i", "<C-b>", "<C-\\><C-O>b", opts)

-- Display search result in center of the screen
map("n", "n", "nzz", opts)

-- Open and close fold
map("n", "<C-h>", ":foldclose<CR>", opts)
map("n", "<C-f>", ":foldopen<CR>", opts)
map("v", "<C-h>", "<cmd>foldclose<CR><Esc>", opts)
map("v", "<C-f>", "<cmd>foldopen<CR><Esc>", opts)

-- Open Explorer
map("n", "<Space>e", ":Explore<CR>", opts)

-- Close Buffer
map("n", "<Space>c", ":bd<CR>", opts)

-- Quit
map("n", "<Space>q", ":q<CR>", opts)

------------------
-- Some Options --
------------------

local opt = vim.opt
local g = vim.g
local wo = vim.wo

opt.clipboard = "unnamedplus"

-- Indentline
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 4
opt.termguicolors = true
opt.undofile = true

opt.mouse = "a"
opt.scrolloff = 10

-- Numbers
opt.number = true
opt.relativenumber = true

opt.swapfile = false

-- Highlight on yank
vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)

-- Some color
vim.cmd [[highlight SignColumn guibg=none]]
