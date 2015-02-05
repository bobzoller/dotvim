set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://github.com/vim-scripts/Arduino-syntax-file.git'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
Bundle 'git://github.com/mtscout6/vim-cjsx.git'
Bundle 'git://github.com/wavded/vim-stylus.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/rking/ag.vim.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/Valloric/YouCompleteMe.git'

source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

filetype plugin indent on

" dial down ESC key timeout
set timeoutlen=250

let mapleader=","

if has("gui_running") || (&t_Co >= 256)
  syntax on
  colorscheme solarized
  set background=dark 
elseif (&t_Co > 2)
  syntax on
  colorscheme ir_black_mod
end

" use Perl/Python style regexps
nnoremap / /\v
vnoremap / /\v

set encoding=utf-8 nobomb
set expandtab shiftwidth=2 tabstop=2
set noerrorbells
set visualbell

set scrolloff=2
set sidescrolloff=4

set gdefault
set ignorecase
set smartcase
set incsearch
set hlsearch
" clear searches with leader-space
nnoremap <leader><space> :noh<cr>
nnoremap <leader>; :make<cr>
set showmatch

" I never use F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

if has("gui_running")
  "set gfn=ProFontX:h9.00
  "set noanti
  "set guifont=Inconsolata-dz\ for\ Powerline:h12
  set guifont=Hermit:h12
  set linespace=1
end

let g:fontie="smaller"
fun! ToggleFont()
  if g:fontie == "smaller"
    let g:fontie = "bigger"
    set gfn=Monaco:h13.00
    set anti
  elseif g:fontie == "bigger"
    let g:fontie = "smaller"
    set gfn=ProFontX:h9.00
    set noanti
  endif
endfun
noremap <C-=>:call ToggleFont()<CR>
nnoremap <Leader>A :Ag <cword><CR>
nnoremap <leader>a :Ag
nnoremap <Leader>m :wa \|! NOCOLOR=1 coffee %:p<CR>

let coffee_compile_vert = 1
nnoremap <Leader>p :CoffeeCompile<cr>

" exit back to normal mode with jj
inoremap jj <ESC>

set autoindent
set ruler
set laststatus=2
set backupdir=/tmp
set directory=/tmp
set backspace=start,eol,indent
set textwidth=0

" hide unsaved buffers rather than bugging me to save them
set hidden

" autosave modified buffers
autocmd BufLeave,FocusLost silent! wall

" omni autocomplete in insert mode:
" imap <C-SPACE>	<C-X><C-O>

" convert DOS line breaks automagically
autocmd BufRead * silent! %s/^M$//

" syntax highlight arduino .pde files
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" enable the right compiler automagically
autocmd FileType * try | execute "compiler ".&filetype | catch /./ | endtry 

" ctrlp config
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = '2t'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_map = '<C-t>'
let g:ctrlp_custom_ignore = '\.'
"let g:ctrlp_custom_ignore = '\v\~$' 
"\ . '|\.(o|gif|GIF|png|PNG|jpg|JPG|class|CLASS|swp)$'
"\ . '|\/\.[^\/]*$'
"\ . '|^\.[^\/]*$'
"\ . '|(^|[/\\])\.(svn|hg|git|bzr)($|[/\\])' 
"\ . '|(^|[/\\])node_modules[/\\]' 
"\ . '|(^|[/\\])log[/\\]' 
"\ . '|.*[/\\]$' 

" tab nav keys
map <D-S-Left> :tabprevious<CR>
map <D-S-Right> :tabnext<CR>

map <F10> :! coffeetags -f tags `git ls-files\|grep -e '\\.coffee$'`<CR>
