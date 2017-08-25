" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" =============================================================================
"                          << 以下为软件默认配置 >>
" =============================================================================

" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码
set fileencoding=utf-8                                "设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码
set sessionoptions=curdir,options
set shortmess+=c

" 设置代码配色方案
if g:isGUI
	colorscheme molokai
	if g:iswindows
		set guifont=Monaco:h9:cANSI
		" set guifont=mononoki:h10:cANSI
		" set guifont=Consolas:h10:cANSI:qDRAFT
		" set guifont=Megatops_ProCoder_1.0:h9:cANSI:qDRAFT
		" set guifontwide=微软雅黑:h9.5:w4.5:cANSI
		" set guifontwide=新宋体:h11:cANSI
		" set guifont=Inconsolata:h11:cANSI
	else
		set guifont=Monaco:h13
		set guifontwide=微软雅黑:h13
	endif
else
	" colorscheme solarized
	set background=dark
	set t_Co=256
	" colorscheme Tomorrow-Night
	" colorscheme molokai
endif

" 设置 gVim 窗口初始位置及大小
if g:isGUI && g:iswindows
	au GUIEnter * simalt ~x                           "窗口启动时自动最大化
	" winpos 100 10                                  "指定窗口出现的位置，坐标原点在屏幕左上角
	" set lines=38 columns=120                       "指定窗口大小，lines为高度，columns为宽度
endif

if g:isGUI
    set guioptions=ecr
	map <silent> <F11> :if &guioptions =~# 'm' <Bar>
		\set guioptions-=m <Bar>
	\else <Bar>
		\set guioptions+=m <Bar>
	\endif<CR>
endif

" -----------------------------------------------------------------------------
"  < Linux Gvim/Vim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
if g:islinux
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
    if g:isGUI
    else
        set mouse=a                    " 在任何模式下启用鼠标
        set t_Co=256                   " 在终端启用256色
    endif
endif


" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" 安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料

set nocompatible                                      "禁用 Vi 兼容模式
filetype on                                           "禁用文件类型侦测

execute pathogen#infect()

if g:islinux
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set runtimepath+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

Bundle 'xolox/vim-misc'
Bundle 'a.vim'
Bundle 'Align'
Bundle 'ccvext.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
Bundle 'ZoomWin'
Bundle 'tpope/vim-markdown'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'cSyntaxAfter'
Bundle "scrooloose/syntastic"
Bundle 'terryma/vim-multiple-cursors'
Bundle 'repeat.vim'
Bundle 'bsdelf/bufferhint'
Bundle 'tshirtman/vim-cython'
Bundle 'http://git.oschina.net/qiuchangjie/ShaderHighLight'
Bundle "ntpeters/vim-better-whitespace"

" Bundle 'Shougo/neocomplete'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'xolox/vim-session'
" Bundle 'fatih/vim-go'
" Bundle 'Mark--Karkat'
" Bundle 'OmniCppComplete'
" Bundle 'TxtBrowser'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'bufexplorer.zip'
" Bundle 'ervandew/supertab'                "有时与 snipmate 插件冲突
" Bundle 'javacomplete'
" Bundle 'jiangmiao/auto-pairs'
" Bundle 'mattn/emmet-vim'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'std_c.zip'
" Bundle 'taglist.vim'
" Bundle 'tomtom/quickfixsigns_vim'
" Bundle 'vim-javacompleteex'               "更好的 Java 补全插件
" Bundle 'wesleyche/SrcExpl'
"
" NeoBundle 'EasyGrep'
" NeoBundle 'Mark--Karkat'
" NeoBundle 'Shougo/unite-help'
" NeoBundle 'Shougo/unite-outline'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
" NeoBundle 'Shougo/vimshell.vim'
" NeoBundle 'Yggdroot/indentLine'
" NeoBundle 'a.vim'
" NeoBundle 'bling/vim-airline'
" NeoBundle 'bufexplorer.zip'
" NeoBundle 'chrisbra/csv.vim'
" NeoBundle 'cscope_macros.vim'
" NeoBundle 'jsfaint/gen_tags.vim'
" NeoBundle 'majutsushi/tagbar'
" NeoBundle 'matchit.zip'
" NeoBundle 'mbbill/fencview'
" NeoBundle 'mhinz/vim-signify'
" NeoBundle 'mhinz/vim-startify'
" NeoBundle 'osyo-manga/unite-quickfix'
" NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'sjl/gundo.vim'
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'tpope/vim-speeddating'
" NeoBundle 'tsukkee/unite-tag'
" NeoBundle 'xml.vim'

" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------

if (g:iswindows)
	set fileformat=dos                                   "设置新文件的<EOL>格式
	set fileformats=dos,unix,mac                         "给出文件的<EOL>格式类型
else
	set fileformat=unix                                   "设置新文件的<EOL>格式
	set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型
endif

if (g:iswindows && g:isGUI)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决console输出乱码
    language messages zh_CN.utf-8
endif

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
syntax on
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进

set smartindent                                       "启用智能对齐方式
set noshowmode
set noinfercase
set wildignore=*.bak,*.o,*.e,*~
set noexpandtab										  "不扩展tab
set tabstop=4                                         "设置Tab键的宽度
set shiftwidth=4                                      "换行时自动缩进4个空格
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
set backspace=indent,eol,start 						" 设置退格键可用
set showbreak=>										"软折行提示
set linebreak
set ignorecase										"忽略大小写 但是输入中有大写的话不忽略
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                       "在输入要搜索的文字时，取消实时匹配

set path=.,**
if (g:iswindows)
set grepprg=$VIMRUNTIME/ag\ --vimgrep
else
set grepprg=egrep\ -nH
endif
set makeprg=make
set completeopt=menu,preview,longest

" set foldenable                                        "启用折叠
" set foldmethod=indent                                 "indent 折叠方式
" set foldmethod=marker                                "marker 折叠方式

" 用空格键来开关折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 当文件在外部被修改，自动更新该文件
set autoread

noremap <F1> <esc>:NERDTreeToggle<CR>

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

"----------------------
" C++
"----------------------
set cindent
set cinoptions=:0g0t0(sus

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

"""---"----------自定义操作--------------------
"""---" 替换函数。参数说明：
"""---" confirm：是否替换前逐一确认
"""---" wholeword：是否整词匹配
"""---" replace：被替换字符串
"""---function! Replace(confirm, wholeword, replace)
"""---    wa
"""---    let flag = ''
"""---    if a:confirm
"""---        let flag .= 'gec'
"""---    else
"""---        let flag .= 'ge'
"""---    endif
"""---    let search = ''
"""---    if a:wholeword
"""---        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
"""---    else
"""---        let search .= expand('<cword>')
"""---    endif
"""---    let replace = escape(a:replace, '/\&~')
"""---    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
"""---endfunction
"""---" 不确认、非整词
"""---nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
"""---" 不确认、整词
"""---nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
"""---" 确认、非整词
"""---nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
"""---" 确认、整词
"""---nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
"""---nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
"""---"
"""---

set history=1000
set clipboard=unnamed,unnamedplus "sharing windows clipboard
set viminfo+=! " make sure it can save viminfo

"--------------------
" Visual Cues
"--------------------
set showmatch " show matching brackets
set hlsearch " highlight searched for phrases
set incsearch " highlight as you type you search phrase
set listchars=tab:>-,trail:-
set visualbell t_vb=
set showtabline=1
set formatoptions=tcrqmB

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=1                                       "设置命令行的高度为2，默认为1
"set cursorline                                        "突出显示当前行
set wrap                                              "设置自动换行
set shortmess=atI                                     "去掉欢迎界面
" set gcr=a:block-blinkon0                              "禁止光标闪烁

" -----------------------------------------------------------------------------
"  < 其它配置 >
" -----------------------------------------------------------------------------
" set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set backup
set backupext=.bak
if g:iswindows
set directory=c:/temp
set backupdir=c:/temp
else
set directory=~/temp
set backupdir=~/temp
endif

" =============================================================================
"                          << 以下为常用插件配置 >>
" =============================================================================
" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >
" -----------------------------------------------------------------------------
" 用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口

" -----------------------------------------------------------------------------
"  < Align 插件配置 >
" -----------------------------------------------------------------------------
" 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多

" -----------------------------------------------------------------------------
"  < auto-pairs 插件配置 >
" -----------------------------------------------------------------------------
" 用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突
" 所以我就没有加入echofunc插件

" -----------------------------------------------------------------------------
"  < BufExplorer 插件配置 >
" -----------------------------------------------------------------------------
" 快速轻松的在缓存中切换（相当于另一种多个文件间的切换方式）
" <Leader>be 在当前窗口显示缓存列表并打开选定文件
" <Leader>bs 水平分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件
" <Leader>bv 垂直分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件

" -----------------------------------------------------------------------------
"  < ccvext.vim 插件配置 >
" -----------------------------------------------------------------------------
" 用于对指定文件自动生成tags与cscope文件并连接
" 如果是Windows系统, 则生成的文件在源文件所在盘符根目录的.symbs目录下(如: X:\.symbs\)
" 如果是Linux系统, 则生成的文件在~/.symbs/目录下
" 具体用法可参考www.vim.org中此插件的说明
" <Leader>sy 自动生成tags与cscope文件并连接
" <Leader>sc 连接已存在的tags与cscope文件

" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" 高亮括号与运算符等
"au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
" -----------------------------------------------------------------------------
"  < ctrlp.vim 插件配置 >
" -----------------------------------------------------------------------------
" 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" 常规模式下输入：Ctrl + p 调用插件
" -----------------------------------------------------------------------------
"  < emmet-vim（前身为Zen coding） 插件配置 >
" -----------------------------------------------------------------------------
" HTML/CSS代码快速编写神器，详细帮助见 :h emmet.txt

"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
nmap <leader>il :IndentLinesToggle<CR><C-L>

" 设置Gvim的对齐线样式
if g:isGUI
    let g:indentLine_char = "┊"
    let g:indentLine_first_char = "┊"
endif

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'

" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 >
" -----------------------------------------------------------------------------
" 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt

" " -----------------------------------------------------------------------------
" "  < MiniBufExplorer 插件配置 >
" " -----------------------------------------------------------------------------
" " 快速浏览和操作Buffer
" " 主要用于同时打开多个文件并相与切换

"let g:miniBufExplMapWindowNavArrows = 1     "用Ctrl加方向键切换到上下左右的窗口中去
"let g:miniBufExplMapWindowNavVim = 1        "用<C-k,j,h,l>切换到上下左右的窗口中去
"let g:miniBufExplMapCTabSwitchBufs = 1      "功能增强（不过好像只有在Windows中才有用）
" "                                            <C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
" "                                            <C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
" noremap <c-k> <c-w>k
" noremap <c-j> <c-w>j
" noremap <c-h> <c-w>h
" noremap <c-l> <c-w>l

" -----------------------------------------------------------------------------
" <neocomplete 插件配置>
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
	\ }
let g:neocomplete#sources#omni#functions = {
	\ 'go' : '__disabled__gocomplete#Complete',
	\ }
" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"
"" Options for python
augroup python_autocmds
autocmd!
au FileType python set fo-=t
au FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '%([^. \t].|^\s_@|^\s_from\s.+import |^\s_from |^\s_import )\w_'
"let g:neocomplete#force_omni_input_patterns.python = '\h\w_|[^. \t].\w*'
autocmd FileType python autocmd BufEnter <buffer> EnableStripWhitespaceOnSave
augroup END


" -----------------------------------------------------------------------------
"  < nerdcommenter 插件配置 >
" -----------------------------------------------------------------------------
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
" let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格

" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
" 有目录村结构的文件浏览插件
let g:NERDTreeMapPreview = '<SPACE>'
let g:NERDTreeMapActivateNode = 'e'

" -----------------------------------------------------------------------------
"  < omnicppcomplete 插件配置 >
" -----------------------------------------------------------------------------
" 用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全，详细
" 说明可以参考帮助或网络教程等
" 使用前先执行如下 ctags 命令（本配置中可以直接使用 ccvext 插件来执行以下命令）
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" 我使用上面的参数生成标签后，对函数使用跳转时会出现多个选择
" 所以我就将--c++-kinds=+p参数给去掉了，如果大侠有什么其它解决方法希望不要保留呀
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" set completeopt=menu                        "关闭预览窗口
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]

" -----------------------------------------------------------------------------
"  < repeat 插件配置 >
" -----------------------------------------------------------------------------
" 主要用"."命令来重复上次插件使用的命令

" -----------------------------------------------------------------------------
"  < snipMate 插件配置 >
" -----------------------------------------------------------------------------
" 用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全，详细用法可以参
" 考使用说明或网络教程等。不过有时候也会与 supertab 插件在补全时产生冲突，如果大
" 侠有什么其它解决方法希望不要保留呀

" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 >
" -----------------------------------------------------------------------------
" 增强源代码浏览，其功能就像Windows中的"Source Insight"

" -----------------------------------------------------------------------------
"  < std_c 插件配置 >
" -----------------------------------------------------------------------------
" 用于增强C语法高亮

" 启用 // 注视风格
let c_cpp_comments = 0

" -----------------------------------------------------------------------------
"  < surround 插件配置 >
" -----------------------------------------------------------------------------
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt

" -----------------------------------------------------------------------------
"  < Syntastic 插件配置 >
" -----------------------------------------------------------------------------
" 用于保存文件时查检语法
"
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_balloons = 0

" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args = "--ignore=E302,E501"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--rcfile=f:/g53/conf/pylintrc"
"let g:syntastic_python_checkers = []
"let g:syntastic_python_pylint_args = ''

nnoremap <silent> <F10> :SyntasticCheck<cr>

" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" 相对 TagList 能更好的支持面向对象

" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
" noremap ,r :TagbarOpen fc<CR>
let g:tagbar_width=30                       "设置窗口宽度
let g:tagbar_left=1                         "在左侧窗口中显示
let g:tagbar_compact=1


" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
" nmap tl :TagbarClose<CR>:Tlist<CR>
" let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
" let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1            "自动折叠
" let Tlist_WinWidth=30                       "设置窗口宽度
" let Tlist_Use_Right_Window=1                "在右侧窗口中显示

" -----------------------------------------------------------------------------
"  < txtbrowser 插件配置 >
" -----------------------------------------------------------------------------
" 用于文本文件生成标签与与语法高亮（调用TagList插件生成标签，如果可以）
"au BufRead,BufNewFile *.txt setlocal ft=txt

" -----------------------------------------------------------------------------
"  < ZoomWin 插件配置 >
" -----------------------------------------------------------------------------
" 用于分割窗口的最大化与还原
" 常规模式下按快捷键 <c-w>o 在最大化与还原间切换
" =============================================================================
"                          << 以下为常用工具配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
    "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
"------grep工具配置------------------------------------------------------------
"定义快捷键关闭当前分割窗口
"nmap<Leader>q :q<CR>
"使用Grep.vim插件在工程内全局查找，设置快捷键。快捷键速记法：searchin project
nnoremap<Leader>sp :Grep<CR>
"使用Grep.vim插件在工程内全局查找，设置快捷键。快捷键速记法：searchin buffer
nnoremap <Leader>sb :GrepBuffer -ir<CR><CR>
" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=tags,../tags,../../tags,../../../tags
" set tags+=tags;                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）
" -----------------------------------------------------------------------------
"  < gvimfullscreen 工具配置 > 请确保已安装了工具
" -----------------------------------------------------------------------------
" 用于 Windows Gvim 全屏窗口，可用 F11 切换
" 全屏后再隐藏菜单栏、工具栏、滚动条效果更好
" if (g:iswindows && g:isGUI)
	" map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
" endif

" -----------------------------------------------------------------------------
"  < vimtweak 工具配置 > 请确保以已装了工具
" -----------------------------------------------------------------------------
" 这里只用于窗口透明与置顶
" 常规模式下 Ctrl + Up（上方向键） 增加不透明度，Ctrl + Down（下方向键） 减少不透明度，<Leader>t 窗口置顶与否切换
" if (g:iswindows && g:isGUI)
	" let g:Current_Alpha = 255
	" let g:Top_Most = 0
	" func! Alpha_add()
		" let g:Current_Alpha = g:Current_Alpha + 10
		" if g:Current_Alpha > 255
			" let g:Current_Alpha = 255
		" endif
		" call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
	" endfunc
	" func! Alpha_sub()
		" let g:Current_Alpha = g:Current_Alpha - 10
		" if g:Current_Alpha < 155
			" let g:Current_Alpha = 155
		" endif
		" call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
	" endfunc
	" func! Top_window()
		" if  g:Top_Most == 0
			" call libcallnr("vimtweak.dll","EnableTopMost",1)
			" let g:Top_Most = 1
		" else
			" call libcallnr("vimtweak.dll","EnableTopMost",0)
			" let g:Top_Most = 0
		" endif
	" endfunc

	""" 快捷键设置
	" map <c-up> :call Alpha_add()<CR>
	" map <c-down> :call Alpha_sub()<CR>
	" map <leader>t :call Top_window()<CR>
" endif

"--------------------------------
" EnhCommentify
"--------------------------------
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyMultiPartBlocks = 'yes'
let g:EnhCommentifyCommentsOp = 'yes'
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyBindInInsert = 'No'
noremap ,`		:call EnhancedCommentifyToggleCommentIndent()<cr>

"--------------------------------
" python
"--------------------------------
autocmd FileType python setlocal smarttab
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal expandtab
autocmd FileType python setlocal iskeyword-=
autocmd FileType python setlocal wrap
autocmd FileType python noremap <M-d> :call jedi#goto()<CR>
autocmd FileType python noremap <M-r> :call jedi#usages()<CR>

let python_highlight_all = 1

"--------------------------------
" golang
"--------------------------------
function! Goformat()
	let regel=line(".")
	%!gofmt -s
	call cursor(regel, 1)
endfunction

autocmd Filetype go command! Fmt call Goformat()

"--------------------------------
" lpc
"--------------------------------
" 对LPC #include "/a/b/c.c" 特殊情况的处理，这样 gf 就会忽略第一个/，把路径变
" 成相对路径
set includeexpr=substitute(v:fname,'^/','','')

" function! LpcFileTypeDetect()
	" let mypath = getcwd()
	" if mypath ~= "voyage/server/src/logic"
		" set filetype=lpc
	" end
" endfunction
" autocmd BufNewFile,BufRead *.inl,*.c,*.h call LpcFileTypeDetect()

"--------------------------------
" lua
"--------------------------------
autocmd BufRead,BufNewFile *.pto set filetype=lua
autocmd BufRead,BufNewFile *.tbl set filetype=lua


"--------------------------------
" ctrlp
"--------------------------------
let g:user_command_async = 1
let g:ctrlp_map = ',f'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|log)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
let g:ctrlp_switch_buffer = 'ET'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_max_files = 300000
let g:ctrlp_max_depth = 30
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_key_loop = 1

let g:ctrlp_match_window = "bottom,order:ttb,min:1,max:10,results:30"
let g:ctrlp_prompt_mappings = {
	\ 'PrtBS()':              ['<bs>', '<c-]>'],
	\ 'PrtDelete()':          ['<del>'],
	\ 'PrtDeleteWord()':      ['<c-w>'],
	\ 'PrtClear()':           ['<c-u>'],
	\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
	\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
	\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
	\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
	\ 'PrtSelectMove("u")':   ['<c-b>', '<kPageUp>'],
	\ 'PrtSelectMove("d")':   ['<c-f>', '<kPageDown>'],
	\ 'PrtHistory(-1)':       ['<c-n>'],
	\ 'PrtHistory(1)':        ['<c-p>'],
	\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
	\ 'AcceptSelection("h")': ['<c-s>', '<c-x>' ],
	\ 'AcceptSelection("t")': ['<c-t>', '<c-cr>' ],
	\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
	\ 'ToggleFocus()':        ['<s-tab>'],
	\ 'ToggleRegex()':        ['<c-r>'],
	\ 'ToggleByFname()':      ['<c-d>'],
	\ 'ToggleType(1)':        ['<right>', '<c-up>'],
	\ 'ToggleType(-1)':       ['<left>', '<c-down>'],
	\ 'PrtExpandDir()':       ['<tab>'],
	\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
	\ 'PrtInsert()':          ['<c-\>'],
	\ 'PrtCurStart()':        ['<c-a>'],
	\ 'PrtCurEnd()':          ['<c-e>'],
	\ 'PrtCurLeft()':         ['<c-h>'],
	\ 'PrtCurRight()':        ['<c-l>'],
	\ 'PrtClearCache()':      ['<F5>'],
	\ 'PrtDeleteEnt()':       ['<F7>'],
	\ 'CreateNewFile()':      ['<c-y>'],
	\ 'MarkToOpen()':         ['<c-z>'],
	\ 'OpenMulti()':          ['<c-o>'],
	\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
	\ }

let g:ctrlp_extensions = ['buffertag', 'autoignore']

"-------------------------------------------------------------------------------
" mapping
"-------------------------------------------------------------------------------
noremap <f2>    :call AutoHighlight_Toggle()<cr>
noremap <s-f2>  :call AutoHighlight_ToggleLock()<cr>

nmap <f3> :Xg "\b<C-R>=expand("<cword>")<CR>\b"<CR>

noremap <f5>	:cprev<cr>
noremap <f6>    :cnext<cr>

noremap <F7>	:.w !pbcopy<CR><CR>
vnoremap <F7>	:w !pbcopy<CR><CR>
noremap <s-F7>	:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

noremap <right> <c-w>l
noremap <left>  <c-w>h
noremap <up>    <c-w>k
noremap <down>  <c-w>j

noremap ,r		:CtrlPTag<cr>
noremap ,s		:CtrlPBufTag<cr>
noremap ,q		:CtrlPMRUFiles<cr>
noremap ,a		:CtrlPBuffer<cr>


noremap ,p		:call SmartClist_PNav(0)<cr>
noremap ,n		:call SmartClist_PNav(1)<cr>
noremap ,*		:silent! call SmartRef_PFindRefInThisFile()<cr>

noremap ,,		gt
noremap ,z		gT

noremap Q		gQ
noremap L		<c-w>l
noremap H		<c-w>h
noremap F		:bn<cr>
noremap B		:bp<cr>
noremap U		:call g:SrcExpl_ToggleActiveSrcExpl()<cr>

" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>
" cnoremap <C-h> <Left>
" cnoremap <C-l> <Right>
" cnoremap <C-b> <S-Left>
" cnoremap <C-f> <S-Right>
 
noremap <M-z> <C-o>

" noremap <2-LeftMouse> :silent! normal <c-]><cr>
" noremap <MiddleMouse> <c-t>
" noremap <RightMouse> <c-o>

let g:qb_hotkey = ",B"
let g:src_file_ext="lua,c,cpp,h,py,txt"

function! SvnDiffInNewTab(args)
	tabnew
	exec "read !svn diff " . a:args
   	setfiletype diff
	setlocal nomodifiable
	setlocal buftype=nofile
	normal gg
endfunction

function! SvnBlameInNewTab(file)
	tabnew
	exec "read !svn blame " . a:file
   	setfiletype lua
	setlocal nomodifiable
	setlocal buftype=nofile
	normal gg
endfunction

function! OpenInNewTab(args)
	let tabnr = tabpagenr()
	let buflist = tabpagebuflist(tabnr)
	let newtab = 0
	for bnr in buflist
		if bufname(bnr) != ''
			let newtab = 1
		endif
	endfor
	if newtab != 0
		exec "tabedit " . a:args
	else
		exec "edit " . a:args
	endif
endfunction

function! MyPreviewQuickfix()
	let line = getline(".")
	let pat = "|[0-9]*|"
	let b = match(line, pat)
	let e = matchend(line, pat)
	if b != -1 && e != -1
		let filename = strpart(line, 0, b)
		let num = strpart(line, b+1, e-b-2)

		silent! wincmd P		" 跳转至预览窗口
		if &previewwindow		" 如果确实转到了预览窗口……
		else
			silent! pedit!
		endif
		silent! wincmd P		" 跳转至预览窗口
		if &previewwindow		" 如果确实转到了预览窗口……
			exec "silent! edit +" . num . " " . filename
			setlocal nomodifiable
			filetype detect
			exec num
			call HL_Marks()
			wincmd p			" 返回原来的窗口
		end
	endif
endfunction

function! MyGrep(args)
	exec "AsyncRun! ag --vimgrep  " . a:args
endfunction

function! MyXGrep(args)
	copen
	silent! wincmd w
	exec "AsyncRun! ag --vimgrep --batch --cc --coffee --cpp --go --hh --ini --js --java --lua --make --objc --objcpp --python " . a:args
endfunction

command! -nargs=* -complete=file Svndiff call SvnDiffInNewTab(<q-args>)
command! Svnblame call SvnBlameInNewTab(expand("%"))
command! -nargs=* -complete=file G call MyGrep(<q-args>)
command! -nargs=* -complete=file Xg call MyXGrep(<q-args>)
command! -nargs=* -complete=file T call OpenInNewTab(<q-args>)

let g:netrw_preview=1

let mywiki = {}
let mywiki.path = 'e:/mydoc/vimwiki/'
" let mywiki.auto_export = 1
let mywiki.path_html = 'e:/mydoc/vimwiki/html/'
let mywiki.html_header = 'e:/mydoc/vimwiki/template/header.tpl'
let mywiki.nested_syntaxes = {'python':'python', 'c++':'cpp', 'shell':'sh', 'lua':'lua', 'sql':'sql', 'js':'javascript'}
let g:vimwiki_list = [mywiki]

let g:vimwiki_use_mouse = 1

let g:calendar_mruler = '一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月'
let g:calendar_wruler = '日 一 二 三 四 五 六'
let g:calendar_monday = 1
let g:calendar_datetime = 'statusline'

let MRU_Max_Entries = 100

" =============================================================================
"                          << 以下为常用自动命令配置 >>
" =============================================================================

" 自动切换目录为当前编辑文件所在目录
"au BufRead,BufNewFile,BufEnter * cd %:p:h

" =============================================================================
"                     << windows 下解决 Quickfix 乱码问题 >>
" =============================================================================
" windows 默认编码为 cp936，而 Gvim(Vim) 内部编码为 utf-8，所以常常输出为乱码
" 以下代码可以将编码为 cp936 的输出信息转换为 utf-8 编码，以解决输出乱码问题
" 但好像只对输出信息全部为中文才有满意的效果，如果输出信息是中英混合的，那可能
" 不成功，会造成其中一种语言乱码，输出信息全部为英文的好像不会乱码
" 如果输出信息为乱码的可以试一下下面的代码，如果不行就还是给它注释掉

" if g:iswindows
"     function QfMakeConv()
"         let qflist = getqflist()
"         for i in qflist
"            let i.text = iconv(i.text, "cp936", "utf-8")
"         endfor
"         call setqflist(qflist)
"      endfunction
"      au QuickfixCmdPost make call QfMakeConv()
" endif

" =============================================================================
"                          << 其它 >>
" =============================================================================

" 注：上面配置中的"<Leader>"在本软件中设置为"\"键（引号里的反斜杠），如<Leader>t
" 指在常规模式下按"\"键加"t"键，这里不是同时按，而是先按"\"键后按"t"键，间隔在一
" 秒内，而<Leader>cs是先按"\"键再按"c"又再按"s"键
"
let g:jedi#force_py_version = 2
let g:jedi#auto_close_doc=1

" let g:jedi#show_call_signatures = 0
" let g:jedi#popup_on_dot=0
" let g:jedi#popup_select_first=0
" let g:jedi#completions_enabled=0
" let g:jedi#smart_auto_mappings = 0

let g:session_autoload="no"
let g:session_autosave="yes"
let g:session_autosave_periodic=5
let g:session_autosave_silent=1

let Grep_Path = $VIMRUNTIME . '/egrep -H'
let Egrep_Path = $VIMRUNTIME . '/egrep -H'
let Grep_Find_Use_Xargs = 0

" autocmd QuickfixCmdPost grep call MyQuickfixCmdPost()

function! GetCurPreviewFilePath()
	silent! wincmd P
	if &previewwindow
		let file_name = getreg("%")
		let lineno = line(".")
		wincmd p
		exec "edit +" . lineno . " " . file_name
	else
		echo "no preview window"
	endif
endfunction

function! CloseBufferButNoDeleteSplit()
	let bprev = bufnr('%')
	exec 'b#'
	exe 'bdelete ' . bprev
endfunction

" nnoremap <silent> ,x :call CloseBufferButNoDeleteSplit()<cr>
nnoremap <silent> ,x :Kwbd<cr>

" SrcExpl
let g:SrcExpl_winHeight = 14
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_refreshTime = 300
" let g:SrcExpl_prevDefKey = 'p'
" let g:SrcExpl_nextDefKey = 'n'
" let g:SrcExpl_gobackKey = '<s-SPACE>'


"-------------------------------------------------------------
"For Ycm
"-------------------------------------------------------------
"let g:ycm_global_ycm_extra_conf = '$VIM\vimfiles\bundle\YouCompleteMe\python\.ycm_extra_conf.py'
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞
" nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" 补全功能在注释中同样有效
" let g:ycm_complete_in_comments=1
" 开启标签补全
" let g:ycm_collect_identifiers_from_tags_files = 1
" 从第一个键入字符就开始罗列匹配项
" let g:ycm_min_num_of_chars_for_completion=1
"离开插入模式后自动关闭预览窗口
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 禁止缓存匹配项，每次都重新生成匹配项
" let g:ycm_cache_omnifunc=0
" set completeopt-=preview
" 语法关键字补全
" let g:ycm_seed_identifiers_with_syntax=1
"
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
" let g:ycm_key_invoke_completion = '<C-l>'

" let g:ycm_filetype_specific_completion_to_disable = {}

" let g:ycm_filetype_blacklist = {}

let g:ycm_filepath_completion_use_working_dir = 1

let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ["pylint"]
let g:pymode_rope = 0

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_python_pylint_args = "--rcfile=f:/g53/conf/pylintrc"

let g:EasyMotion_leader_key = ','

" nnoremap - :call bufferhint#Popup()<CR>

" " Add the virtualenv's site-packages to vim path
" if has('python')
" python << EOF
" import os
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
" endif

if has('python')
python << EOF
import sys
sys.path.append('client/script/shared/lib')
sys.path.append('client/script/lib')
sys.path.append('client/script')
sys.path.append('server/src')
sys.path.append('server/mobile_server/Lib')
sys.path.append('server/mobile_server')
EOF
endif

nnoremap <leader>g :YcmCompleter GoTo<cr>
nnoremap <leader>d :YcmCompleter GoToDefinition<cr>
nnoremap <leader>c :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>r :YcmCompleter GoToReferences<cr>
nnoremap <leader>i :YcmCompleter GoToInclude<cr>
nnoremap <leader>q :YcmCompleter GetDoc<cr>

