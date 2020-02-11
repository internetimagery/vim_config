" Keymaps
	" Make Y consistent with C and D
map Y y$						
	" Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv
	" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" Theme!
set runtimepath^=~/.vim/pack/theme/opt/onehalf/vim	" Need to add due to non-standard repo structure
colorscheme onehalfdark					" Set the theme
syntax on						" Enable syntax highlighting
set t_Co=256						" Ensure we use highest quality colour available
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" GUI
set cursorline						" Faint line showing cursor (y axis)
set cursorcolumn					" Faint line showing cursor (x axis)
set number relativenumber				" Show line numbers and set relative to cursor when in normal mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set shortmess=atI					" Simple status bar
set scrolloff=7                 			" keep 3 lines when scrolling
set showcmd                     			" display incomplete commands
set showmode                    			" display current modes
set showmatch                   			" jump to matches when entering parentheses
set matchtime=2                 			" tenths of a second to show the matching parenthesis
set hlsearch                    			" highlight searches
set incsearch                   			" do incremental searching, search as you type


" System
set nocompatible                			" Don't bother with vi compatibility
set autoread                    			" Reload files when changed on disk, i.e. via `git checkout`
set magic						" For regular expressions turn magic on
set title						" change the terminal's title
set nobackup						" do not keep a backup file
set novisualbell					" turn off visual bell
set noerrorbells					" don't beep
set visualbell t_vb=					" turn off error beep/flash
set t_vb=
set tm=500
set ignorecase                  			" ignore case when searching
set smartcase                   			" no ignorecase if Uppercase char present

" Strip extra whitespace
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
