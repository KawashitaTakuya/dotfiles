filetype plugin indent off
if has('vim_starting')
	set nocompatible
	" neobundleをインストールしていない場合は自動インストールする
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		" neobundleのクローン
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
	" molokaiをインストールしていない場合は自動インストールする
	if !isdirectory(expand("~/.vim/colors/"))
		echo "install molokai..."
		:call system("git clone https://github.com/tomasr/molokai ~/.vim/molokai")
		:call system("mkdir ~/.vim/colors/")
		:call system("mv ~/.vim/molokai/colors/molokai.vim ~/.vim/colors/")
		:call system("rm -rf ~/.vim/molokai")
	endif
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/

" dein scripts  -----------------------------
if &compatible
	set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
	call dein#begin('$HOME/.cache/dein')
	call dein#add('Shougo/dein.vim')
	call dein#add('Shougo/neomru.vim')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('tpope/vim-fugitive')
"	call dein#add('roxma/nvim-yarp')
"	call dein#add('roxma/vim-hug-neovim-rpc')
"	call dein#add('Shougo/denite.nvim')
"	call dein#add('Shougo/deoplete.nvim')

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif



call neobundle#begin(expand('~/.vim/bundle/'))

" バンドル 
NeoBundle 'Shougo/unite.vim'

" vim8 から使えない
"NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/denite.nvim'
"NeoBundle 'bling/vim-airline'
" nerdtree
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'seventhsense/nerdtree', 'development'
" カラースキーマ
NeoBundle 'tomasr/molokai'
" Uniteのカラースキーマ
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'lambdalisue/unite-grep-vcs'

"NeoBundle 'Shougo/vimfiler'

" 非同期処理を行ってくれる
NeoBundle 'Shougo/vimproc'
" .vim/bundle/vimproc内で環境に合わせて叩く
"'windows' : 'make -f make_mingw32.mak'
"'cygwin' : 'make -f make_cygwin.mak'
"'mac' : 'make -f make_mac.mak'
"'unix' : 'make -f make_unix.mac'

" 補完
" vim-clang
" NeoBundle 'Shougo/neocomplete.vim'
" bNeoBundle 'justmao945/vim-clang'
" NeoBundle 'Shougo/neoinclude.vim'

" YouCompleteMe
" NeoBundle "Valloric/YouCompleteMe"

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" EditorConfig
NeoBundle 'editorconfig/editorconfig-vim'

" vimを開いたときに自動的にctags用のtagが作成される
NeoBundle 'soramugi/auto-ctags.vim'
" TagsGenerate でtagを再構築してくれるようになる
NeoBundle 'szw/vim-tags'

" Vimとtmuxのキーバインドを同じようにする
NeoBundle 'christoomey/vim-tmux-navigator'

" ファイル検索に使う
NeoBundle 'ctrlpvim/ctrlp.vim'

" 文字の置換
NeoBundle 'osyo-manga/vim-over'

" ag vim
NeoBundle 'rking/ag.vim'


" C++11用シンタックスハイライト
NeoBundleLazy 'vim-jp/cpp-vim', {'autoload' : {'filetypes' : 'cpp'} }

NeoBundle "majutsushi/tagbar", { "autoload": { "commands": ["TagbarToggle"] } }
if ! empty(neobundle#get("tagbar")) " Width default 40
	let g:tagbar_width = 30 " Map for toggle
	nn <silent> <leader>t :TagbarToggle<CR>
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" ヘッダとソースファイルを切り替える
NeoBundle 'mopp/next-alter.vim'
"NeoBundleLazy 'kana/vim-altr'

" vimrcに記述されたプラグインでインストールされてないものがないかチェックする
NeoBundleCheck

call neobundle#end()


" ===== 表示 ======
" タイトルを表示しない
set notitle
" タイトルを飛ばす
set shortmess+=I
" ステータスラインを表示
set laststatus=2
" カーソル行のライン 
set cursorline

" 入力中のコマンドを表示する
set showcmd
" 不可視文字を表示する
set list
" 行末の半角スペースとタブを表示する
set listchars=trail:~
set listchars=tab:>-,extends:>,precedes:<,nbsp:%
" バックスペースを使えるようにする
set backspace=indent,eol,start
" スワップファイルを使わないようにする
set noswapfile
" バックアップファイルを使わないようにする
set nobackup
" モードラインを有効にしない
set nomodeline
" 編集中でも他のファイルを開くことが出来る
set hidden
" 更新時自動読み込み
set autoread
" 保存されていないファイルがあるとき保存の確認を行うか
set confirm
" 行数を表示する
set number
" 改行時に自動でインデントを設定
set smartindent
" スクロールする時に上下が見えるようにする
set scrolloff=8
" スクロールする時に左右が見えるようにする
set sidescrolloff=16
" タブの設定
set tabstop=4
set softtabstop=4
" instertモードで自動的にIMEがONになるのを防ぐ
set iminsert=0
" カーソルの行数とか場所を表示する
set ruler

" 右端で折り返すかどうか
set textwidth=0
set formatoptions=q

" クリップボードを使えるようにする
set clipboard+=unnamed,autoselect
" ターミナル接続を高速にする
set ttyfast

" ===== 検索 =====
" 検索結果をハイライト表示
set hlsearch
" 検索ワードの最初の文字を入力した時点で検索を開始 
set incsearch
" 検索で大文字小文字を区別しない
set ignorecase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
" 検索時にファイルの最後まで行ったら最初に戻る
set gdefault
" 検索で大文字小文字両方が入力されたら区別して検索
set smartcase
" コマンド補完を強化
set wildmenu
" コマンド補完を開始するキー
set wildchar=<tab>
" コマンド・検索パターンの履歴数
set history=1000
" 補完に辞書ファイルを使用
set complete+=k
" マッチするところまで自動補完
set wildmode=list

" 日本語入力
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set guifont=Consolas:h12:cSHIFTJIS

"set ambiwidth=double

" ====== カラースキーマ =====
syntax on
colorscheme molokai
set t_Co=256

" アンダーラインを引く
highlight CursorLine cterm=underline 
" 背景をターミナルと同じにする
highlight Normal ctermbg=black ctermfg=grey

" ショートカットキー
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 半ページ移動
nnoremap J <C-D>
nnoremap K <C-U>

" 先頭文字行末文字に移動
nnoremap H ^
nnoremap L $

" 行の末尾，先頭で挿入モード開始
nnoremap A I
nnoremap F A

" 単語移動関連

" タブ作成・移動など
noremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sr <C-w>x
nnoremap sn gt
nnoremap sb gT
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>

nnoremap -L <C-w>><CR>

" NERDTreeのショートカット
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-n>b :Bookmark<CR>
nnoremap <silent><C-n>d :ClearBookmarks<CR>
" NERDTreeのツリーを開く場所
let g:NERDTreeWinPos="left" "right
" NERDTreeの幅
let g:NERDTreeWinSize="28"
" NERDTree config
let g:NERDTreeShowBookmarks=1
" ignore
let g:NERDTreeIgnore=['\.vim$','\.meta$']
" 隠しファイルのON
let g:NERDTreeShowHidden=1

nnoremap <silent><C-w> :TagbarTottle<CR>

" 強制的にコマンドモードにするショートカット
inoremap jj <Esc>
inoremap kk <Esc>

" EXモードの無効化
nnoremap Q <Nop>

" Esc連打で検索のハイライトを消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Terminalの背景色とTerminalで使うvimの背景色を同じにする
if !has('gui_running')
	augroup seiya
		autocmd!
		autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
		autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
		autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
		autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
		autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
	augroup END
endif

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0

let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1

" clang-format用関数
function! ClangFormat()
	let now_line = line(".")
	exec ":%! clang-format"
	exec ":" . now_line
endfunction

" 保存時に自動的にclang-format
if executable('clang-format')
	augroup cpp_clang_format
		autocmd!
		autocmd BufWrite,FileWritePre,FileAppendPre *.h call ClangFormat()
		autocmd BufWrite,FileWritePre,FileAppendPre *.cpp call ClangFormat()
	augroup END
endif

nnoremap sc :call ClangFormat()<CR>

" ctagsの設定
" key bind
nnoremap <C-n> g<C-]>
nnoremap <C-b> <C-t>

" uniteの設定
" 起動時にインサートモードで開始するかどうか
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
let g:unite_source_file_mru_filename_format = ''
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

nnoremap <silent> <Space>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>n :<C-u>Unite file/new<CR>
nnoremap <silent> <Space>f :<C-u>Unite file_rec<CR>
nnoremap <silent> <Space>uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <Space>ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <Space>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" unite grep に ag を使う
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
	let g:unite_source_grep_recursive_opt = ''
endif

" vim-over(置換のキーマップ)
" 起動
"nnoremap <silent> <Space>m : OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" markdownの設定
au BufRead,BufNewFile *.md set filetype=markdown

"nnoremap <Space>a <Plug>(altr-forward)

" ヘッダとソースファイルを切り替える
nnoremap [nextalter] <Nop>
nmap <Space>n [nextalter]
nnoremap <silent> [nextalter]o :<C-u>OpenNAlter<CR>


nnoremap [denite] <Nop>
nmap <Space>u [denite]

"現在開いているファイルのディレクトリ下のファイル一覧。
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir
	\ -direction=topleft -cursor-wrap=true file file:new<CR>
"バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite -direction=topleft -cursor-wrap=true buffer<CR>
"レジスタ一覧
nnoremap <silent> [denite]r :<C-u>Denite -direction=topleft -cursor-wrap=true -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [denite]m :<C-u>Denite -direction=topleft -cursor-wrap=true file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [denite]c :<C-u>Denite -direction=topleft -cursor-wrap=true bookmark<CR>
"ブックマークに追加
nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>

".git以下のディレクトリ検索
nnoremap <silent> [denite]k :<C-u>Denite -direction=topleft -cursor-wrap=true
	\ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
	\ file_rec/git<CR>

call denite#custom#source('file'    , 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
call denite#custom#source('buffer'  , 'matchers', ['matcher_regexp'])
call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
	\ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-W>', '<denite:move_up_path>', 'noremap')
call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'direction', 'top')


" airline(ステータスバーの見た目) -----------------
let g:airline_theme = 'luna'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" font
let g:airline_powerline_fonts = 1
set laststatus=2

let g:airline_mode_map = {
	\ 'n'  : 'Normal',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'c'  : 'Command',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V-Line',
	\ '⌃V' : 'V-Block',
\ }

let g:airline#extensions#default#layout = [
	\ [ 'a', 'b', 'c' ],
	\ [ 'x', 'y', 'z', 'error', 'warning']
\ ]


let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'

"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'

