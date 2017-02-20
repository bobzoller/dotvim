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
Bundle 'git://github.com/Shougo/neocomplete.vim.git'
Bundle 'git://github.com/lepture/vim-jinja.git'
Bundle 'git://github.com/smerrill/vcl-vim-plugin.git'
Bundle 'git://github.com/fatih/vim-go.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/hashivim/vim-terraform.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'git://github.com/mxw/vim-jsx.git'
Bundle 'git://github.com/JamshedVesuna/vim-markdown-preview.git'
Bundle 'git://github.com/ruanyl/vim-gh-line.git'

" copy github links to clipboard
let g:gh_open_command = 'pbcopy <<< '

" use grip for github markdown previews
let vim_markdown_preview_github=1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

set laststatus=2

au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

filetype plugin indent on

" trim trailing whitespace
"autocmd FileType r,js,coffee autocmd BufWritePre <buffer> :%s/\s\+$//e

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

set number

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
  "set guifont=Inconsolata:h12
  set guifont=Hermit:h12
  set linespace=1
end

nnoremap <Leader>A :Ag! <cword><CR>
nnoremap <leader>a :Ag!
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
autocmd BufLeave,FocusLost * silent! wall

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
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files -c -o --exclude-standard | grep -v Godeps/_workspace']
let g:ctrlp_map = '<C-t>'
let g:ctrlp_custom_ignore = '\.'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 999
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
