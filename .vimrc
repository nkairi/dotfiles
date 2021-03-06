" vim:set et foldmethod=marker:
" Setup neobundle.vim {{{
set nocompatible
filetype off

if has('vim_starting')
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
  syntax enable
endif

call neobundle#rc(expand('~/.vim/bundle'))
" }}}

function! s:meet_neocomplete_requirements() " {{{
  " http://rhysd.hatenablog.com/entry/2013/08/24/223438
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction " }}}

" Plugins {{{
" Quickrun {{{
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
" }}}
" Text Object {{{
NeoBundle 'h1mesuke/textobj-wiw'                   , { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'kana/vim-textobj-indent'                , { 'depends' : 'kana/vim-textobj-user' }
NeoBundle 'kana/vim-textobj-line'                  , { 'depends' : 'kana/vim-textobj-user' }
NeoBundleFetch 'rhysd/vim-textobj-continuous-line'  , { 'depends' : 'kana/vim-textobj-user' }
" }}}
" Operator {{{
NeoBundleFetch 'kana/vim-operator-user'
NeoBundleFetch 'emonkak/vim-operator-sort'     , { 'depends' : 'kana/vim-operator-user' }
NeoBundleFetch 'kana/vim-operator-replace'     , { 'depends' : 'kana/vim-operator-user' }
NeoBundleFetch 'tyru/operator-camelize.vim'    , { 'depends' : 'kana/vim-operator-user' }
NeoBundleFetch 'tyru/operator-html-escape.vim' , { 'depends' : 'kana/vim-operator-user' }
" }}}
" Help {{{
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-ref'
" }}}
" Unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'sgur/unite-qf'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'osyo-manga/unite-fold'
NeoBundle 'tsukkee/unite-tag'
" }}}
" Completion {{{
if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleFetch 'Shougo/neocomplcache'
else
  NeoBundleFetch 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neocomplcache'
endif
NeoBundleLazy 'ujihisa/neco-look'
call neobundle#config('neco-look', {
      \   'autoload' : {
      \     'filetypes' : ['markdown', 'hatena'],
      \   },
      \ })
NeoBundleLazy 'git@github.com:aereal/jscomplete-vim.git', { 'name': 'jscomplete-vim' }
call neobundle#config('jscomplete-vim', {
      \ 'autoload' : {
      \   'filetypes' : ['javascript'],
      \ },
      \ })
" }}}
" Language, Format {{{
NeoBundle 'slim-template/vim-slim'
NeoBundle 'groenewege/vim-less'
NeoBundleLazy 'hail2u/vim-css3-syntax'
call neobundle#config('vim-css3-syntax', {
      \ 'autoload' : {
      \   'filetypes' : ['css', 'scss', 'sass', 'less'],
      \ },
      \ })
NeoBundle 'hallison/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'motemen/hatena-vim'
NeoBundleLazy 'othree/html5.vim'
call neobundle#config('html5.vim', {
      \ 'autoload' : {
      \   'filetypes' : ['html'],
      \ }
      \ })
NeoBundleLazy 'pangloss/vim-javascript'
call neobundle#config('vim-javascript', {
      \   'autoload' : {
      \     'filetypes' : ['javascript'],
      \   },
      \ })
NeoBundleLazy 'vim-perl/vim-perl'
call neobundle#config('vim-perl', {
      \   'autoload' : {
      \     'filetypes' : ['perl'],
      \   },
      \ })
NeoBundle 'vim-ruby/vim-ruby'
NeoBundleLazy 'davidoc/taskpaper.vim'
NeoBundleLazy 'moznion/vim-cpanfile'
call neobundle#config('vim-cpanfile', {
      \   'autoload' : {
      \     'filetypes' : ['cpanfile'],
      \   },
      \ })
NeoBundleLazy 'y-uuki/perl-local-lib-path.vim'
call neobundle#config('perl-local-lib-path.vim', {
      \ 'autoload' : {
      \   'filetypes' : ['perl'],
      \ },
      \ })
NeoBundle 'jnwhiteh/vim-golang'
" }}}
" Color {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'git@github.com:aereal/vim-magica-colors.git',
      \ { 'base' : '~/repos/@aereal' }
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'git://gist.github.com/187578.git', { 'name' : 'h2u_colors' }
NeoBundle 'sickill/vim-monokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'noahfrederick/vim-noctu'
NeoBundle 'uu59/vim-herokudoc-theme'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'trapd00r/neverland-vim-theme'
NeoBundle 'bluntpeak/bluntpeak-vim-colors'
" }}}
" Visualize {{{
NeoBundle 'jceb/vim-hier'
NeoBundle 'dannyob/quickfixstatus'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'tyru/current-func-info.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/lightline.vim'
" }}}
" Input & Edit {{{
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-surround'
NeoBundle 't9md/vim-surround_custom_mapping', { 'depends' : 'tpope/vim-surround' }
NeoBundle 'kana/vim-smartinput'
NeoBundleLazy 'mattn/emmet-vim'
call neobundle#config('emmet-vim', {
      \ 'autoload' : {
      \   'filetypes' : [
      \     'html',
      \     'haml',
      \     'slim',
      \     'css',
      \   ],
      \ },
      \ })
NeoBundle 'kana/vim-smartchr'
NeoBundle 'sickill/vim-pasta'
NeoBundleLazy 'h1mesuke/vim-alignta'
call neobundle#config('vim-alignta', {
      \   'autoload' : {
      \     'commands' : ['Align', 'Alignta'],
      \   },
      \ })
NeoBundle 'tyru/eskk.vim'
" }}}
" Organize {{{
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}
" Utility {{{
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \   },
      \ }
NeoBundle 'sudo.vim'
NeoBundle 'tpope/vim-fugitive'
" }}}

filetype plugin indent on
" }}}

" autocmd {{{
augroup MyInit
  autocmd!
  " screen title {{{
  if ! has('gui_running')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]://" | silent! exe '!echo -n "k%:t\\"' | endif
  endif " }}}
  " CoffeeScript {{{
  autocmd ColorScheme * hi! link CoffeeSpecialVar Constant
  " }}}
  " Haskell {{{
  autocmd FileType haskell setlocal et
  " }}}
  " Perl {{{
  autocmd BufNewFile,BufRead cpanfile setlocal filetype=cpanfile
  autocmd BufNewFile,BufRead cpanfile setlocal syntax=perl.cpanfile

  autocmd BufEnter *.tt setlocal ft=tt2
  autocmd BufEnter *.t  setlocal ft=perl
  " }}}
  " Vim {{{
  autocmd FileType vim inoreabbrev <buffer> = =
  " }}}
  " Markdown {{{
  autocmd FileType markdown setlocal et ts=4 sts=4 sw=4
  " }}}
  " Nginx {{{
  autocmd BufEnter */nginx/*.conf setlocal ft=nginx
  autocmd BufEnter */*.nginx.conf setlocal ft=nginx
  " }}}
  " HTML {{{
  autocmd FileType html inoremap <buffer> = =
  " }}}
  " Hatena {{{
  autocmd BufNewFile,BufRead *.hatena setlocal filetype=hatena

  autocmd BufEnter */Hatena/*          setlocal et ts=4 sts=4 sw=4
  autocmd BufEnter */Hatena/*.html.erb setlocal ts=2 sts=2 sw=2
  autocmd BufEnter */Hatena/*.html     setlocal ts=2 sts=2 sw=2
  autocmd BufEnter */Hatena/*.html.tt  setlocal ts=2 sts=2 sw=2
  autocmd BufEnter */Hatena/*.html     setlocal ft=tt2html
  autocmd BufEnter */Hatena/*.tt       setlocal ft=tt2html
  " }}}
  " Close window with `q` key {{{
  autocmd FileType help,ref-* nnoremap <buffer> q :q<CR>
  " }}}
  " Git config {{{
  autocmd FileType gitconfig setlocal noexpandtab
  " }}}
augroup END
" }}}

" Configurations {{{
set hidden
set history=1000
set autoread
set fileformats=unix,dos,mac
set scrolloff=100000 " 常にカーソルのある行を中心に (したい)
set backspace=indent,eol,start
set formatoptions-=ro
set ttyfast
" set lazyredraw
set completeopt=menuone,menu

" Backup & Swap {{{
set nobackup
set swapfile
set directory=~/.vim/swp
" }}}
" Indentation {{{
set autoindent
set nosmartindent
set nocindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set shiftround
" }}}
" Encoding {{{
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set encoding=utf-8
set termencoding=utf-8
" }}}
" Search {{{
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan
" }}}
" Visualization {{{
set ambiwidth=double
set list
set listchars=tab:>.,precedes:<,extends:>,trail:_
" }}}
" UI {{{
set langmenu=none " メニューをローカライズしない
set laststatus=2
set number
set ruler
set modeline
set noshowcmd
set noshowmode
set shortmess+=I

if v:version >= 704
  " set relativenumber " 7.4 以降だと絶対行数も表示される
endif
" }}}
" IME {{{
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
" }}}
" Conceal {{{
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}
" Persistent Undo {{{
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif
" }}}
" Clipboard Integration {{{
if has('clipboard')
  set clipboard=unnamed,autoselect
endif
" }}}
" }}}

" Tabpage {{{
set showtabline=2
set guioptions-=e
function! s:tabpage_label(n) " {{{
  let title = gettabvar(a:n, 'title')
  if title != ''
    return title
  endif

  let buffers = tabpagebuflist(a:n)
  let highlight_field = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
  let buffers_count = len(buffers)
  if buffers_count is 1
    let buffers_count = ''
  endif
  let modified_indicator = len(filter(copy(buffers), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let indicator = buffers_count . modified_indicator
  let separator = indicator ==# '' ? '' : ' '
  let current_buffer = buffers[tabpagewinnr(a:n) - 1]
  let fname = pathshorten(bufname(current_buffer))
  let label = indicator . separator . fname

  return '%' . a:n . 'T' . highlight_field . label . '%T%#TabLineFill#'
endfunction " }}}
function! MakeTabLine() " {{{
  let titles = map(range(1, tabpagenr('$')), '"|" . s:tabpage_label(v:val) . "|"')
  let separator = ' '
  let tabpages = join(titles, separator) . separator . '%#TabLineFill#%T'
  let extra = ''
  let extra .= cfi#format('[%s()]', '')
  let extra .= '[' . fnamemodify(getcwd(), ':~') . ']'
  return tabpages . '%=' . extra
endfunction " }}}
set tabline=%!MakeTabLine()
" }}}

" Command Line Window {{{
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-u>
nmap : <SID>(command-line-enter)
xmap : <SID>(command-line-enter)

autocmd MyInit CmdwinEnter * call s:init_cmdwin()

function! s:init_cmdwin() " {{{
  nnoremap <silent><buffer> q :<C-u>quit<CR>
  nnoremap <silent><buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR>  pumvisible() ? "\<C-y>\<CR>"  : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS>  pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction " }}}
" }}}

" Key mappings {{{
let mapleader   = ';'
let g:mapleader = ';'

nnoremap j gj
nnoremap k gk
nnoremap Y y$

nnoremap <Leader><Space> :update<CR>
nnoremap <ESC><ESC>      :nohlsearch<CR>

inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', '=')
" }}}

" Plugin Configurations {{{
" neocomplete.vim {{{
let g:neocomplete#enable_at_startup = 1

if neobundle#is_installed('neocomplete.vim')
  let s:bundle = neobundle#get('neocomplete.vim')

  function! s:bundle.hooks.on_source(bundle)
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    let g:neocomplete#keyword_patterns                  = {}
    let g:neocomplete#keyword_patterns.default          = '\h\w*'

    let g:neocomplete#delimiter_patterns                = {}
    let g:neocomplete#delimiter_patterns.vim            = ['#']
    let g:neocomplete#delimiter_patterns.perl           = ['::']
    let g:neocomplete#delimiter_patterns.ruby           = ['::']

    imap <expr> <C-h> neocomplete#smart_close_popup() . "\<Plug>(smartinput_C-h)"
    imap <expr> <BS>  neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"
    inoremap <expr> <C-g> neocomplete#undo_completion()

    autocmd MyInit CmdwinEnter * let b:neocomplete_sources = ['vim']
  endfunction

  unlet s:bundle
endif
" }}}
" neocomplcache {{{
if neobundle#is_installed('neocomplcache')
  let s:bundle = neobundle#get('neocomplcache')

  let g:neocomplcache_enable_at_startup = 1
  if !exists('g:neocomplcache_dictionary_filetype_lists')
    let g:neocomplcache_dictionary_filetype_lists = {}
  endif
  let g:neocomplcache_temporary_dir = '~/.vim/.neocon'
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_vim_completefuncs = {
        \ 'Ref' : 'ref#complete',
        \ 'Unite' : 'unite#complete_source',
        \}

  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
  " Delimiter {{{
  if !exists('g:neocomplcache_delimiter_patterns')
      let g:neocomplcache_delimiter_patterns = {}
  endif

  let g:neocomplcache_delimiter_patterns.vim = ['#']
  let g:neocomplcache_delimiter_patterns.ruby = ['::']
  let g:neocomplcache_delimiter_patterns.perl = ['::']
  " }}}

  function! s:bundle.hooks.on_source(bundle) " {{{
    imap <expr> <C-h> neocomplcache#smart_close_popup() . "\<Plug>(smartinput_C-h)"
    imap <expr> <BS>  neocomplcache#smart_close_popup() . "\<Plug>(smartinput_BS)"
    inoremap <expr> <C-g> neocomplcache#undo_completion()
  endfunction " }}}

  unlet s:bundle
endif
" }}}
" neosnippet {{{
let g:neosnippet#disable_select_mode_mappings = 0
let g:neosnippet#snippets_directory = '~/.vim/snippets'

let neosnippet = neobundle#get('neosnippet')
function! neosnippet.hooks.on_source(bundle) " {{{
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
endfunction " }}}
unlet neosnippet
" }}}
" syntastic {{{
let g:syntastic_auto_loc_list = 2
" }}}
" fugitive {{{
let fugitive = neobundle#get('vim-fugitive')
function! fugitive.hooks.on_source(bundle) " {{{
  nnoremap [fugitive] <Nop>
  nmap ,g [fugitive]

  nnoremap [fugitive]s :<C-u>Gstatus<CR>
  nnoremap [fugitive]c :<C-u>Gcommit<CR>
  nnoremap [fugitive]C :<C-u>Gcommit --amend<CR>
  nnoremap [fugitive]b :<C-u>Gblame<CR>
  nnoremap [fugitive]a :<C-u>Gwrite<CR>
  nnoremap [fugitive]d :<C-u>Gdiff<CR>
  nnoremap [fugitive]D :<C-u>Gdiff --staged<CR>

  vmap ,go :Gbrowse<CR>

  autocmd MyInit BufReadPost fugitive://* set bufhidden=delete
endfunction " }}}
unlet fugitive
" }}}
" surround_custom_mapping {{{
let g:surround_custom_mapping = {}
let g:surround_custom_mapping.ruby  = {
  \ '#': "#{\r}",
  \ '3': "#{\r}",
  \ '5': "%(\r)",
  \ '%': "%(\r)",
  \ 'w': "%w(\r)",
  \ }
let g:surround_custom_mapping.eruby = {
  \ '-': "<% \r %>",
  \ '=': "<%= \r %>",
  \ '#': "#{\r}",
  \ }
let g:surround_custom_mapping.tt2 = {
      \ '%': "[% \r %]",
      \ }
let g:surround_custom_mapping.tt2html = g:surround_custom_mapping.tt2
" }}}
" emmet-vim {{{
let g:user_emmet_leader_key = '<C-e>'
" }}}
" ref-vim {{{
let g:ref_cache_dir = $HOME . '/.vim/.ref'
" }}}
" unite-vim {{{
let g:unite_data_directory = '~/.vim/.unite'
let g:unite_force_overwrite_statusline = 0

if executable('ag')
  let g:unite_source_grep_command        = 'ag'
  let g:unite_source_grep_default_opts   = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt  = ''
  let g:unite_source_grep_max_candidates = 200
endif

let unite = neobundle#get('unite.vim')
function! unite.hooks.on_source(bundle) " {{{
  autocmd MyInit FileType unite nmap <buffer><BS> <Plug>(unite_delete_backward_path)
  autocmd MyInit FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    let unite = unite#get_current_unite()

    nmap <buffer> <BS> <Plug>(unite_delete_backward_path)

    nnoremap <buffer><silent><expr> <C-w>h unite#do_action('left')
    nnoremap <buffer><silent><expr> <C-w>l unite#do_action('right')
    nnoremap <buffer><silent><expr> <C-w>j unite#do_action('below')
    nnoremap <buffer><silent><expr> <C-w>k unite#do_action('above')

    if unite.buffer_name == 'files'
      nnoremap <buffer><silent><expr> r unite#do_action('rename')
    endif
  endfunction

  nnoremap <SID>[unite] <Nop>
  nmap <Space> <SID>[unite]

  nnoremap <silent> / :<C-u>Unite line -buffer-name=search -start-insert<CR>
  nnoremap <silent> * :<C-u>UniteWithCursorWord line -buffer-name=search<CR>
  nnoremap <silent> n :<C-u>UniteResume search -no-start-insert<CR>

  nnoremap <silent> <SID>[unite]o :<C-u>UniteWithBufferDir  file file/new file_mru -hide-source-names -buffer-name=files<CR>
  nnoremap <silent> <SID>[unite]O :<C-u>UniteWithCurrentDir file_mru file -buffer-name=files<CR>
  nnoremap <silent> <SID>[unite]f :<C-u>UniteWithBufferDir  file file/new -hide-source-names -buffer-name=files<CR>
  nnoremap <silent> <SID>[unite]F :<C-u>UniteWithCurrentDir file file/new -buffer-name=files<CR>
  nnoremap <silent> <SID>[unite]r :<C-u>UniteWithBufferDir  file_mru -no-split -buffer-name=files<CR>
  nnoremap <silent> <SID>[unite]b :<C-u>Unite buffer -immediately<CR>
  nnoremap <silent> <SID>[unite]B :<C-u>Unite buffer -immediately<CR>
  nnoremap <silent> <SID>[unite]w :<C-u>Unite window:no-current<CR>
  nnoremap <silent> <SID>[unite][ :<C-u>Unite outline fold -vertical -hide-source-names -winwidth=40 -buffer-name=outline<CR>
  nnoremap <silent> <SID>[unite]> :<C-u>Unite output<CR>
  nnoremap <silent> <SID>[unite]p :<C-u>Unite register history/yank -buffer-name=register -no-split<CR>
  nnoremap <silent> <SID>[unite]: :<C-u>Unite history/command -start-insert<CR>
  nnoremap <silent> <SID>[unite]. :<C-u>Unite source<CR>
  nnoremap <silent> <SID>[unite]q :<C-u>Unite qf -no-quit -no-empty -auto-resize -buffer-name=quickfix<CR>
  nnoremap <silent> <SID>[unite]g :<C-u>Unite grep -buffer-name=search<CR>
  nnoremap <silent> <SID>[unite]\c :<C-u>Unite colorscheme -auto-preview<CR>
  nnoremap <silent> <SID>[unite]h :<C-u>Unite help -auto-preview<CR>

  " JavaScript {{{
  autocmd MyInit FileType javascript nnoremap <silent><buffer> <Space>kj :<C-u>Unite -start-insert -default-action=split ref/javascript<CR>
  autocmd MyInit FileType javascript nnoremap <silent><buffer> <Space>kq :<C-u>Unite -start-insert -default-action=split ref/jquery<CR>
  " }}}

  " Ruby {{{
  autocmd MyInit FileType ruby* nnoremap <silent><buffer> <Space>k :<C-u>Unite -start-insert -default-action=split ref/refe<CR>
  autocmd MyInit FileType ruby* nnoremap <silent><buffer> <S-k>    :<C-u>UniteWithCursorWord -default-action=split ref/refe<CR>
  " }}}

  " Perl {{{
  autocmd MyInit FileType perl    nnoremap <silent><buffer> <Space>k :<C-u>Unite -start-insert -default-action=split ref/perldoc<CR>
  autocmd MyInit FileType perl    nnoremap <silent><buffer> <S-k> :<C-u>UniteWithCursorWord -default-action=split ref/perldoc<CR>
  " }}}
endfunction " }}}
unlet unite
" }}}
" foldCC {{{
let foldCC = neobundle#get('foldCC')
function! foldCC.hooks.on_source(bundle) " {{{
  set foldtext=FoldCCtext()
  set foldcolumn=4
endfunction " }}}
unlet foldCC
" }}}
" hier {{{
let g:hier_enabled = 1
" }}}
" quickrun {{{
if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif
" }}}
" watchdogs -- 構文検証 {{{
let g:watchdogs_check_BufWritePost_enable = 1

let g:quickrun_config['watchdogs_checker/_'] = {
      \   'outputter/quickfix/open_cmd' : '',
      \   'hook/hier_update/enable_exit' : 1,
      \   'runner/vimproc/updatetime' : 40,
      \   'hook/unite_quickfix/enable_failure' : 1,
      \   'hook/unite_quickfix/enable_success' : 1,
      \   'hook/unite_quickfix/unite_options' : '-no-quit -no-empty -auto-resize -resume -buffer-name=quickfix',
      \ }
let g:quickrun_config['watchdogs_checker/perl-projectlibs'] = {
      \   'command' : 'perl',
      \   'exec' : '%c %o -cw -MProject::Libs %s:p',
      \   'quickfix/errorformat' : '%m\ at\ %f\ line\ %l%.%#',
      \ }
let g:quickrun_config['watchdogs_checker/cpanfile'] = {
      \   'command' : 'perl',
      \   'exec' : '%c %o -w -MModule::CPANfile -e "Module::CPANfile->load(q|%S:p|)"',
      \   'quickfix/errorformat' : '%m\ at\ %f\ line\ %l%.%#',
      \ }
let g:quickrun_config['perl/watchdogs_checker'] = {
      \   'type' : 'watchdogs_checker/perl-projectlibs',
      \ }
let g:quickrun_config['cpanfile/watchdogs_checker'] = {
      \   'type' : 'watchdogs_checker/cpanfile',
      \ }

let watchdogs = neobundle#get('vim-watchdogs')
function! watchdogs.hooks.on_source(bundle) " {{{
  call watchdogs#setup(g:quickrun_config)
endfunction " }}}
unlet watchdogs
" }}}
" operator-html-escape {{{
let operator_html_escape = neobundle#get('operator-html-escape.vim')
function! operator_html_escape.hooks.on_source(bundle) " {{{
  nmap <C-e> <Plug>(operator-html-escape)
  " nmap <C-S-e> <Plug>(operator-html-unescape)
endfunction " }}}
unlet operator_html_escape
" }}}
" smartinput {{{
call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',  '<BS>',    '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)', '<BS>',    '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',  '<Enter>', '<Enter>')
call smartinput#define_rule({
      \   'at'    : '\s\+\%#',
      \   'char'  : '<CR>',
      \   'input' : "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
      \ })
" }}}
" vim-cpanfile {{{
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
" }}}
" vim-smartchr {{{
let smartchr = neobundle#get('vim-smartchr')
function! smartchr.hooks.on_source(bundle)
  autocmd MyInit FileType javascript inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' === ')
  autocmd MyInit FileType javascript inoremap <buffer><expr> \ smartchr#one_of('function ', '\')
  autocmd MyInit FileType ruby* inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' === ', ' != ')
  autocmd MyInit FileType ruby* inoremap <buffer><expr> , smartchr#loop(', ', ' => ', ',')
  autocmd MyInit FileType coffee inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
  autocmd MyInit FileType coffee inoremap <buffer><expr> \ smartchr#one_of(' ->', '\')
  autocmd MyInit FileType haskell inoremap <buffer><expr> = smartchr#loop(' = ', '=')
  autocmd MyInit FileType haskell inoremap <buffer><expr> . smartchr#one_of(' -> ', '.')
  autocmd MyInit FileType haskell inoremap <buffer><expr> , smartchr#one_of(' <- ', ',')
  autocmd MyInit FileType perl    inoremap <buffer><expr> . smartchr#one_of('.', '->', '.')
  autocmd MyInit FileType perl    inoremap <buffer><expr> , smartchr#one_of(', ', ' => ', ',')
  autocmd MyInit FileType perl    inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' != ', ' =~ ', ' !~ ', ' <=> ', '=')
endfunction
unlet smartchr
" }}}
" eskk.vim {{{
let eskk = neobundle#get('eskk.vim')
function! eskk.hooks.on_source(bundle) " {{{
  let g:eskk#directory = expand('~/.vim/.eskk')

  let user_dictionary = expand('~/Library/Application Support/AquaSKK/skk-jisyo.utf8')
  let large_dictionary = expand('~/Library/Application Support/AquaSKK/SKK-JISYO.L')

  if filereadable(user_dictionary)
    let g:eskk#dictionary = user_dictionary
  endif

  if filereadable(large_dictionary)
    let g:eskk#large_dictionary = large_dictionary
  endif

  imap <C-o> <Plug>(eskk:toggle)
endfunction " }}}
unlet eskk
" }}}
" vim-easymotion {{{
let g:EasyMotion_keys = 'jfkdls:ahgJFKDLS;AHG'
let g:EasyMotion_do_mapping = 0

let g:EasyMotion_mapping_w = 'w'
let g:EasyMotion_mapping_b = 'b'
let g:EasyMotion_mapping_e = 'e'
let g:EasyMotion_mapping_j = 'j'
let g:EasyMotion_mapping_k = 'k'
" }}}
" indentLine {{{
let g:indentLine_showFirstIndentLevel = 1
" }}}
" Align {{{
let alignta = neobundle#get('vim-alignta')
function! alignta.hooks.on_source(bundle)
  vmap ,a :Alignta
  vmap ,= :Alignta =<CR>
  vmap ,> :Alignta =><CR>
endfunction
unlet alignta
" }}}
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
" }}}
" perl-local-lib-path.vim {{{
let g:perl_local_lib_path = "t/lib"
let perl_local_lib = neobundle#get('perl-local-lib-path.vim')
function! perl_local_lib.hooks.on_source(bundle)
  autocmd MyInit FileType perl PerlLocalLibPath
endfunction
unlet perl_local_lib
" }}}
" dwm.vim {{{
let g:dwm_map_keys = 0
" }}}
" lightline.vim {{{
let g:lightline              = {}
let g:lightline.component    = {}
let g:lightline.active       = {}
let g:lightline.separator    = {}
let g:lightline.subseparator = {}

let g:lightline.active.left        = [['mode', 'paste'], ['fugitive', 'filename']]
let g:lightline.colorscheme        = 'jellybeans'
let g:lightline.component.fugitive = '%{exists("*fugitive#head")?fugitive#head():""}'
let g:lightline.separator.left     = ''
let g:lightline.separator.right    = ''
let g:lightline.subseparator.left  = ''
let g:lightline.subseparator.right = ''
" }}}
" }}}

" Colorscheme {{{
set bg=dark
colorscheme noctu
" }}}

command! Sketch call s:sketch() " {{{
function! s:sketch() " {{{
  if !exists('g:sketch_dir')
    let g:sketch_dir = expand('~/sketches')
  endif

  if !isdirectory(g:sketch_dir)
    call mkdir(g:sketch_dir, 'p')
  endif

  let basename = strftime('%Y%m%d%H%M%S')
  let filename = g:sketch_dir . '/' . basename
  execute ':edit ' . filename
endfunction " }}}
" }}}

" Local {{{
let local_vimrc_path = expand('~/.local.vimrc')
if filereadable(local_vimrc_path)
  exec 'source ' . local_vimrc_path
endif
unlet local_vimrc_path
" }}}
