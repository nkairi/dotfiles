if has("gui_macvim")
  set guifont=Monaco:h12
  set guifontwide=Osaka-mono:h12

  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b

  augroup GuiMac
    autocmd!
    autocmd GUIEnter * set fullscreen
  augroup END
endif

if has('transparency')
  set transparency=10
endif

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  set bg=light
  colorscheme solarized

  hi vimshellPrompt guifg=#f9d59d
endif

let local_gvimrc_path = expand('~/.local.gvimrc')
if filereadable(local_gvimrc_path)
  exec 'source ' . local_gvimrc_path
endif
unlet local_gvimrc_path
