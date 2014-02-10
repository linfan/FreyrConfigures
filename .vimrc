"=============================================================================
"     FileName: .vimrc
"         Desc: vim configure file
"       Author: LinFan
"        Email: linfan.china@gmail.com
"   LastChange: 2013-10-25 15:07:39
"=============================================================================

" Tips:
" Use 'set nu!' to trigger display line number
" Use 'set paste!' to trigger auto-indent when pasting
" Use 'set wrap!' to trigger line wrap

" ============================================================================
" Display setting
" ============================================================================
" Color scheme
"colorscheme evening            " Dark night
colorscheme blackboard         " Blackboard
"colorscheme koehler            " Miner's lamp
"colorscheme elflord            " Fairy

"set background=dark            " Use black ground
if has("gui_running")
    "set guifont=Monaco:h10     " Font & size
    set guifont=Monaco          " Font (font size setting not compatible well with vim-gtk)
endif

" Encode setting
"set enc=chinese                 " Use Chinese encode
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"set helplang=cn                 " Use Chinese in help page
"set formatoptions=tcrqn         " Auto-formating
"set formatoptions+=mM           " To handle Chinese correctly

" ============================================================================
" Editor basic setting
" ============================================================================
set nocompatible                " Disable vi compatible mode
set tabstop=4                   " Set tab width
set softtabstop=4               " Tab align position
set shiftwidth=4                " Use tab as 4 spaces
set linebreak                   " Don't break a line at the mid of a word
set expandtab                   " Use spaces instead of tab
"set smarttab                    " Allow use real tab symbol at the begin/end of line
set autoindent                  " Auto-align to previous line when creating new line
set backspace=eol,start,indent  " Make backspace working correctly
set cindent shiftwidth=4        " Use c-style indent, 4 spaces
set smartindent                 " Use smart indent
set ai                          " Use auto-indent
set nu                          " Show line number
set noerrorbells                " Disable belling when error operation
set novisualbell                " Disable cursor winking
"set vb t_vb=                   " Disable prompt tone (Will cause screen twinkling on Windows)
set showmatch                   " Show bracket match
set matchtime=5                 " Bracket match delay（Unit: 1/10 second）
set ruler                       " Show cursor position on bottom-right side
set hlsearch                    " Enable search highlight
set incsearch                   " Enable real-time search match
set nowrapscan                  " Disable search from begin when reaching file end
set hidden                      " Allow switch buffer while current buffer unsaved
set list                        " Show tab symbol as a '|'
set listchars=tab:\|\ ,
set wildmenu                    " Enhance command auto-complete
set clipboard=unnamed           " Use system clipboard
"set whichwrap+=<,>,h,l         " Enable cursor move to non-text area
set scrolloff=5                 " Scroll the window when cursor reach 5 lines approaching to the up/down edge
"set ignorecase                  " Use case insensitive search
"set smartcase                   " Use case sensitive search, if there is any upper case letter in search string
set autoread                    " Auto re-read when file is changed from the outside
set nopaste                     " Disable paste mode by default, in paste mode everything is inserted literally
set bsdir=buffer                " Set expolorer path as current path
set lz                          " Do not redraw, when running macros.. lazyredraw
set magic                       " Treat . and * as regular expression when search, see ':help magic' for detail

syntax enable                   " Enable syntax highlight
syntax on                       " Enable syntax detect according to file type
filetype plugin on              " Enable plugin to detect file type
filetype indent on              " Enable plugin to change indent style according to file type

set nowrap                      " Disable line wrap
set winaltkeys=no               " Don't use Alt-? key to open menu

if v:version >= 600
    "set mouse=a                 " Enable mouse (cause cannot copy text from Putty)
    set autochdir                " Set current folder as file browser path
    set foldenable               " Enable code-fold
    set foldlevel=100            " Maximal fold level
    " Fold type
    "set foldmethod=manualset    " manually fold only
    set foldmethod=syntax        " fold by code syntax
    "set foldmethod=indent       " fold by code indent
    " Use space to fold/unfold code
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
endif

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set writebackup                 " Enable cache file (Temporary backup file, remove when file closed correctly)
set nobackup                    " Disable auto backup file
"set nowritebackup              " No backup before overwriting a file
"set noswapfile                 " No swap file, all text will be in memory
set history=1000                " Maximal command number of history record

if v:version >= 703
    set undofile
    set undodir=$HOME/.vim/undodir   " Keep undo history permanent
    set undolevels=1000              " This value better the same as 'history' value
    set undoreload=10000
endif

" ============================================================================
" Status bar setting
" ============================================================================
set laststatus=2             " Always show status message
set cmdheight=1              " Set status bar heigh to 1

" ============================================================================
" Auto script
" ============================================================================
" TxtBrowser -- Highlight txt file
autocmd BufRead,BufNewFile *.txt setlocal ft=txt

" Add underline on the 120th char on each line
autocmd BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%121v/

" Remember cursor position when quit
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

" Highlight current line
"set cursorline
" Highlight current line in edit mode only
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" ============================================================================
" cscope setting
" ============================================================================
" add any cscope database in current directory and environment variable
"if filereadable("cscope.out")
"    cs add cscope.out
"elseif $CSCOPE_DB != ""
"    cs add $CSCOPE_DB
"endif

" Add a cscope datebase
nmap <c-x>p :cs add ./
" Generate cscope file under current folder
nmap <c-x><c-p> :!cscope -Rbq <cr><cr>:cs add ./cscope.out<cr>

" cscope shortcuts
" cscope shortcuts
" s[ymbol]   => find all references to the token under cursor
" g[lobal]   => find global definition(s) of the token under cursor
" c[alls]    => find all calls to the function name under cursor
" t[ext]     => find all instances of the text under cursor
" e[grep]    => egrep search for the word under cursor
" f[ile]     => open the filename under cursor
" i[ncludes] => find files that include the filename under cursor
" [calle]d   => find functions that function under cursor calls
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<cr><cr>

" ============================================================================
" ctags setting
" ============================================================================
" Use tags file on current folder and environment variable
" ctags operations:
" :tag <NAME>        => jump to first definition of tag <NAME>
" :tn[ext]           => jump to next definition
" :tp[revious]       => jump to previous definition
" :tf[irst]          => jump to first definition
" :tl[ast]           => jump to last definition
" :ts[elect] <NAME>  => list all definition of tag <NAME>

if filereadable("tags")
    set tags=tags
elseif $CTAGS_DB != ""
    set tags=$CTAGS_DB
endif
" Use public tags
"set tags+=~/.vim/systags

" Add a ctags datebase
nmap <c-x>g :set tags+=./

" Generate ctags file under current folder
nmap <c-x><c-g> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr><cr>

" ============================================================================
" OmniCppComplete
" ============================================================================
"let OmniCpp_ShowScopeInAbbr = 0              " Don't show scope in abbreviation
"let OmniCpp_ShowAccess = 1                   " Show access information ('+', '#', '-') in the popup menu
"let OmniCpp_NamespaceSearch = 1              " Search namespaces in the current buffer
"let OmniCpp_GlobalScopeSearch = 1            " Enable the global scope search
"let OmniCpp_ShowPrototypeInAbbr = 1          " Show function parameters
"let OmniCpp_MayCompleteDot = 1               " Autocomplete after .
"let OmniCpp_MayCompleteArrow = 1             " Autocomplete after ->
"let OmniCpp_MayCompleteScope = 1             " Autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=preview,menuone              " Use a popup menu even there is only one match

" ============================================================================
" Tag list setting
" ============================================================================
let Tlist_Show_One_File=1                    " Only show tags in current file
let Tlist_Exit_OnlyWindow=1                  " Quit vim if Taglist is the last window
let Tlist_Use_Right_Window=1                 " Show tags window on the right side
let Tlist_File_Fold_Auto_Close=1             " Auto-fold，or Tlist_File_Auto_Close
let Tlist_GainFocus_On_ToggleOpen = 1        " Move cursor to TList window when opening

" Use '\tl' open Taglist window
nmap <leader>tl :Tlist<cr>

" Use F7 open Taglist window
"imap <silent> <F7> <esc>:TlistToggle<cr>
"nmap <silent> <F7> :TlistToggle<cr>

" ============================================================================
" TagBar setting
" ============================================================================
" Use '\tb' toggle TagBar window
nmap <leader>tb :TagbarToggle<cr>
let g:tagbar_ctags_bin = 'ctags'             " Set tag program name
let g:tagbar_width = 30                      " TagBar window width
let g:tagbar_autofocus = 1                   " Move cursor to TagBar window when opening

" Use F7 open Tagbar window
imap <silent> <F7> <esc>:TagbarToggle<cr>
nmap <silent> <F7> :TagbarToggle<cr>

" ============================================================================
" SrcExpl setting
" ============================================================================
" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" Set "NONE" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "" 
" Set "<C-h>" key for back from the definition context 
let g:SrcExpl_gobackKey = "<C-h>"
" In order to Avoid conflicts, the Source Explorer should know what plugins are using buffers.
" And you need add their bufname into the list below according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "__Tagbar__",
        \ "NERD_tree_1",
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
" Set "NONE" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "" 
" Set "<C-k>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<C-k>" 
" Set "<C-j>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<C-j>" 

" Use '\se' open Source Explorer
nmap <leader>se :SrcExplToggle<cr>

" Use F9 open SrcExpl window
imap <silent> <F9> <esc>:SrcExplToggle<cr>
nmap <silent> <F9> :SrcExplToggle<cr>

" ============================================================================
" NERD_tree setting
" ============================================================================
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos=0	" 0 to show NERDtree window on left, 1 to show on right

" Use '\nt' open NERD_tree
nmap <leader>nt :NERDTreeToggle<cr>

" Use F6 open NERD_tree
imap <silent> <F6> <esc>:NERDTreeToggle<cr>
nmap <silent> <F6> :NERDTreeToggle<cr>

" ============================================================================
" buf explorer setting
" ============================================================================
let g:bufExplorerDefaultHelp=0           " Do not show default help
let g:bufExplorerFindActive=1
let g:bufExplorerReverseSort=0
let g:bufExplorerShowDirectories=1
let g:bufExplorerShowRelativePath=1      " Show relative paths
let g:bufExplorerShowTabBuffer=0
let g:bufExplorerShowUnlisted=0
let g:bufExplorerSortBy='mru'            " Sort by most recently used
let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitOutPathName=1
let g:bufExplorerSplitRight=1            " Split right
let g:bufExplorerSplitVertical=1         " Split vertically
let g:bufExplorerSplitVertSize = 30      " Split width
let g:bufExplorerUseCurrentWindow=0      " Open in new window
let g:bufExplorerMaxHeight=13            " Max height
autocmd BufWinEnter \[BufExplorer\] setl nonumber

" Use '\be' open BufExplorer
nmap <leader>be :BufExplorer<cr>

" Use F8 open BufExplorer
imap <silent> <F8> <esc>:BufExplorer<cr>
nmap <silent> <F8> :BufExplorer<cr>

" ============================================================================
" Super Tab setting
" ============================================================================
let g:SuperTabDefaultCompletionType = 'context'

" ============================================================================
" LoadTemplate & AuthorInfoDetect setting -- File templates
" ============================================================================
" :LoadTemplate setting
let g:template_path='/home/freyr/.vim/template/'     " Please modify the templates file here

" Ctrl-X Ctrl-T load file template according to file extension
nmap <c-x><c-t> <ESC>:LoadTemplate<cr>

" :AuthorInfoDetect setting (offered by NERD_commenter & authorinfo)
let g:vimrc_author='LinFan'
let g:vimrc_email='linfan.china@gmail.com'
let g:vimrc_homepage='http://the-1.info'

" Ctrl-X Ctrl-E auto add file header with author information
nmap <c-x><c-e> <ESC>:AuthorInfoDetect<cr><ESC>

" ===========================================================================
" window navigation setting
" ============================================================================

" Use Ctrl + h/l/k/j to switch window
imap <silent> <C-h> <esc><C-W><left>
vmap <silent> <C-h> <esc><C-W><left>
nmap <silent> <C-h> <C-W><left>
imap <silent> <C-l> <esc><C-W><right>
vmap <silent> <C-l> <esc><C-W><right>
nmap <silent> <C-l> <C-W><right>
imap <silent> <C-k> <esc><C-W><up>
vmap <silent> <C-k> <esc><C-W><up>
nmap <silent> <C-k> <C-W><up>
imap <silent> <C-j> <esc><C-W><down>
vmap <silent> <C-j> <esc><C-W><down>
nmap <silent> <C-j> <C-W><down>

" ===========================================================================
" buffer navigation setting
" ============================================================================

" Buffer operations:
" :bn[ext]      => jump to next buffer
" :bp[revious]  => jump to previous buffer
" :bw[ipe]      => close current buffer

" Use \bn, \bp to swith buffer
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
" Use \bw to close buffer
nmap <leader>bw :bw<cr>

" ===========================================================================
" tab page navigation setting
" ============================================================================

" Tab operations:
" :tabn[ext] / C-PageDn / gt      => jump to next tabpage
" :tabp[revious] / C-PageUp / gT  => jump to previous tabpage
" :tabc[lose]  => close current tabpage
" :tabo[nly]   => close all other tabpages

" Use \tN, \tw, \tn, \tp, \to to create and navigate tabs
nmap <leader>tN :tabnew 
nmap <leader>tw :tabclose<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprevious<cr>
nmap <leader>to :tabonly<cr>

" Use Alt + number to switch tab
if has("gui_running")
    nmap <M-1> 1gt
    nmap <M-2> 2gt
    nmap <M-3> 3gt
    nmap <M-4> 4gt
    nmap <M-5> 5gt
    nmap <M-6> 6gt
    nmap <M-7> 7gt
    nmap <M-8> 8gt
    nmap <M-9> 9gt
    nmap <M-0> 10gt
endif
nmap <leader>t1 1gt
nmap <leader>t2 2gt
nmap <leader>t3 3gt
nmap <leader>t4 4gt
nmap <leader>t5 5gt
nmap <leader>t6 6gt
nmap <leader>t7 7gt
nmap <leader>t8 8gt
nmap <leader>t9 9gt
nmap <leader>t0 10gt

" ============================================================================
" Remove trailing space
" ============================================================================

" Delete trailing white space on save, useful for Python and C++ :)
func! DeleteTrailingWS()
    " Mark current position
    exe "normal mz"
    " Do trim
    %s/\s\+$//ge
    nohl
    " Restore position
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.[ch] :call DeleteTrailingWS()
autocmd BufWrite *.cc :call DeleteTrailingWS()
autocmd BufWrite *.txt :call DeleteTrailingWS()
" Set a shortcut, but I guess it won't be use very often
nmap <silent> <leader>trim :call DeleteTrailingWS()<cr>

" ============================================================================
" Other shortcuts
" ============================================================================

" Bash like cursor navigate
nmap <C-a> <Home>
nmap <C-e> <End>

" Use \<cr> to fast remove highlight search
nmap <silent> <leader><cr> :nohlsearch<cr>
" Use \<space> to trigger line number
nmap <silent> <leader><space> :se nu!<cr>

" Swith text mode and hex mode
nmap <c-x><c-h> :%!xxd -g 1<cr>
nmap <c-x><c-d> :%!xxd -r<cr>

" Shift + Up/Down to switch two lines
nmap <S-down> :<C-u>move .+1<cr>
nmap <S-up> :<C-u>move .-2<cr>
imap <S-down> <Esc>:<C-u>move .+1<cr>
imap <S-up> <Esc>:<C-u>move .-2<cr>
vmap <S-down> :move '>+1<cr>gv
vmap <S-up> :move '<-2<cr>gv

" Enable 'Enter' key on normal-mode
nmap <cr> i<cr><ESC>k$

" Use C-p and C-n to move up/down faster
nmap <C-p> 5k
nmap <C-n> 5j

" search the word under cursor in all files
" navigating around the search results
" :cn     Jump to next result
" :cp     Jump to previous result
" :cl     List all search results
" :cw     List search result in separate window
" :cc[N]  Jump to [N]th result
nmap <c-x>r :vimgrep /<C-R>=expand("<cword>")<cr>/ *

function! s:GetVisualSelection()
    let save_a = @a
    silent normal! gv"ay
    let v = @a
    let @a = save_a
    let var = escape(v, '\\/.$*')
    return var
endfunction

" Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>

" Switch between source file and header file
map <F2> :A<cr>

" Code Formatter
map <F3> :!astyle --style=ansi -w -y -D -p -n -c -U -Q -Y %

" Check spell，for vim 7.x only
nmap <F4> :setlocal spell!<cr>
imap <F4> <Esc>:setlocal spell!<cr>

" F5 is available
" F6, F7, F8, F9 are used by NERD_tree ,TagBar, BufExplorer and SourceExplorer
" F10 Cannot be overload, gnome console use it open 'File' menu

" F11 Switch full screen 
" Don't change this setting, gnome console also use F11 as full screen trigger
map <F11> <Esc>:simalt ~x<cr>

" ============================================================================
" Compile & Run
" ============================================================================

" Compile source code
func! CompileCode()
        exec "w"
        if &filetype == "c"
            exec "!gcc -Wall -std=c99 %<.c -o %<"
        elseif &filetype == "cpp"
            exec "!g++ -Wall -std=c++98 %<.cc -o %<"
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
nmap <c-x><c-b> :call CompileCode()<cr>
imap <c-x><c-b> <ESC>:call CompileCode()<cr>
vmap <c-x><c-b> <ESC>:call CompileCode()<cr>

" Ctrl+X Ctrl+R Run compiled file
nmap <c-x><c-r> :call RunCode()<cr>
imap <c-x><c-r> <ESC>:call RunCode()<cr>
vmap <c-x><c-r> <ESC>:call RunCode()<cr>

