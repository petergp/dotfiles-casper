scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "


" Remap leader key to ,
let g:mapleader=" "

" Line numbers
set number! relativenumber!

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" Highlight current cursor line
set cursorline

" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1

" Mouse support (for when im really lazy)
set mouse=a

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color `support
set termguicolors

" Theme
colorscheme nord
" colorscheme meh
" colorscheme gruvbox

hi StatusLine ctermbg=24 ctermfg=254 guibg=#404044 guifg=#222226
hi StatusLineNC ctermbg=252 ctermfg=238 guibg=#222226 guifg=#404044
" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" source ~/.config/nvim/plugins/denite.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/echodoc.vim
source ~/.config/nvim/plugins/colorizer.vim
source ~/.config/nvim/plugins/better-whitespace.vim
source ~/.config/nvim/plugins/ultisnips.vim

" Rust.vim
let g:rustfmt_autosave = 1

" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "

" Custom color changes when using italic font
hi htmlArg gui=italic
hi htmlArg cterm=italic
hi Comment gui=italic
hi Comment cterm=italic

" coc.nvim color changes
hi! CocErrorSign ctermfg=red guifg=#bf616a
hi! CocWarningSign ctermfg=red guifg=#d08770
hi! CocInfoSign ctermfg=yellow guifg=#b48dad

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Search
map <leader>h :%S///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>


" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.config/nvim/backups " Don't put backups in current dir
set backup
set noswapfile

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
