" Neovim configuration file

" Load vimrc settings file
source vimrc

" Cursor shape changing
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

" show substitution previews
set inccommand=nosplit

" Make escape work in the Neovim terminal.
tnoremap <Esc> <C-\><C-n>

" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert
