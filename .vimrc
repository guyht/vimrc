" Needed on some linux distros.
" " see
" http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set history=50        " keep 50 lines of command line history
set hlsearch        " Switch on search pattern highlighting.
set incsearch        " Switch on incremental search
set ruler             " show the cursor position all the time
set number            " Turn on line numbering
set ignorecase

syntax on             " Switch on syntax highlighting if it wasn't on yet.



set backspace=indent,eol,start     " allow backspacing over everything in insert mode
colorscheme desert            " Set the colourschemee

set diffopt=vertical
set tabstop=4
set shiftwidth=4



"helptags ~/.vim/doc
" Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Turn off gui toolbar
set guioptions-=T

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Highlight characters over the 100 character line length
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%99v.\+/

" Set an orange cursor in insert mode, and a red cursor otherwise.
" Works at least for xterm and rxvt terminals.
" Does not work for gnome terminal, konsole, xfce4-terminal.
if &term =~ "xterm\\|rxvt"
  :silent !echo -ne "\033]12;orange\007"
  let &t_SI = "\033]12;white\007"
  let &t_EI = "\033]12;orange\007"
  autocmd VimLeave * :!echo -ne "\033]12;orange\007"
endif
         

"""""""""""""
"Vim Mappings
"""""""""""""
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" Turn spell check on and off
map <F2> :NERDTreeToggle<cr>

" Turn spell check on and off
map <F3> :TlistToggle<cr>

" Turn spell check on and off
map <F7> :setlocal spell spelllang=en_gb<cr>
map <F8> :setlocal spell spelllang=<cr>

"Turn on indenting
map <F5> :set foldmethod=indent<cr>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-Left> <C-w><
map <silent> <A-Down> <C-W>-
map <silent> <A-Up> <C-W>+
map <silent> <A-Right> <C-w>>

" Maps Ctrl-[h,j,k,l] to changing the selected window 
noremap <C-up>  <C-W>j
noremap <C-down>  <C-W>k
noremap <C-left>  <C-W>h
noremap <C-right>  <C-W>l

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <C-c> :split<CR>

nmap <F9> :set list!<CR>

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Courier\ New\ 10
	elseif has("gui_photon")
		set guifont=Courier\ New:s10
	elseif has("gui_kde")
		set guifont=Courier\ New/10/-1/5/50/0/0/0/1/0
	elseif has("x11")
		set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
	else
		set guifont=Courier_New:h1o:cDEFAULT
	endif
endif

" Vim Wiki - Work Branch - Add 2nd wiki
let g:vimwiki_list = [{'path' : '~/vimworkwiki/', 'path_html' : '~/vimworkwiki_html/'},
			\ {'path' : '~/vimwiki/', 'path_html' : '~/vimwiki_html/'}]


" Tags file
set tags+=$HOME."/vimtags/tags"

" Vim Task
inoremap <silent> <buffer> <C-D-CR> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <leader>t :call Toggle_task_status()<CR>

" Map <Esc> to jj
:map! jj <esc>

" Change pmenu colour scheme
:highlight Pmenu guibg=brown gui=bold

" Add tags folder
:set tags+=$HOME/.vimtags/tags
