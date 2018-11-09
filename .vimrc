" -----------说明
"  <C-n> :command <CR> Crtl+n trigger command
"
"
"
"
"  ---------------
set nocompatible              " be iMproved, required
filetype off                  " required

" --------------------------vim settings
set hls
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/zsh
set splitbelow
set modifiable
set completeopt=menu,menuone,preview
set pumheight=20
set showcmd
set showmode 
set laststatus=2 
set guioptions=''
se cursorline
syntax enable
set background=light
colorscheme solarized
hi Search ctermbg=LightYellow
hi Search ctermfg=Blue
hi CursorLineNr ctermfg=220
set ts=2 sw=2 et
" set background=dark           " Background color
" set t_Co=256
set guifont=Source\ Code\ Pro\ Light:h13
" colorscheme solarized
" colorscheme desert
filetype plugin indent on

" --------------------------shortcut
"nnoremap <F5> :YcmForceCompileAndDiagnostics
nnoremap <C-g> :YcmCompleter GoToDefinition<CR>
nnoremap <C-e> <Esc> $a
nnoremap <C-a> <Esc>^i 
inoremap <C-e> <Esc> $a
inoremap <C-a> <Esc>^i
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>O
"inoremap ((     (
"inoremap ()     ()
" ------------------------- variable
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:clang_snippets=1
"let g:clang_conceal_snippets=1
"let g:clang_snippets_engine='clang_complete'
"let g:ycm_goto_buffer_command = 'new-tab'
let g:ophigh_color_gui = "#F6FF00"
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_start_level = 2 
let g:indent_guides_guide_size = 1 
let g:indent_guides_tab_guides = 1
" --------------------------- 调用插件
call vundle#begin()
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_python_binary_path = '/Library/Frameworks/Python.framework/Versions/3.6/bin/python3'
"let g:ycm_autoclose_preview_window_after_completion = 1
" #let g:ycm_server_python_interpreter = '/Library/Frameworks/Python.framework/Versions/3.6/bin/python3'
"let g:ycm_autoclose_preview_window_after_completion= 1
"let g:ycm_always_populate_location_list = 1

" ---------------------------- Plugin list
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" --------- Git flag
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "Deleted",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ---------- Nerdtree
" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" map a specific key or shortcut to open NERDTree
let mapleader = ','
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
map <leader>c  :NERDTreeCWD<CR>
map <leader>s :NERDTreeRefreshRoot<CR>
  " Switch tab {{{

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
"                                           " }}}


" switch tab 
map <S-k> :tabn <CR>
map <S-l> :tabp <CR>
" close other tab
map <S-p>a :tabo <CR>
map <S-p>s :tabc <CR>
" list all tabs
map <S-p>l :tabs <CR>
" switch pane 
map <S-h> <C-W><C-H> <CR>
map <S-k> <C-W><C-J> <CR>
map <S-j> <C-W><C-K> <CR>
map <S-l> <C-W><C-L> <CR>
" create pane
map <S-n> :tabnew <CR>
" adjust pane size
map + <C-w>+ <CR>
map - <C-w>- <CR>
map > <C-w>> <CR>
map < <C-w>< <CR>
" adjust pane point
map <S-p> <C-w>r <CR>
"
map <S-p>t <C-W>T <CR>
nnoremap <silent> vv <C-w>v

" NERDTress File highlighting
"let NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('sh', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('go', 'Magenta', 'none', '#ff00ff', '#151515')

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

nmap <Leader>gc :GoErrCheck<CR>
nmap <Leader>gb :GoBuild<CR>
nmap <Leader>gd :GoDoc<CR>
nmap <Leader>gt :GoTest<CR>
nmap <Leader>gi :GoInstall<CR>
nmap <Leader>gr :GoRename<CR>

function! OnGolangCompleteDone()
  if !exists('v:completed_item') || empty(v:completed_item)
    return
  endif

  let complete_str = v:completed_item.word
  if complete_str == ''
    return
  endif

  let line = getline('.')
  let next_char = line[col('.')-1]
  if  next_char == "("
    return
  end
  let cur_char =line[col('.')-2]

  let abbr = v:completed_item.abbr
  let startIdx = match(abbr,"(")
  let endIdx = match(abbr,")")
  if endIdx - startIdx > 1
    let argsStr = strpart(abbr, startIdx+1, endIdx - startIdx -1)
    let argsList = split(argsStr, ",")
    let snippet = ""
    if cur_char != "("
      let snippet = "("
    end
    let c = 1
    for i in argsList
      if c > 1
        let snippet = snippet. ", "
      endif
      " strip space
let arg = substitute(i, '^\s*\(.\{-}\)\s*$', '\1', '')
let snippet = snippet . '${'.c.":".arg.'}'
let c += 1
endfor
let snippet = snippet . ")$0"
call UltiSnips#Anon(snippet)
endif
endfunction


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
