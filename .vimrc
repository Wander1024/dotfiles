set nocompatible              " be iMproved, required
filetype plugin indent on
set backspace=2
set hls
set nu
set tabstop=2
set shiftwidth=2
set autoindent
set shell=/bin/zsh
set splitbelow
set pastetoggle=M-0
set completeopt=menu,menuone,preview
set pumheight=20
set showcmd
set showmode
set laststatus=2
set guioptions=''
set cursorline
set splitright
set ts=2 sw=2 et
set expandtab
set clipboard=unnamedplus
syntax enable
hi Search ctermbg=Green
hi Search ctermfg=LightBlue
hi CursorLineNr ctermfg=220
" set background=dark           " Background color
set t_Co=256
"colorscheme hybrid
"set guifont=Source\ Code\ Pro\ Light:h13
let mapleader = " "
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_log_level = 'debug'
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ophigh_color_gui = "#F6FF00"
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python3'

if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif

function HideNumber()
      if(&number)
            set number!
      else
            set number
      endif
endfunc
nnoremap <Leader>n :call HideNumber()<CR>
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif
    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
        call append(1, "\# encoding: utf-8")
    endif
    normal G
    normal o
    normal o
endfunc
" python

let g:neoformat_enabled_python = ['autopep8']

function! ToggleAutoFormatCode()
  if !exists('#AutoFormatCode#BufWritePre')
    augroup AutoFormatCode
      autocmd!
      autocmd BufWritePre * silent! Neoformat
    augroup END
  else
    augroup AutoFormatCode
      autocmd!
    augroup END
  endif
endfunction
command! ToggleAutoFormatCode :call ToggleAutoFormatCode()
call ToggleAutoFormatCode() " Enable by default

"vim access clipoard
inoremap <Leader>v "+pa
vnoremap <Leader>c "+y
vnoremap <Leader>p "+d"

nnoremap <C-e> <Esc> $a
nnoremap <C-a> <Esc>^i
inoremap <C-e> <Esc> $a
inoremap <C-a> <Esc>^i
nnoremap <C-g> :YcmCompleter GoToDefinition<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'sbdchd/neoformat'
Plugin 'Raimondi/delimitMate'
Plugin 'w0rp/ale'
Plugin 'w0ng/vim-hybrid'
Plugin 'mhinz/vim-startify'
Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required

filetype plugin indent on    " required
let g:indentLine_color_term = 220
let g:indentLine_char = 'c'
set conceallevel=1
let g:indentLine_conceallevel=1
"
" go set
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:ycm_gocode_binary_path = "/home/wangyaohua/go/bin/gocode"
let g:ycm_godef_binary_path = "/home/wangyaohua/go/bin/godef"
nmap <Leader>e :GoErrCheck<CR>
nmap <Leader>b :GoBuild<CR>
nmap <Leader>l :GoLint<CR>
nmap <Leader>d :GoDoc<CR>
nmap <Leader>t :GoTest<CR>
nmap <Leader>i :GoInstall<CR>
nmap <Leader>r :GoRename<CR>


"""" ALE
let g:ale_open_list = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_loclist_msg_format='%linter%: %code: %%s'
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ 'python': ['flake8'],
      \ 'c': ['clang'],
      \ 'cpp': ['clang'],
      \ }
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = '--ignore=E501,E226'
let g:ale_echo_cursor = 1
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
nmap <leader>a <Plug>(ale_go_to_definition)zz
nmap <leader>r <Plug>(ale_find_references)
nmap <Leader>s :ALEToggle<CR>
nnoremap <leader>ep :ALEPreviousWrap<CR>
nnoremap <leader>en :ALENextWrap<CR>
let g:ale_c_clang_options = ''

"""
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#squelch_py_warning = 1
let g:jedi#goto_assignments_command = "<Leader>g"
let g:jedi#goto_command = "<C-]>"
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0
let g:jedi#usages_command = "<leader>r"
let g:jedi#rename_command = ""
let g:jedi#force_py_version = 3
set noshowmode
