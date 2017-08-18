"""""""""""
" General "
"""""""""""
set nocompatible " choose no compability wih legacy vi

filetype off

call plug#begin('~/.vim/plugged')

"""""""""""""
" Utilities "
"""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tComment' " comments
Plug 'taglist.vim' " list tags
Plug 'tpope/vim-fugitive' " for git status
Plug 'rking/ag.vim' " ag for faster search
Plug 'KabbAmine/zeavim.vim' " integrate with zeal
Plug 'wakatime/vim-wakatime' " integrate with wakatime
Plug 'dbext.vim' " integrate with DB
Plug 'scrooloose/nerdtree' " nerdtree
Plug 'myusuf3/numbers.vim' " better numbering
Plug 'easymotion/vim-easymotion' 
Plug 'ervandew/supertab' " manage tab (YCM and ultisnips combo)
Plug 'majutsushi/tagbar' " tagbar
Plug 'jiangmiao/auto-pairs' " close brackets automatically
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } " deoplete-go dependency

"""""""""""""""""""""""""
" Snippet/ Autocomplete "
"""""""""""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' " snippets engine
Plug 'honza/vim-snippets' " snippets
Plug 'zchee/deoplete-go', { 'do': 'make'} " deoplete for golang

"""""""""""""""
" Appearances "
"""""""""""""""
Plug 'drmikehenry/vim-fontsize' " for fontsize in gvim
Plug 'chriskempson/base16-vim' " base16 theme
Plug 'junegunn/goyo.vim' " Distraction free
Plug 'junegunn/limelight.vim' " To accompany goyo
Plug 'jonathanfilip/vim-lucius' " Lucius Colorscheme
Plug 'itchyny/landscape.vim' " Colorscheme and airline
Plug 'noahfrederick/vim-hemisu'
Plug 'itchyny/lightline.vim' " statusline

""""""""""""""""""""""
" Language Specifics "
""""""""""""""""""""""
Plug 'fatih/vim-go' "vim go
Plug 'garyburd/go-explorer'

""""""""""
" Unused "
""""""""""
" Plug 'nhooyr/env.vim' " lightline dependency
" Plug 'Shougo/vimproc.vim' 
" Plug 'tpope/vim-dispatch' " omnisharp dependencies
" Plug 'scrooloose/syntastic'
" Plug 'kien/ctrlp.vim' " Fuzzy file finder
" Plug 'tpope/vim-surround' " surround everything
" Plug 'matchit.zip', {'name': 'matchit'} " go to closing brackets
" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe' " autocomplete
" Plug 'Lokaltog/vim-powerline' " for better symbol statusline

call plug#end()

filetype plugin indent on	" load filetype plugins + indentation

syntax enable

set encoding=utf-8
set showcmd			" display incomplete commands

scriptencoding utf-8

"""""""""""""""
" Whitespaces "
"""""""""""""""
set nowrap 			" don't wrap lines
set tabstop=4 softtabstop=4 shiftwidth=4	" a tab is two spaces
set expandtab			" use spaces, not tabs (optional)
set backspace=indent,eol,start	" backspace through everything in insert mode

"""""""""""""
" Searching " 
"""""""""""""
set hlsearch			" highlight matches
set incsearch			" incremental searching
set ignorecase			" searches are case sensitive...
set smartcase			" ...unless they contain at least one capital letter

""""""""""""""""""""
" Snippets setting "
""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-n>"
" let g:UltiSnipsJumpForwardTrigger="<c-s>"
" let g:UltiSnipsJumpBackwardTrigger="<c-s>" I am thinking of this keybinding.

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd', 'go']

""""""""""""""""""""""
" Tags & Navigations "
""""""""""""""""""""""
set tags=./tags,./gems.tags;

let g:ctrlp_extensions = ['tag']
let Tlist_Show_One_File = 1 " Taglist to show only 1 file tags
let Tlist_Use_Right_Window = 1 " Taglist to show on the right sidebar

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"""""""""""""""
" Appereances "
"""""""""""""""
" General appereances
set t_Co=256 " force vim to use 256 color
set background=dark " use dark as default

let g:solarized_termcolors=256      " use solarized 256 fallback
let g:Powerline_symbols = 'fancy'

"""""""""""""""
" Colorscheme "
"""""""""""""""
colorscheme  lucius

"""""""""""""
" Lightline "
"""""""""""""
" Lightline configs (statusline)
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Use limelight when triger Goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

""""""""""""""""
" Autocommands "
""""""""""""""""
if has('autocmd')
  " autocmd bufwritepost .vimrc source $MYVIMRC " source .vimrc file after saving it
  " Open markdown files with Chrome.
  autocmd BufEnter *.md exe 'nnoremap <leader>p :!chromium%:p<CR>'
endif

""""""""""""""
" GVim Setup "
""""""""""""""
if has('gui_running')
  colorscheme  base16-eighties
  set guifont=Monofour\ for\ Powerline\ 11 " set default font to Source Code Pro 11
  " set guifont=Source\ Code\ Pro\ 11 " set default font to Source Code Pro 11
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=m  " remove menu
endif

"""""""""""""""""""""""
" Mapping/ Keybinding "
"""""""""""""""""""""""
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-k> :bp<CR>
map <C-j> :bn<CR>
map <C-t> :tabnew<CR>
map <C-p> :FZF<CR>

nnoremap <F2> :NERDTree<CR>
nnoremap <F3> :NERDTreeClose<CR>
nnoremap <F4> :NumbersToggle<CR>
nnoremap <F5> :buffers<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :set cursorline cursorcolumn<CR>
nnoremap <F10> :set nocursorline nocursorcolumn<CR>

"""""""""""""""
" Deoplete-GO "
"""""""""""""""
:set runtimepath+=./deoplete.nvim/
set completeopt+=noinsert " neocomplete like
set completeopt+=noselect " deoplete.nvim recommend

let g:deoplete#sources#go#package_dot = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
" let g:deoplete#sources#go#json_directory = '/path/to/data_dir'

"""""""""""
" python3 "
"""""""""""
" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'

" Skip the check of neovim module
let g:python3_host_skip_check = 1

let g:python_host_skip_check = 1

""""""""""
" Others "
""""""""""
:set nobackup
:set nowritebackup
:set noswapfile

set laststatus=2
set noshowmode
set number
" set shell=/bin/bash
" :set mouse=a

" execute pathogen#infect()
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
