set undofile
set noswapfile
set hidden
set nobackup
set relativenumber
set scrolloff=10
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Execute python
nmap <F8> :!st -e python3 %<CR>

" Save file
nmap <C-s> :w<CR>

" Select all
nmap yg ggVG<C-o><C-o>

" Esc to nohighlight
map <Esc> :noh<CR>

" Clipboard
set clipboard+=unnamedplus
