call pathogen#infect()

" dial down ESC key timeout
set timeoutlen=250

let mapleader=","

if has("gui_running") || (&t_Co >= 256)
  syntax on
  colorscheme ir_black_mod
  set background=dark 
elseif (&t_Co > 2)
  syntax on
  colorscheme ir_black_mod
end

set nocompatible
set encoding=utf-8 nobomb
set expandtab shiftwidth=2 tabstop=2
set noerrorbells
set visualbell

set scrolloff=2
set sidescrolloff=4

set gdefault
set ignorecase
set smartcase
set incsearch hlsearch
nmap <silent> <C-H> :silent noh<CR>
set showmatch

if has("gui_running")
  set gfn=ProFontX:h9.00
  set noanti
  "set gfn=Inconsolata:h13.00
  set linespace=1
end

set autoindent
set ruler
set laststatus=2
set nobackup
set backspace=start,eol,indent
set textwidth=0

" hide unsaved buffers rather than bugging me to save them
set hidden

" omni autocomplete in insert mode:
imap <C-SPACE>	<C-X><C-O>

" convert DOS line breaks automagically
autocmd BufRead * silent! %s/^M$//

" syntax highlight arduino .pde files
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" enable the right compiler automagically
autocmd FileType * try | execute "compiler ".&filetype | catch /./ | endtry 

map ; :make<CR>

" map fuzzy finder to cmd t
map <C-T> :FufFile<CR>

" make fuzzy finder use tabs by default
let g:fuf_keyOpenTabpage = "<CR>"
let g:fuf_keyOpen = "<C-l>"

" tab nav keys
map <D-S-Left> :tabprevious<CR>
map <D-S-Right> :tabnext<CR>
