set nocompatible              " be iMproved, required
filetype off                  " required
"设置Vundle的运行路径并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle安装位置与插件路径不同时，需要Vundle插件的路径
"call vundle#begin('~/some/path/here')
"------------------要安装的插件不能写在此行前！------------------

"Vundle对自己的调用，不可删去
Plugin 'VundleVim/Vundle.vim'

"以下是所支持的各种不同格式的示例
"需要安装的插件应写在调用的vundle#begin和vundle#end之间

"如果插件托管在Github上，写在下方，只写作者名/项目名就行了
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'

"如果插件来自vim-scripts(官方)，写插件名就行了
" Plugin 'L9'

"如果Git仓库不在Github上，需要提供完整的链接
" Plugin 'git://git.wincent.com/command-t.git'

"本地的插件需要提供文件路径
" Plugin 'file:///home/gmarik/path/to/plugin'
"一定要确保插件就在提供路径的文件夹中(没有子文件夹，直接在这层目录下)

"运行时目录的路径
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"避免插件间的命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

"------------------要安装的插件不能写在此行后！------------------
call vundle#end()            " required
filetype plugin indent on    " required
"要忽略插件缩进更改，请改用：
"filetype plugin on
"
" 安装插件的相关指令
":PluginList			- 列出已安装插件
":PluginInstall			- 安装新添加的插件;添加`!`或使用`:PluginUpdate`来更新已安装插件
":PluginSearch xxx		- 寻找名字带有xxx的插件;添加`!`刷新本地缓存
":PluginClean			- 删除已经从列表移除的插件;添加`!`静默卸载
":h						- 帮助和说明文档 
"Vundle的设置到此为止了
"
"-------------------------插件设置-------------------------
"NERDTree设置(插件)
let NERDTreeAutoCenter=1 						"光标始终在视野内
let NERDTreeShowHidden=1						"显示隐藏文件
let NERDTreeIgnore=['\.pyc','\~$','\.swp']		"忽略临时文件的显示
let g:nerdtree_flag=1							"用于标记NERDTree窗口开关状态
function! NERDTreeSwitch()						"控制NERDTree的开关函数
	if g:nerdtree_flag==1
		:NERDTreeToggle
		let g:nerdtree_flag=0
	else
		:NERDTreeToggle
		let g:nerdtree_flag=1
		call feedkeys("\<C-w>l")
	endif
endfunction
"nerdtree-tabs设置（插件）
let g:nerdtree_tabs_open_on_console_startup=1	"终端启动vim时打开
let g:nerdtree_tabs_smart_startup_focus=2		"切换焦点到文件窗口
let g:nerdtree_tabs_autofind=0					"不在NERDTree定位文件位置
let g:nerdtree_tabs_synchronize_view=0			"多个窗口间不同步NERDtree
let g:nerdtree_tabs_open_on_new_tab=0			"打开新标签不创建新窗口
let g:nerdtree_tabs_focus_on_files=1
"nerdtree-git-plugin设置(插件)
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"
"Airline设置(插件)
let g:airline_powerline_fonts=1	"开启airline的字体支持
let g:airline_theme="kolor"		"所使用的主题配色，我的是kolor
set t_Co=256
set encoding=utf-8
set laststatus=2
let g:airline#extensions#tabline#enabled=1 "(master分支尚有问题待修复，可手动checkout至v0.8版)
let g:airline#extensions#tabline#left_sep=' ' "设置当前高亮标签的分隔符
let g:airline#extensions#tabline#left_alt_sep='|' "设置两普通标签间的分隔符
"
"YouCompleteMe设置(插件)
"配置文件位置：
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
set completeopt=longest,menu				"让Vim的补全菜单行为与一般IDE一致(参考VimTip1230)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif		"离开插入模式后自动关闭预览窗口
"改变上下选择补全项的快捷键：Ctrl+j向上，Ctrl+k向下
inoremap <expr> <C-j>      pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k>      pumvisible() ? "\<C-p>" : "\<Up>"
let g:ycm_min_num_of_chars_for_completion=1	"输入一个字母后就自动补全
let g:ycm_seed_identifiers_with_syntax=1	"开启语义补全(标准库可不加std::前缀)
let g:ycm_cache_omnifunc=0					"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_complete_in_comments=1			"在注释输入中也能补全
let g:ycm_complete_in_strings=1			"在字符串输入中也能补全
let g:ycm_show_diagnostics_ui=1			"启用ycm自带的syntastic插件
"不开启自动补全的文件类型：
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
	  \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}
"
"Syntastic设置（插件）
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1	"自动调用SyntasticSetLoclist（好像没什么用）
let g:syntastic_auto_loc_list=0				"不自动拉起关闭错误窗口
let g:syntastic_check_on_open=1				"打开文件时检测
let g:syntastic_check_on_wq = 0				"保存时不检测错误
let g:syntastic_auto_jump=2					"从Quickfix窗口直接跳转到错误处
let g:syntastic_flag=-1						"设置一个本地变量，用来控制Quickfix窗口的打开与关闭
function! SyntasticSwitch()					"控制打开与关闭Quickfix窗口的函数
	call feedkeys("\<C-w>k")
	if g:syntastic_flag==0
		:lopen
		let g:syntastic_flag=1
	else
		if	g:syntastic_flag==1
			:lclose
			let g:syntastic_flag=0
		else
			:lopen
			let g:syntastic_flag=1
			call feedkeys("\<C-w>h\<CR>C\<C-w>l")
		endif
	endif
endfunction
"
"UltiSnips配置（插件）
"解决快捷键失效问题：
let g:UltiSnipsExpandTrigger       ="<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"将Tab设定为向下遍历候选项：
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"调用UltiSnips补全：
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res
		return ''
	else
		return "\<return>"
	endif
endfunction
"将Ctrl+h设定为展开UntiSnips补全：
inoremap <C-h> <C-R>=Ulti_ExpandOrEnter()<CR>
"
"Tagbar配置（插件）
autocmd VimEnter * :TagbarOpen<CR>
let g:tagbar_width=30					"设置窗口宽度
let g:tagbar_map_help='?'				"释放绑定在帮助上的F1
let g:tagbar_map_togglefold='o'			"将o设为展开/折叠标签
let tagbar_map_preview='<Space>'		"将标签的定位绑定到空格
"
"-------------------------快捷键映射-------------------------
"向左移动分割的窗口焦点：
nmap <F1> <C-w>h
"向右移动分割的窗口焦点：
nmap <F2> <C-w>l
"切换到左边的标签页：
nmap <F3> :w<CR>:bp<CR>
"切换到右边的标签页：
nmap <F4> :w<CR>:bn<CR>
"NERDTree开关：
nmap <F5> :call NERDTreeSwitch()<CR>
"Syntastic开关：
nmap <F6> :call SyntasticSwitch()<CR>
"Tagbar开关：
nmap <F7> :TagbarToggle<CR>
"新建文件：
nmap <F8> <C-w>hma
"
"-------------------------本地设置-------------------------
set number				"显示行号
set softtabstop=4 shiftwidth=4	"设置Tab制表符为4格
set tabstop=4			"设置缩进距离为4格（一个Tab）
set ruler				"右下角显示行号
set invautoindent		"禁止与上一行相同的自动缩进
set cindent				"按C语言风格缩进
set incsearch			"查找时自动跳转到匹配的当前输入（敲回车前）
set hlsearch			"高亮匹配的查找结果
syntax on				"开启语法高亮
