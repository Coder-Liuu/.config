" 自动加载
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -flo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "

syntax on         " 开启语法高亮
set number        " 显示行号
" set relativenumber " 显示从当前行数的前后行数
set cursorline    " 高亮显示当前行
set wrap        " 自动换行
set showcmd       " 显示指令
set wildmenu      " 补全菜单
set hlsearch      " 高亮搜索
set incsearch     " 动态高亮
set ignorecase    " 不区分大小写
set smartcase     " 智能大小写
set nocompatible  " 丢弃Vi功能
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8 " 文件编码
let &t_ut=''       " 有些终端可能配色不行
set expandtab      " 下面四行，是把缩进改成2割空格
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=3    " 光标最多到达倒数第三行
set tw=0
set indentexpr=
set backspace=indent,eol,start  " 退格键可以从行头退到行尾
set foldmethod=indent           " 代码折叠有关
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " 光标样式有关
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2                " 状态栏=2
set autochdir                   " Vim执行东西在当前目录
set undofile                    " 持久撤销
set undodir=~/.temp             " 撤销的文件路径
set showmatch                   " 显示括号匹配
set clipboard=unnamedplus       " 设置是否和系统共用一个剪贴板
set signcolumn=yes              " !!!错误提示栏
set hidden

" =============
" 键位设置
" =============
map R :source $MYVIMRC<CR>
map Q :q<CR>
map ; :
map sV <c-w>t<C-w>H   " 水平分屏切换为竖直分屏"
map sH <C-w>t<C-w>K   " 竖直分屏切换为水平分屏"

inoremap jk <ESC>
vnoremap N :norm
vnoremap ,y "+y
vnoremap ,x "+ygvd
noremap S :w<CR>
noremap Eh :tabe<CR>  " 标签页的操作
noremap Ej :+tabnext<CR>
noremap Ek :-tabnext<CR>
noremap J 5j          " 快速移动
noremap K 5k
noremap L 7l
noremap H 7h
noremap j gj
noremap k gk
noremap ,j J
noremap ,c ggVG"+y
noremap sd "_d
noremap Y yyp

noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <leader>al :e ~/.config/alacritty/alacritty.yml<CR>
noremap <leader>nb :e ~/.bashrc<CR>

noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <right> :vertical resize+5<CR>
noremap <left> :vertical resize-5<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap <C-g> :tabe<CR>:term lazygit<CR>i
noremap <leader>n :tabnew<CR>:NERDTreeMirror<CR>
noremap <C-w> <C-a>
noremap <leader>x :bd<CR>
noremap sq :q!<CR>
tnoremap <ESC> <C-\><C-n>

" =============
" S开头的大命令
" =============

map s9 :!nautilus . &<CR><CR>
map s0 :Autoformat<CR> " :Autoformat 需要插件
map s1 :TagbarToggle<CR> 实现大纲  " 需要ctags

" =============
" 开始自动执行的命令
" =============
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au Filetype Python set tabstop=4 set shiftwidth=4 set softtabstop=4
noremap EJ oexit(0)<ESC>

let g:python3_host_prog='/opt/anaconda/bin/python3'

call plug#begin("~/.vim-plug")
" =============
" 基本必备
" =============
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdcommenter'
Plug 'anyakichi/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'andrewradev/switch.vim'
Plug 'itchyny/vim-cursorword'
"Plug 'bagrat/vim-buffet'
Plug 'lambdalisue/suda.vim'
Plug 'mg979/vim-xtabline'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'lilydjwg/colorizer'

" =============
" 自动补全系列
" =============
" Ncm2
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-jedi'
" COC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
 
" =============
" 代码片段
" =============
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" =============
" 文件树
" =============
Plug 'preservim/nerdtree',{ 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'   " VIm显示图标

" =============
" 其他插件
" =============
Plug 'vim-python/python-syntax'
Plug 'voldikss/vim-floaterm'   " 浮动窗口
Plug 'mhinz/vim-signify'       " 更改记录
Plug 'Chiel92/vim-autoformat'  " ! 读文档

" =============
" Markdown
" =============
Plug 'iamcco/mathjax-support-for-mkdp',{'for' :['markdown']}
Plug 'iamcco/markdown-preview.vim'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'preservim/tagbar'


" =============
" 错误检查
" =============
"Plug 'dense-analysis/ale'   " 指出错误 Python
"Plug 'scrooloose/syntastic' " 指出错误 CPP
call plug#end()

" =============
" 快速移动easy-motion
" =============
nmap <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>F <Plug>(easymotion-overwin-f2)


" =============
" Sudo
" =============
noremap sw :w suda://%<CR>


" =============
" coc配置
" =============
set updatetime=500
let g:coc_global_extensions = ['coc-json', 
      \ 'coc-java',
      \ 'coc-vimlsp', 
      \ 'coc-python',
      \ 'coc-clangd',
      \ 'coc-translator']
inoremap <silent><expr> <c-n> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" 代码报错跳转
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 查看代码定义位置
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" 查看文档
nnoremap <silent> sr :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" =============
" Markdown预览
" =============
nmap <silent> so <Plug>MarkdownPreview        " for normal mode
nmap <silent> sc <Plug>StopMarkdownPreview    " for normal mode
let g:indentLine_concealcursor = ''  " 自动显示掩藏字符
let g:mkdp_refresh_slow = 1   " 自动刷新
let g:mkdp_auto_close = 1     " 自动关闭文件


" =============
" 代码格式化
" =============
"let g:formatter_yapf_style = 'pep8'
"let g:formatdef_my_cpp = '"astyle --style=attach --pad-oper --lineend=linux"'
"let g:formatters_cpp = ['my_cpp']

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
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect


" =============
" Color
" =============
let g:SnazzyTransparent = 1
color snazzy
noremap <leader>c1 :let g:SnazzyTransparent = 1<CR>:color snazzy<CR>
noremap <leader>c2 :let g:SnazzyTransparent = 0<CR>:color snazzy<CR>
let g:python_highlight_all=1
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
" Repeat
" =============
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" =============
" 浮动窗口
" =============
"nmap s1 :FloatermNew<CR>
"nmap s2 :FloatermToggle<CR>
"let g:buffet_always_show_tabline = 1
"let g:buffet_show_index = 1
"let g:buffet_right_trunc_icon = ">"

" =============
" Bar
" =============
"nmap <leader>1 <Plug>BuffetSwitch(1)
"nmap <leader>2 <Plug>BuffetSwitch(2)
"nmap <leader>3 <Plug>BuffetSwitch(3)
"nmap <leader>4 <Plug>BuffetSwitch(4)
"nmap <leader>5 <Plug>BuffetSwitch(5)
"nmap <leader>6 <Plug>BuffetSwitch(6)
"nmap <leader>7 <Plug>BuffetSwitch(7)
"nmap <leader>8 <Plug>BuffetSwitch(8)
"nmap <leader>9 <Plug>BuffetSwitch(9)
"nmap <leader>0 <Plug>BuffetSwitch(10)
nmap <Tab> ]b
nmap <S-Tab> [b
nmap <leader>1 1<BS>
nmap <leader>2 2<BS>
nmap <leader>3 3<BS>
nmap <leader>4 4<BS>
nmap <leader>5 5<BS>
nmap <leader>6 6<BS>
nmap <leader>7 7<BS>
nmap <leader>8 8<BS>
nmap <leader>9 9<BS>
nmap <leader>0 0<BS>
let g:xtabline_settings = {
      \ 'theme':                    'tomorrow',
      \ 'tabline_modes':            ['buffers'],
      \ 'buffer_filtering':         1,
      \}

" =============
" 一些函数
" =============

" 异步运行
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
    set splitbelow
    :sp
    :term java %:t:r
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 -W ignore %
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

let name = expand("%:r")
:nmap ,w :source %<CR>
:nmap ge :e %:r.in<CR>

" 编译C++
noremap ,q :call Compile()<CR>
func! Compile()
  exec "w"
  set splitbelow
  if &filetype == 'cpp'
    exec "!g++ -std=c++11 % -Wall -o %<"
      :sp
      :term ./%:r < %:r.in
  elseif &filetype == 'python'
    :sp
    :term python3 -W ignore %
  endif
endfunc

