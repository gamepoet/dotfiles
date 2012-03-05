" enable vim extensions
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" setup bundles
Bundle 'gmarik/vundle'
" ...
Bundle 'vim-scripts/a.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wincent/Command-T'
Bundle 'rson/vim-conque'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/FX-HLSL'
Bundle 'tpope/vim-haml'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jpalardy/vim-slime'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'gerardo/taglist.vim'

" general appearance and behavior
filetype plugin indent on
syntax on
set backspace=indent,eol,start
set nobackup
set noerrorbells
set history=1000
set linebreak
set number
set ruler
set scrolloff=3
set showcmd
set showmatch
set showmode
set visualbell t_vb=
set wildignore=*.o,*.obj,*~
set wildmenu
set wildmode=list:longest
set nowrap

" make trailing whitespace visible
set list listchars=tab:»\ ,trail:_

" change leader to something easy to reach
let mapleader = ","

" indentation
set autoindent
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2

" single space after punctuation
set nojoinspaces

" searching
set hlsearch
set ignorecase
set incsearch
set smartcase     " ignore case if all lower, otherwise case-sensitive

" tags
set tags=./tags;/ " start in the current directory and walk up to the root dir

if v:version >= 703
  " undo settings
  set undodir=~/.vim/undofiles
  set undofile

  " display ideal max text width
  set colorcolumn=+1
endif

" set the font
if has('gui_running')
  if has('win32')
    set guifont=Lucida_Console:h9:cANSI
  end
endif

" i want 256 colors and use solarized colorscheme
set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_italic=0
set background=dark
"colorscheme solarized
colorscheme railscasts

" taglist settings
"let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<CR>
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" nerdtree settings
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40

" display a warning if file encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h  " help file flag
set statusline+=%y  " filetype
set statusline+=%r  " read only flag
set statusline+=%m  " modified flag

" fugitive status
set statusline+=%{fugitive#statusline()}

" display warning if tab settings is wrong or mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

" warning trailing spaces
set statusline+=%{StatuslineTrailingSpaceWarning()}

" syntastic status
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=                                    " left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \    " current highlight
set statusline+=%c,                                   " cursor column
set statusline+=%l/%L                                 " cursor line/total lines
set statusline+=\ %P                                  " percent through file
set laststatus=2

" allow semicolon to be a substitute for colon
nnoremap ; :

" ,/ to clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" strip empty line endings
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap _$ :call Preserve( "s/\\s\\+$//e")<CR>

" strip empty line beginnings
nmap _^ :call Preserve("%s/^\\s\\+//e")<CR>
vmap _^ :call Preserve( "s/^\\s\\+//e")<CR>

" search next/prev: center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz

" single key indentation
nmap > >>
nmap < <<

" table alignment maps useful for code
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" perforce edit
nn <Leader>p4e :!p4 edit %<CR>

" recalculate trailing whitespace warning when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" recalculate tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"-------------------------------------------------
" return '[\s]' if trailing whitespace is detected
" return '' otherwise
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

"-------------------------------------------------
" return the syntax highlight group under the cursor
function! StatuslineCurrentHighlight()
  let name = synIDattr(synID(line('.'),col('.'),1),'name')
  if name == ''
    return ''
  else
    return '[' . name . ']'
  endif
endfunction

"-------------------------------------------------
" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let b:statusline_tab_warning = ''

    if !&modifiable
      return b:statusline_tab_warning
    endif

    let tabs = search('^\t', 'nw') != 0

    " find space that aren't used as alignment in the first indent column
    let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning = '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    endif
  endif
  return b:statusline_tab_warning
endfunction
