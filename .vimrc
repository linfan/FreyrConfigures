" ============================================================================
"  Author: LinFan
"  Email: linfan.china@gmail.com
"  Date: 2013-04-18
" ============================================================================

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


" Use Django Template format render .html file
" This line must be put at the first line
au BufNewFile,BufRead *.html setf htmldjango

" ============================================================================
" Display setting
" ============================================================================
" Color scheme
"colorscheme evening         " Dark night
colorscheme blackboard       " Blackboard
"colorscheme koehler         " Miner's lamp
"colorscheme elflord         " Fairy

"set background=dark         " Use black ground
set guifont=Monaco:h10       " Font & size

" Encode setting
"set enc=chinese             " Use Chinese encode
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"set helplang=cn             " Use Chinese in help page
"set formatoptions=tcrqn     " Auto-formating
"set linebreak               " Don't break a line at the mid of a word
"set formatoptions+=mM       " To handle Chinese correctly

" ============================================================================
" Editor basic setting
" ============================================================================
set nocompatible             " Disable vi compatible mode
set tabstop=4                " Set tab width
set softtabstop=4            " Tab align position
set shiftwidth=4             " Use tab as 4 spaces
set expandtab                " Use spaces instead of tab
"set smarttab                 " Allow use real tab symbol at the begin/end of line
set autoindent               " Auto-align to previous line when creating new line
set backspace=2              " Make backspace working correctly
set cindent shiftwidth=4     " Use c-style indent, 4 spaces
set smartindent              " Use smart indent
set ai                       " Use auto-indent
set nu                       " Show line number
set noerrorbells             " Disable belling when error operation
set novisualbell             " Disable cursor winking
set showmatch                " Show bracket match
set matchtime=5              " Bracket match delay（Unit: 1/10 second）
set mouse=a                  " Enable mouse (May cause uncompatible with tmux)
set ruler                    " Show cursor position on bottom-right side
set hlsearch                 " Enable search highlight
set incsearch                " Enable real-time search match
set nowrapscan               " Disable search from begin when reaching file end
"set vb t_vb=                " Disable prompt tone (May cause screen twinkling on Windows)
set hidden                   " Allow switch buffer while current buffer unsaved
set list                     " Show tab symbol as a '|'
set listchars=tab:\|\ ,
set wildmenu                 " Enhance command auto-complete
set clipboard=unnamed        " Use system clipboard
"set whichwrap+=<,>,h,l      " Enable cursor move to non-text area
set scrolloff=5              " Scroll the window when cursor reach 5 lines approaching to the up/down edge
"set ignorecase               " Use case insensitive search
"set smartcase                " Use case sensitive search, if there is any upper case letter in search string
set autoread                 " Quto re-read when file is changed from the outside

syntax enable                " Enable syntax highlight
syntax on                    " Enable syntax detect according to file type
filetype indent on           " Enable plugin to change indent style according to file type
filetype plugin on           " Enable plugin to detect file type
filetype plugin indent on    " Enable auto-complete

set writebackup              " Enable cache file (Temporary backup file, remove when file closed correctly)
set nobackup                 " Disable auto backup file
set autochdir                " Set current folder as file browser path
set nowrap                   " Disable line wrap
set history=1000             " Maximal command number of history record
set winaltkeys=no            " No use Alt-? key to open menu

set foldenable               " Enable code-fold
set foldlevel=100            " Maximal fold level
" Fold type
"set foldmethod=manualset    " manually fold only
set foldmethod=syntax        " fold by code syntax
"set foldmethod=indent       " fold by code indent
" Use space to fold/unfold code
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

if has("gui_running")
    au GUIEnter * simalt ~x  " Maximize window when startup
    "winpos 20 20            " Set window appear position, set to top-left corner
    "set lines=20 columns=90 " Set window size, lines for heigh，columns for width
    "set guioptions-=m       " Hide menu bar
    "set guioptions-=T       " Hide tool bar
    "set guioptions-=L       " Hide left scroll bar
    "set guioptions-=r       " Hide right scroll bar
    "set guioptions-=b       " Hide bottom scroll bar
    "set showtabline=0       " Hide tab bar
    
    " Solve menu messy code
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " Solve console output messy code
    language messages zh_CN.utf-8
endif

" ============================================================================
" Status bar setting
" ============================================================================
set laststatus=2             " Enable status message
set cmdheight=2              " Set status bar heigh to 2 (default is 1)

" ============================================================================
" Auto script
" ============================================================================
" TxtBrowser -- Highlight txt file
au BufRead,BufNewFile *.txt setlocal ft=txt

" Add underline on the 120th char on each line
au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%121v/

" Remember cursor position when quit
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

" Highlight current line
"set cursorline
" Highlight current line in edit mode only
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" ============================================================================
" quote & brackets auto-match
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
" MiniBufExplorer setting -- multi buffer switcher
" ============================================================================
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" ============================================================================
" cscope setting
" ============================================================================
" add any cscope database in current directory and environment variable
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" Add a ctags datebase
nmap <c-x>p :cs add ./

" cscope shortcuts
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>    " Maybe no working
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" Generate cscope file under current folder
nmap <c-x><c-p> :!cscope -Rbq <CR>

" ============================================================================
" ctags setting
" ============================================================================
" Use tags file on current folder and environment variable
if filereadable("tags")
    set tags=tags
elseif $CTAGS_DB != ""
    set tags=$CTAGS_DB
endif
" Use public tags
"set tags+=~/.vim/systags

" Add a ctags datebase
nmap <c-x>g :set tags+=./

" Generate ctags file under current folder, recommanded by omnicppcomplete
nmap <c-x><c-g> :!ctags -R --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ============================================================================
" Tag list setting
" ============================================================================
let Tlist_Show_One_File=1                    " Only show tags in current file
let Tlist_Exit_OnlyWindow=1                  " Quit vim if Taglist is the last window
let Tlist_Use_Right_Window=1                 " Show tags window on the right side
let Tlist_File_Fold_Auto_Close=1             " Auto-fold，or Tlist_File_Auto_Close
let Tlist_GainFocus_On_ToggleOpen = 1        " Move cursor to TList window when opening

" Use 'tl' open Taglist window
nmap tl :Tlist<CR><c-l>

" Use F11 open Taglist window
imap <silent> <F11> <esc>:TlistToggle<CR>
nmap <silent> <F11> :TlistToggle<CR>

" ============================================================================
" TagBar setting
" ============================================================================
nmap tb :TagbarToggle<CR><c-l>               " Use 'tb' toggle TagBar window
let g:tagbar_ctags_bin = 'ctags'             " Set tag program name
let g:tagbar_width = 30                      " TagBar window width
let g:tagbar_autofocus = 1                   " Move cursor to TagBar window when opening

" Use F11 open Tagbar window
"imap <silent> <F11> <esc>:TagbarToggle<CR>
"nmap <silent> <F11> :TagbarToggle<CR>

" ============================================================================
" SrcExpl setting
" ============================================================================
" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" Set "" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<]>" 
" Set "" key for back from the definition context 
let g:SrcExpl_gobackKey = "<[>" 
" In order to Avoid conflicts, the Source Explorer should know what plugins are using buffers.
" And you need add their bufname into the list below according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 
" Enable/Disable the local definition searching, and note that this is not guaranteed to work
let g:SrcExpl_searchLocalDef = 1 
" Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 
" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to create/update the tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files" 
" Set "" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<!>" 
" Set "<>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<{>" 
" Set "<>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<}>" 

" Use 'se' open Source Explorer
nmap sc :SrcExplToggle<CR>

" Use F12 open SrcExpl window
imap <silent> <F12> <esc>:SrcExplToggle<CR>
nmap <silent> <F12> :SrcExplToggle<CR>

" ============================================================================
" NERD_tree setting
" ============================================================================
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos=0	" 0 to show NERDtree window on left, 1 to show on right

" Use 'nt' open NERD_tree
nmap nt :NERDTreeToggle<CR>

" Use F10 open NERD_tree
imap <silent> <F10> <esc>:NERDTreeToggle<CR>
nmap <silent> <F10> :NERDTreeToggle<CR>

" ============================================================================
" buf explorer setting
" ============================================================================
let g:bufExplorerFindActive=1
let g:bufExplorerReverseSort=0
let g:bufExplorerShowDirectories=1
let g:bufExplorerShowRelativePath=0
let g:bufExplorerShowTabBuffer=0
let g:bufExplorerShowUnlisted=0
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitOutPathName=1
let g:bufExplorerSplitRight=1
autocmd BufWinEnter \[Buf\ List\] setl nonumber

" Use F9 open BufExplorer
imap <silent> <F9> <esc>:BufExplorer<CR>
nmap <silent> <F9> :BufExplorer<CR>

" ============================================================================
" LoadTemplate & AuthorInfoDetect setting -- File templates
" ============================================================================
" :LoadTemplate setting
let g:template_path='/home/freyr/.vim/template/'     " Please modify the templates file here

" Ctrl-X Ctrl-T load file template according to file extension
nmap <c-x><c-t> <ESC>:LoadTemplate<CR><ESC>Gi

" :AuthorInfoDetect setting (offered by NERD_commenter & authorinfo)
let g:vimrc_author='LinFan'
let g:vimrc_email='linfan.china@gmail.com'
let g:vimrc_homepage=''

" Ctrl-X Ctrl-E auto add file header with author information
nmap <c-x><c-e> <ESC>:AuthorInfoDetect<CR><ESC>Gi

" ===========================================================================
" window, buffer and tab setting
" ============================================================================

" Use Ctrl + Up/Down/Left/Right to switch window
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

" Use Shift + Left/Right to swith tab
"nmap <S-left> :tabprevious<cr>  " Previous Tab
"nmap <S-right> :tabnext<cr>     " Next Tab
" Use Shift + Left/Right to swith buffer
nmap <S-left> :bp<cr>            " Previous Buf
nmap <S-right> :bn<cr>           " Next Buf

" Creat new tab or Open file in new tab
nmap <c-x><c-n> :tabnew<CR>
nmap <c-x><c-o> :tabnew ./

" Use Alt + number to switch tab
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
noremap <c-x>1 1gt
noremap <c-x>2 2gt
noremap <c-x>3 3gt
noremap <c-x>4 4gt
noremap <c-x>5 5gt
noremap <c-x>6 6gt
noremap <c-x>7 7gt
noremap <c-x>8 8gt
noremap <c-x>9 9gt
noremap <c-x>0 10gt

" ============================================================================
" Other shortcuts
" ============================================================================

" Swith text mode and hex mode
nmap <c-x><c-h> :%!xxd -g 1<CR>
nmap <c-x><c-d> :%!xxd -r<CR>

" Shift + Up/Down to switch two lines
nmap <S-down> :<C-u>move .+1<CR>
nmap <S-up> :<C-u>move .-2<CR>
imap <S-down> <Esc>:<C-u>move .+1<CR>
imap <S-up> <Esc>:<C-u>move .-2<CR>
vmap <S-down> :move '>+1<CR>gv
vmap <S-up> :move '<-2<CR>gv

" Enable 'Enter' key on normal-mode
nmap <CR> i<CR><ESC>k$

" Use Alt + o Create new line and stay in normal-mode
nmap <A-o> o<ESC>

" Reload .vimrc configure without restart vim
nmap <c-x><c-v> :source ~/.vimrc<CR>

" F2 Switch search highlight
imap <silent> <F2> <esc>:set hlsearch!<CR>
nmap <silent> <F2> :set hlsearch!<CR>

" F3 Swith line wrap
nmap <F3> :set wrap!<CR>
imap <F3> <Esc>:set wrap!<CR>

" F4 Swith auto-indent when pasting
set pastetoggle=<F4>

" F5 Swith show line number
"nmap <F5> :set nu!<CR>
"imap <F5> <Esc>:set nu!<CR>

" F11 Switch full screen
map <F11> <Esc>:simalt ~x<CR>

" Check spell，For VIM7 only
"nmap <C-F11> :setlocal spell!<CR>
"imap <C-F11> <Esc>:setlocal spell!<CR>

" ============================================================================
" Compile & Run
" ============================================================================

" Compile source code
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

" Run compiled code
func! RunCode()
        exec "w"
        if &filetype == "c" || &filetype == "cpp" || &filetype == "haskell"
            " For Windows: exec "! %<.exe"
            exec "! ./%<" 
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

" Ctrl+X Ctrl+C Compile current file
nmap <c-x><c-b> :call CompileCode()<CR>
imap <c-x><c-b> <ESC>:call CompileCode()<CR>
vmap <c-x><c-b> <ESC>:call CompileCode()<CR>

" Ctrl+X Ctrl+R Run compiled file
nmap <c-x><c-r> :call RunCode()<CR>
imap <c-x><c-r> <ESC>:call RunCode()<CR>
vmap <c-x><c-r> <ESC>:call RunCode()<CR>

