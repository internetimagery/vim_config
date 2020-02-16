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


" FileTypes
autocmd BufRead,BufNewFile wscript setfiletype python

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
let g:airline_section_x = ''				" Disable excess information
let g:airline_section_y = ''
let g:airline_section_z = ''


" GUI
set cursorline						" Faint line showing cursor (y axis)
set cursorcolumn					" Faint line showing cursor (x axis)
set number relativenumber				" Show line numbers and set relative to cursor when in normal mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set scrolloff=7                 			" keep 3 lines when scrolling
set showcmd                     			" display incomplete commands
set showmode                    			" display current modes
set showmatch                   			" jump to matches when entering parentheses
set matchtime=2                 			" tenths of a second to show the matching parenthesis
set hlsearch                    			" highlight searches
set incsearch                   			" do incremental searching, search as you type
set laststatus=2					" Keep status line below

" System
set hidden						" Allow swapping of buffers with changes, without nagging.
set mouse=a						" Enable mouse support
set nocompatible                			" Don't bother with vi compatibility
set autoread                    			" Reload files when changed on disk, i.e. via `git checkout`
set magic						" For regular expressions turn magic on
set title						" change the terminal's title
set nobackup						" do not keep a backup file
set novisualbell noerrorbells				" turn off visual bell
set visualbell t_vb=					" turn off error beep/flash
set tm=500
set ignorecase                  			" ignore case when searching
set smartcase                   			" Case sensitive is search includes uppercase letter
set path+=**						" Include all files in search path (fuzzy search lite)

" Enable smart switching between constructs (eg html tags etc) (built in plugin)
runtime macros/matchit.vim

" Strip extra whitespace
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
