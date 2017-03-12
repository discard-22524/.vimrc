# Vim设置管理

## 声明：
* 此仓库用于备份和管理对Vim的设置
* 所有插件均通过[Vundle](https://github.com/VundleVim/Vundle.vim)进行管理
* 此仓库中的所有插件仅代表我个人
* 使用副本对本地设置进行覆盖产生问题的，责任自负

## 预览：
![](http://blog.matsuyoi.com/images/programs/vim/preview.jpg)

## 插件列表：
```vim
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
```

## 使用说明：
* 将仓库`clone`至本地`git clone https://github.com/Shiratsuyu/.vimrc.git ~/.vim`
* 安装[Vundle](https://github.com/VundleVim/Vundle.vim)：`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* 进入Vim，运行`:PluginInstall`命令安装插件
* 进入YouCompleteMe的插件所在文件夹进行安装（一般来说是通过运行`install.sh`，但不同的操作系统依赖的组件和操作方式不同，请参考下方**官方文档**的链接），将`~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py`复制一份至`~/.vim/bundle/YouCompleteMe/`，并修改Clang位置
![](http://blog.matsuyoi.com/images/programs/vim/clang.jpg)

## 依赖：
* Vundle
* janus（通过`brew install janus`进行安装）
* powerline-fonts（从[GitHub](https://github.com/powerline/fonts)获取进行安装）
* cmake（通过`brew install cmake`进行安装）
* clang（系统自带或其他途径安装）
* YCM下载后还需另行配置，已知在不同系统上并非使用相同的配置方法。若有需要请参考[官方文档](https://github.com/Valloric/YouCompleteMe/blob/master/doc/youcompleteme.txt)

## 按键映射：
键位|功能
:-:|--------------
Ctrl+h|展开所选的代码片段
Ctrl+j|下移补全候选列表光标
Ctrl+k|上移补全候选列表光标
Ctrl+q|关闭所有选项卡，保存并退出Vim
Ctrl+w|关闭当前选项卡（会提示是否保存）
F1 |向左移动窗口的焦点
F2 |向右移动窗口的焦点
F3 |切换到左侧的标签页
F4 |切换到右侧的标签页
F5 |NERDTree开关
F6 |Syntastic开关
F7 |Tagbar开关
F8 |新建文件
F9 |<font color="red">Exposé(系统级)</font>
F10|<font color="red">MissionControl(系统级)</font>
F11|<font color="red">显示桌面(系统级)</font>
F12|<font color="red">LunchPad(系统级)</font>

## 改动记录：
* 2017-03-08：创建该仓库；
* 2017-03-08：删除文档；
* 2017-03-09：添加保存快捷键；
* 2017-03-12：小幅修改Bug，主要是文件编码问题以及未保存即切换缓冲区造成的报错问题，以及一个热键；
