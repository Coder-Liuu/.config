" 自动加载
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -flo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "

exec "nohlsearch"
syntax on
set number
set cursorline
set nowrap   " 自动换行
set showcmd  " 显示指令
set wildmenu " 补全菜单
set hlsearch " 高亮搜索
set incsearch " 动态高亮
set ignorecase " 不区分大小写
set smartcase  " 智能大小写
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" set list " 显示行尾空格
" set listchars=tab:▸\ ,trail:▫
set scrolloff=3
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set undofile                " 持久行撤销
set undodir=~/.temp
set showmatch
set clipboard=unnamedplus " 设置是否和系统共用一个剪贴板
" !!!错误提示栏
set signcolumn=yes
set path=.,/usr/include,./*,

" =============
" 键位设置
" =============
map R :source $MYVIMRC<CR>
map Q :q<CR>
map ; :
"map s <nop>
map sV <c-w>t<C-w>H
map sH <C-w>t<C-w>K

noremap S :w<CR>
noremap Eh :tabe<CR>
noremap Ej :+tabnext<CR>
noremap Ek :-tabnext<CR>
noremap J 5j
noremap K 5k
noremap L 7l
noremap H 7h
noremap j gj
noremap k gk
noremap ,j J
noremap EJ oexit(0)<ESC>

noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <leader>al :e ~/.config/alacritty/alacritty.yml<CR>
noremap <leader>nb :e ~/.bashrc<CR>
noremap ,c ggVG"+y
noremap Y yyp
inoremap jk <ESC>
vnoremap N :norm
vnoremap ,y "+y
vnoremap ,x "+ygvd

noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap <C-g> :tabe<CR>:term lazygit<CR>i
noremap sd "_d
noremap <C-q> <C-a>
noremap <leader>[ :tabp<CR>:NERDTreeMirror<CR>
noremap <leader>] :tabn<CR>:NERDTreeMirror<CR>
noremap <leader>n :tabnew<CR>:NERDTreeMirror<CR>
noremap <leader>c :tabc<CR>
noremap <leader>o :tabo<CR>

autocmd FileType markdown inoremap /cp ```python<CR>```<CR><CR><++><Esc>3ko
autocmd FileType markdown inoremap .cc ```cpp<CR>```<CR><CR><++><Esc>3ko
autocmd FileType markdown inoremap .cy ```yml<CR>```<CR><CR><++><Esc>3ko
autocmd Filetype markdown inoremap .f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap .p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap .a [](<++>) <++><Esc>F[a
autocmd Filetype Python set tabstop=4 set shiftwidth=4 set softtabstop=4

call plug#begin("~/.vim-plug")
Plug 'connorholyday/vim-snazzy'
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdtree',{ 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'tell-k/vim-autopep8'
Plug 'voldikss/vim-floaterm'
"Plug 'drmingdrmer/vim-tabbar'
Plug 'bagrat/vim-buffet'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdcommenter'
Plug 'anyakichi/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'andrewradev/switch.vim'

" 指出错误 Python
"Plug 'dense-analysis/ale'
" 指出错误 CPP
"Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/vim-cursorword'
" 更改记录
Plug 'mhinz/vim-signify'
" ! 读文档
Plug 'Chiel92/vim-autoformat'
" Markdown预览
Plug 'iamcco/mathjax-support-for-mkdp',{'for' :['markdown']}
Plug 'iamcco/markdown-preview.vim'
call plug#end()

" =============
" Markdown预览
" =============
nmap <silent> so <Plug>MarkdownPreview        " for normal mode
nmap <silent> sc <Plug>StopMarkdownPreview    " for normal mode
let g:mkdp_browser = 'firefox'
" 自动刷新
let g:mkdp_refresh_slow = 1
" 自动关闭文件
let g:mkdp_auto_close = 1


" =============
" 代码格式化
" =============
noremap <F3> :Autoformat<CR>
let g:python3_host_prog='/opt/anaconda/bin/python'
let g:formatter_yapf_style = 'pep8'
let g:formatdef_my_cpp = '"astyle --style=attach --pad-oper --lineend=linux"'
let g:formatters_cpp = ['my_cpp']

" =============
" ale  and syntastic
" =============
"let g:ale_linters = {
      "\   'python': ['pylint'],
"\}
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
"" syntastic
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_style_error_symbol = '!'
"let g:syntastic_style_warning_symbol = '?'

" =============
" UltiSnips
" =============
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-o>"
let g:UltiSnipsSnippetsDir=["~/.config/nvim/UltiSnips/"]


" =============
" Ncm2
" =============
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect


" =============
" Color
" =============
let g:SnazzyTransparent = 1
color snazzy
let g:python_highlight_all = 1
hi pythonBoolean guifg=#8DA5ED
hi pythonFunction guifg=#00FF66 gui=None
hi pythonFunctionCall guifg=#00FF66 gui=None


" =============
" nerdtree
" =============
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map T :NERDTreeToggle<CR>
let NERDTreeDirArrows=1

" =============
" NerdComment
" =============
map <C-t> ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


" =============
" :Autoformat
" =============
map <leader>5 :Autoformat<CR>

" =============
" Repeat
" =============
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" =============
" 浮动窗口
" =============
nmap s1 :FloatermNew<CR>
nmap s2 :FloatermToggle<CR>

let g:buffet_always_show_tabline = 1
let g:buffet_show_index = 1
let g:buffet_right_trunc_icon = ">"

" =============
" Bar
" =============
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>


" 异步编译
noremap ,e :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    CocCommand flutter.run -d iPhone\ 11\ Pro
    CocCommand flutter.dev.openDevLog
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  endif
endfunc
