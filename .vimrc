" ============================================================================
"  Author: LinFan
"  Email: linfan.china@gmail.com
"  Date: 2013-03-20
" ============================================================================


" Ctrl + ]                   --转到函数定义
" Ctrl + T                   --返回调用函数
" Ctrl + E                   --一步加载语法模板和作者、时间信息

" <C-P>                      --单词补全
" <C-X><C-L>                 --整行补全
" Tab键                      --插入模式下的全功能语法结构补全 [snipMate插件]
" Shift + Insert             --向Vim中粘贴从别处复制的内容

" u [小写]                   --单步复原 [非插入模式]
" U [大写]                   --整行复原 [非插入模式]

" nt                         --打开NERDTree [非插入模式]
" tl                         --打开TagList [非插入模式]
" tb                         --打开TagBar [非插入模式]

" za                         --打开或关闭当前折叠
" zM                         --关闭所有折叠
" zR                         --打开所有折叠

" :set syntax=cpp            --手动选择语法高亮 [或 :set filetype=cpp]

" :%!xxd                     --转储二进制文件，以十六进制形式显示
" :%!xxd -r                  --还原二进制文件


" ---------- 主要插件详细用法说明 ---------------------

" :Tlist                     --呼出变量和函数列表 [TagList插件]
" :LoadTemplate              --呼出语法模板 [Load_Template插件]
" :AuthorInfoDetect          --添加作者、时间等信息 [NERD_commenter && authorinfo插件]

" ---------- Taglist [代码结构分析] -------------------
"
" 默认在Vim的运行目录下找 "tags" 文件
" :set tags=文件路径         --命令设定标签文件的路径
" :ta 标签                   --跳转到指定名称标签
" Ctrl + ]                   --跳转到光标下标签的定义处
" Ctrl + t                   --回到跳转前的位置

" ---------- a.vim [自动切换C/C++同名头文件] ----------
"
" :A                         --切换同名头文件并独占整个屏幕
" :AS                        --切换同名头文件并垂直分屏，头文件在上
" :AV                        --切换同名头文件并水平分割，头文件在左

" ---------- mark.vim [追踪高亮指定关键字] ------------
"
" \m                         --normal模式下，在想要高亮的单词上面敲击\m即可高亮或取消高亮该单词
" \r                         --使用正则表达式添加标记
" \n                         --移除当前光标位置颜色标记
" \/ 和 \?                   --跳转到下一个/上一个任意标记
" \* 和 \#                   --跳转到下一个/上一个当前光标下的颜色标记，并将起设为<Last mark>
" * 和 #                     --跳转到下一个/上一个<Last mark>
" :Mark                      --取消所有高亮
" :Mark abc                  --指定高亮单词 abc 或取消高亮 abc

" ---------- BufferExplorer [buffer管理工具] ---------
"
" \be                        -- (normal open)  
" \bs                        -- (force horizontal split open) 
" \bv                        -- (force vertical split open) 
" Enter                      --在Buffer窗口，打开光标下的标签
" d                          --在Buffer窗口，关闭光标下的标签
" q                          --在Buffer窗口，关闭Buffer窗口

" ---------- BERDCommenter [C/C++注释工具] ------------
"
" \ci                        --逐行注释/取消注释代码段
" \c<Space>                  --注释/取消注释代码段
" \ca                        --在 // 和 /* */ 方式切换

" ---------- NERDTree [智能文件浏览器] ----------------
"
" :NERDTree                  --启动NERDTree插件
" o [小写]                   --切换当前文件或目录的打开、关闭状态
" u                          --打开上层目录
" p [小写]                   --返回上层目录
" P [大写]                   --返回根目录
" K                          --转到当前目录第一个节点
" J                          --转到当前目录最后的节点
" m                          --显示文件系统菜单 [增、删、移]
" ?                          --弹出帮助菜单
" q                          --退出该插件


" 将所有以.html结尾的文档以Django Template语法进行渲染
" 本配置语句必须放在所有配置的最前面
au BufNewFile,BufRead *.html setf htmldjango

" ============================================================================
" 显示设置
" ============================================================================
" 配色方案
"colorscheme evening         " 夜晚主题
colorscheme blackboard       " 黑板主题
"colorscheme koehler         " 矿灯主题
"colorscheme elflord         " 精灵主题

"set background=dark         " 背景使用黑色
set guifont=Monaco:h10       " 字体 && 字号

" 设置编码
"set enc=chinese             " 设置编码为中文
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"set helplang=cn             " 设置帮助的语言为中文
"set formatoptions=tcrqn     " 自动格式化
"set linebreak               " 单词不要在断行处,包括中文
"set formatoptions+=mM       " 正确处理中文字符的折行和拼接

" ============================================================================
" 编辑器基本设置
" ============================================================================
set tabstop=4                " 设置tab键的宽度
set softtabstop=4            " 使用tab补充空格的跨度
set shiftwidth=4             " 换行时行间交错使用4个空格
"set smarttab                " 在行和段开始处使用制表符
set expandtab                " 用空格代替制表符
set autoindent               " 自动对齐，继承前一行的缩进方式，特别适用于多行注释
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格，使用C样式的缩进
set smartindent              " 智能自动缩进
set ai                       " 设置自动缩进
set nu                       " 显示行号
set noerrorbells             " 不让vim发出滴滴声
set novisualbell             " 不要闪烁
set showmatch                " 显示括号配对情况
set matchtime=5              " 匹配括号高亮的时间（单位是十分之一秒）
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
"set vb t_vb=                " 关闭提示音，在Windows下会导致闪屏
set hidden                   " 允许在有未保存的修改时切换缓冲区
set list                     " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\ ,
set wildmenu                 " 增强模式中的命令行自动完成操作
set clipboard=unnamed        " 默认使用系统剪切板
"set whichwrap+=<,>,h,l      " 允许backspace和光标键跨越行边界
set scrolloff=5              " 设定光标离窗口上下边界 5 行时窗口自动滚动
"set ignorecase               " 搜索时忽略大小写
set smartcase                "但在有一个或以上大写字母时,仍保持对大小写敏感
set autoread                     " Set to auto read when a file is changed from the outside

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set writebackup              " 设置有缓存文件(临时备份文件,在文档保存后自动删除)
set nobackup                 " 设置无备份文件
set autochdir                " 设定文件浏览器目录为当前目录
set nowrap                   " 设置不自动换行
set foldlevel=100            " 禁止自动折叠
set history=1000             " 记录历史的行数
set winaltkeys=no            " Alt组合键不映射到菜单上

" 启用折叠
set foldenable
" 选择代码折叠类型
"set foldmethod=manualset    " 手动折叠，或写为manual
"set foldmethod=syntax       " 用语法高亮来定义折叠
set foldmethod=indent        " 更多的缩进表示更高级别的折叠(这个似乎效果好一些)
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

if has("gui_running")
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    "set guioptions-=m       " 隐藏菜单栏
    "set guioptions-=T       " 隐藏工具栏
    "set guioptions-=L       " 隐藏左侧滚动条
    "set guioptions-=r       " 隐藏右侧滚动条
    "set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
    
    " 解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " 解决consle输出乱码
    language messages zh_CN.utf-8
endif

" ============================================================================
" 状态栏设置
" ============================================================================
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2

" ============================================================================
" 自动化脚本
" ============================================================================
" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt

" 每行超过120个的字符用下划线标示
au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%121v/
"autocmd FileType c,cpp :match ErrorMsg /\%>80v.\+/

" 打开文件时光标自动到上次退出该文件时的光标所在位置
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

" 突出显示当前行
"set cursorline
" 高亮当前编辑的行
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" ============================================================================
" 引号 && 括号自动匹配
" ============================================================================
":inoremap ( ()<ESC>i

":inoremap ) <c-r>=ClosePair(')')<CR>

":inoremap { {}<ESC>i

":inoremap } <c-r>=ClosePair('}')<CR>

":inoremap [ []<ESC>i

":inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i

":inoremap > <c-r>=ClosePair('>')<CR>

":inoremap " ""<ESC>i

":inoremap ' ''<ESC>i

":inoremap ` ``<ESC>i

"function ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endf


" ============================================================================
" MiniBufExplorer     多个文件切换 可使用鼠标双击相应文件名进行切换
" ============================================================================
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" ============================================================================
" Tag list & ctags
" ============================================================================
let Tlist_Show_One_File=1                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠，或 Tlist_File_Auto_Close
let Tlist_GainFocus_On_ToggleOpen = 1        " 打开 TList 窗口时将光标移过来

"将当前的工程的tags导入
set tags=./tags
"将系统已经生成的tags导入
set tags+=~/.vim/systags

" tl 打开 Taglist [非插入模式]
map tl :Tlist<CR><c-l>

" Taglist 快捷键
"imap <silent> <F11> <esc>:TlistToggle<CR>
"nmap <silent> <F11> :TlistToggle<CR>

" ============================================================================
" TagBar
" ============================================================================
map tb :TagbarToggle<CR><c-l>                " 使用 tb 打开 TagBar 窗口
let g:tagbar_ctags_bin = 'ctags'             " 指定 tag 程序名称
let g:tagbar_width = 30                      " TagBar 窗口宽度
let g:tagbar_autofocus = 1                   " 打开 TagBar 后将光标移过来

" ============================================================================
" 文档模板
" ============================================================================
" :LoadTemplate 根据文件后缀自动加载模板
let g:template_path='/home/freyr/.vim/template/'  " 需要根据实际情况修改！

" :AuthorInfoDetect 自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author='LinFan'
let g:vimrc_email='fan.lin@tieto.com'
let g:vimrc_homepage='http://www.tieto.com'

" Ctrl + E 一步加载语法模板和作者、时间信息
map <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
imap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
vmap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi

" ============================================================================
" NERD_tree
" ============================================================================
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos=0	"1 让在右边显示文件浏览器的窗口

" nt 打开 NERDTree [非插入模式]
map nt :NERDTree<CR>

" NERD_tree 快捷键 
"imap <silent> <F10> <esc>:NERDTreeToggle<CR>
"nmap <silent> <F10> :NERDTreeToggle<CR>

" ============================================================================
" buf explorer
" ============================================================================
"let g:bufExplorerFindActive=1
"let g:bufExplorerReverseSort=0
"let g:bufExplorerShowDirectories=1
"let g:bufExplorerShowRelativePath=0
"let g:bufExplorerShowTabBuffer=0
"let g:bufExplorerShowUnlisted=0
"let g:bufExplorerSortBy='mru'
"let g:bufExplorerSplitBelow=1
"let g:bufExplorerSplitOutPathName=1
"let g:bufExplorerSplitRight=1
"autocmd BufWinEnter \[Buf\ List\] setl nonumber

" BufExplorer 快捷键 
"imap <silent> <F12> <esc>:BufExplorer<CR>
"nmap <silent> <F12> :BufExplorer<CR>

" ============================================================================
" 其他快捷键
" ============================================================================

" Shift + 上/下方向键 将当前行与上/下行交换
nmap <S-down> :<C-u>move .+1<CR>
nmap <S-up> :<C-u>move .-2<CR>
imap <S-down> <Esc>:<C-u>move .+1<CR>
imap <S-up> <Esc>:<C-u>move .-2<CR>
vmap <S-down> :move '>+1<CR>gv
vmap <S-up> :move '<-2<CR>gv

" 使用空格键跳到下一个空格位置 [非编辑模式]
"nmap <space> f 

" 普通模式下回车，将光标后面的内容移至下一行
nmap <CR> i<CR><ESC>k$

" Alt + o 建立新行并留在非编辑模式
nmap <A-o> o<ESC>

" Alt + i 从光标位置分行
nmap <A-i> i<CR><ESC>k$
imap <A-i> <CR><ESC>kA

" Ctrl + a 全选所有内容
"map <C-a> ggVG

" 设置快速不保存退出快捷键
"map <S-q><S-q> :q!<CR>:q!<CR>:q!<CR>

" 在normal模式下先后按下 ,s 重新加载.vimrc配置文件
nmap ,s :source ~/.vimrc<CR>

" 将上下左右键映射为 Tab 或 Buffer 跳转
"nmap <left> :tabprevious<cr>  "左一个Tab
"nmap <right> :tabnext<cr>     "右一个Tab
"nmap <up> :bn<cr>             "上一个Buf
"nmap <down> :bp<cr>           "下一个Buf

" 使用Alt+数字键切换Tab
if has("gui_running")
    noremap <M-1> 1gt
    noremap <M-2> 2gt
    noremap <M-3> 3gt
    noremap <M-4> 4gt
    noremap <M-5> 5gt
    noremap <M-6> 6gt
    noremap <M-7> 7gt
    noremap <M-8> 8gt
    noremap <M-9> 9gt
    noremap <M-0> 10gt
endif

" 窗口区域切换，Ctrl + 上/下/左/右 来切换
imap <silent> <C-left> <esc><C-W><left>
vmap <silent> <C-left> <esc><C-W><left>
nmap <silent> <C-left> <C-W><left>
imap <silent> <C-right> <esc><C-W><right>
vmap <silent> <C-right> <esc><C-W><right>
nmap <silent> <C-right> <C-W><right>
imap <silent> <C-up> <esc><C-W><up>
vmap <silent> <C-up> <esc><C-W><up>
nmap <silent> <C-up> <C-W><up>
imap <silent> <C-down> <esc><C-W><down>
vmap <silent> <C-down> <esc><C-W><down>
nmap <silent> <C-down> <C-W><down>

" F2 切换显示/隐藏搜索高亮
imap <silent> <F2> <esc>:set hlsearch!<CR>
nmap <silent> <F2> :set hlsearch!<CR>

" F3 切换自动换行
nmap <F3> :set wrap!<CR>
imap <F3> <Esc>:set wrap!<CR>

" F4 切换行号显示
nmap <F4> :set nu!<CR>
imap <F4> <Esc>:set nu!<CR>

" F5 切换粘贴模式切，切换打开/关闭自动缩进功，可以避免自动缩进的带来的格式影响
set pastetoggle=<F5>

" F11 切换全屏
map <F11> <Esc>:simalt ~x<CR>
" F12 还原窗口
"map <F12> <Esc>:set columns=80 lines=21<cr>

" 切换拼写检查，For VIM7 only
"nmap <C-F11> :setlocal spell!<CR>
"imap <C-F11> <Esc>:setlocal spell!<CR>

" omnicppcomplete 推荐的快捷键
map <C-F12> :!ctags -R --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ============================================================================
" 编译 && 运行
" ============================================================================

" 编译源文件
func! CompileCode()
        exec "w"
        if &filetype == "c"
            exec "!gcc -Wall -std=c99 %<.c -o %<"
        elseif &filetype == "cpp"
            exec "!g++ -Wall -std=c++98 %<.cpp -o %<"
        elseif &filetype == "java"
            exec "!javac %<.java"
        elseif &filetype == "haskell"
            exec "!ghc --make %<.hs -o %<"
        elseif &filetype == "lua"
            exec "!lua %<.lua"
        elseif &filetype == "perl"
            exec "!perl %<.pl"
        elseif &filetype == "python"
            exec "!python %<.py"
        elseif &filetype == "ruby"
            exec "!ruby %<.rb"
        endif
endfunc

" 运行可执行文件
func! RunCode()
        exec "w"
        if &filetype == "c" || &filetype == "cpp" || &filetype == "haskell"
            exec "! %<.exe"
            "For Linux: exec "! ./%<" 
        elseif &filetype == "java"
            exec "!java %<"
        elseif &filetype == "lua"
            exec "!lua %<.lua"
        elseif &filetype == "perl"
            exec "!perl %<.pl"
        elseif &filetype == "python"
            exec "!python %<.py"
        elseif &filetype == "ruby"
            exec "!ruby %<.rb"
        endif
endfunc

" Ctrl + C 一键保存、编译
"map <c-c> :call CompileCode()<CR>
"imap <c-c> <ESC>:call CompileCode()<CR>
"vmap <c-c> <ESC>:call CompileCode()<CR>

" Ctrl + R 一键保存、运行
"map <c-r> :call RunCode()<CR>
"imap <c-r> <ESC>:call RunCode()<CR>
"vmap <c-r> <ESC>:call RunCode()<CR>

