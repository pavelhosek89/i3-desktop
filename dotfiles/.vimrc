set tabstop=4 " The width of a TAB is set to 4.
              " Still it is a \t. It is just that
              " Vim will interpret it to be having
              " a width of 4.
set shiftwidth=4 " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a TAB
set expandtab " Expand TABs to spaces
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
set number

""" Start settings for plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'triglav/vim-visual-increment'

call vundle#end()

filetype plugin indent on
""" End settings for plugins

""" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

""" vim-gitgutter
let g:gitgutter_log=1

""" LIGHTLINE
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""" VISUAL-INCREMENT
set nrformats=alpha,octal,hex
