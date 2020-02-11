

" GUI
set cursorline						" Faint line showing cursor (y axis)
set cursorcolumn					" Faint line showing cursor (x axis)
set number relativenumber				" Show line numbers and set relative to cursor when in normal mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


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
