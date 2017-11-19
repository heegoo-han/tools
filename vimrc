" start
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim -> :PluginInstall
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
 
" My Bundles here:
"
Plugin 'Tagbar'
Plugin 'neocomplcache'
Plugin 'L9'
Plugin 'The-NERD-tree'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'fugitive.vim'
Plugin 'gtags.vim'
Plugin 'lrvick/Conque-Shell'
Plugin 'vimshell-ssh'
Plugin 'The-NERD-Commenter'
Plugin 'DoxygenToolkit.vim'
Plugin 'SearchComplete'
 
call vundle#end()



" :help add-plugin
" :help add-local-help
" plugin(script?) : bufexplorer, cscope_maps, minibufexpl , project , taglist
" in http://www.vim.org/search.php
" cscope_maps -> wget http://cscope.sourceforge.net/cscope_maps.vim

" :help bufexplorer  
" :help project  
" project.txt  taglist.txt

" install help txt and view -> copy xxx.txt file to ~/.vim/doc directory and
" :helptags ~/.vim/doc      then  :help xxx.txt

" see csto variable in .vim/plugin/cscope_maps.vim 
" set to 0 if you want to check order   1.cscope  2.ctags
" set to 1 if you want to check order   1.ctags   2.cscope

set fencs=ucs-bom,utf-8,cp949

if system("echo $LANG | sed -e 's/\(..\).*$/\1/'")=="ko\n"
  set fileencoding=korea
endif

if has("autocmd")
" When editing a file, always jump to the last cursor position
 autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif


" vim color scheme ==> http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
" vim color scheme ==> http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
" jellybeans.vim  pyte.vim
" colorscheme pyte 
" color koehler 

set ts=4
set sw=4
" BackSpace Key Setting
"  set t_kb=
"  fixdel

"set magic
"set noshowcmd
"set nowrap
set showmode
"set nobackup
set title
set noicon
set nocompatible 
set vb
set nu

set	hlsearch
set incsearch
set background=dark
set cindent
set smartindent
set ruler

set paste
" paste causes some problems in map, nmap

if has("syntax")
  syntax on
endif

" to add kernel tags in vim
" in kernel directory, make tags
" in vim ,  :set tags+=/full/path/to/kernel/tags 

set tags+=./tags
set tags+=../tags
set tags+=../../tags
set tags+=../../../tags
set tags+=../../../../tags
set tags+=../../../../../tags
set tags+=../../../../../../tags
set tags+=../../../../../../../tags
set tags+=../../../../../../../../tags
set tags+=../../../../../../../../../tags

"map <F2> mk[[?^[A-Za-z_].*(<CR>V"ky`k:echo "<C-R>k"<CR>

"for chaek
"map<F7> :tj<CR>  
map<F5> :tn<CR>
map<F6> :tp<CR>
map <F4> <Esc>:q!<CR>
map <F12> <Esc>:q!<CR>
"map <F12> :NERDTreeToggle<CR> 
"heghan
"map <F8> :e <C-R>=expand("<cfile>")<CR><CR>
"for chaek
"map <F9> :!mmeld <C-R>=expand("<cfile>")<CR><CR>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"let Tlist_Process_File_Always = 0
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Display_Tag_Scope = 0
"let Tlist_Sort_Type = "name"
"let Tlist_Use_Right_Window = 1
"let Tlist_Display_Prototype = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_File_Fold_Auto_Close = 0

" TagList
"for chaek
"nnoremap <silent> <F8> :Tlist<CR>
"nnoremap <silent> <F9> :TlistUpdate<CR>
"nnoremap <silent> <F9> :w<CR>:TlistUpdate<CR>
let Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=50


"au BufReadPost *
"\ if line("'\"") > 0 && line("'\"") <= line("$") |
"\ exe "norm g`\"" |
"\ endif

"fuzzyfinder FufFile
" :help fuf
map <Leader>ff <ESC>:FufFile **/<CR>
map <Leader>f <ESC>:FufFile<CR>

nmap <Leader>t /<C-R>=expand("<cword>")<CR><CR>

nmap <Leader>r :tj <C-R>=expand("<cword>")<CR><CR>

let g:fuf_keyOpen  = 1

" remove flash in gvim
" help vb
set vb t_vb=

nmap <silent> ;r :vert res -10<CR>
nmap <silent> ;f :vert res +10<CR>
nmap <silent> ;t :res -10<CR>
nmap <silent> ;g :res +10<CR>

" improve ctags search
set tagbsearch

" build in vim
set makeprg=make.sh

" nerdtree current file's directory
map <silent> <Leader>d <ESC>:NERDTreeToggle  %:h <CR>

" quit all
map <F10> <Esc>:qa!<CR>

" expandtab
"set et ts=4

" sync with github.com/heegoo-han/tools/
set csprg=/usr/bin/cscope
set cst
"if filereadable("/home/heghan/w4/project-taskone/cscope.out")
"cs add ~/w4/project-taskone/cscope.out
"endif	
"cs add /home/heghan/w4/project-taskone/luna-sysmgr/cscope.out



"chaek
nmap <F7> :TlistToggle<CR>
nmap <F8> :SrcExplToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:SrcExpl_winHeight = 15 
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0


" kernel
set tags+=/home/heghan/src/linux-2.6/tags
cs add /home/heghan/src/linux-2.6/cscope.out

" git blame
vmap <Leader>g :<C-U>!git blame -L <C-R>=line("'<")<CR>,<C-R>=line("'>")<CR> <C-R>=expand("%:p")<CR> <CR>


