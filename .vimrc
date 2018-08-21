
syntax on "コードに色つけ

" {{{ encoding
set encoding=utf8 "vim内部での文字コード指定
"set fileencoding=utf8 "file encoding の自動判別対象の指定
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
scriptencoding=utf-8
" }}}

" システムのvimrcとか読み込んでいる場合に備えて
filetype off
filetype plugin indent off "filetype plugin による indent 等の設定 

" {{{ dein.vim
if v:version > 703
	" プラグインが実際にインストールされるディレクトリ
	let s:dein_dir = expand('~/.vim/dein')
	" dein.vim 本体
	let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

	" dein.vim がなければ github から落としてくる
	if &runtimepath !~# '/dein.vim'
		if !isdirectory(s:dein_repo_dir)
			execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
			endif
	endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

	" 設定開始
	if dein#load_state(s:dein_dir)
		call dein#begin(s:dein_dir)

		" プラグインリストを収めた TOML ファイル
		let g:rc_dir    = expand('~/.vim/rc')
		let s:toml      = g:rc_dir . '/dein.toml'
		let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

		" TOML を読み込み、キャッシュしておく
		call dein#load_toml(s:toml,      {'lazy': 0})
		call dein#load_toml(s:lazy_toml, {'lazy': 1})

		" 設定終了
		call dein#end()
		call dein#save_state()
	endif

	" もし、未インストールものものがあったらインストール
	if dein#check_install()
		call dein#install()
	endif
endif
" }}}

" {{{ visit
set number "行番号表示
set ruler "カーソルの位置を表示する表示
set expandtab
set tabstop=4 "タブのスペース4つ分
set shiftwidth=4 "自動挿入インデントの幅
set paste
set softtabstop=0 "tabキーを押したときの幅 0はtabstopと同じ
"set list "不可視文字を表示
"set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:% "不可視文字の表示記号指定
set nolist
set showmatch "閉じ括弧に対応する括弧を一瞬表示
set matchtime=1 "括弧を閉じたときに次の開き括弧が表示される
set title "編集中のファイル名を表示
set foldmethod=marker "折り畳みできるように。
set laststatus=2 "ステータスラインの表示位置
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " ステータスラインに情報表示
set ambiwidth=double "全角文字の幅を2に固定する
set clipboard=unnamed,autoselect
set confirm "保存されてないファイルの終了時に確認

" }}}

" {{{ indent
set autoindent
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"set cindent "cスタイルのインデントを自動で入れる
set indentkeys=!^F,o,O,0<Bar>
" }}}

" {{{ cursols
set backspace=indent,eol,start " backspaceキーの影響範囲に制限を設けない
set cursorline "カーソル行にラインを表示
set whichwrap=b,s,h,l,<,>,[,] "行頭行末の左右移動で行をまたぐ
set scrolloff=8 "上下8行の視界を確保
set virtualedit=block "文字のないところに移動できるようにする
" }}}

" {{{ search or replace
set ignorecase "検索に大文字小文字の区別をつけない
set hlsearch "検索文字列をハイライト
set gdefault "置換時にgオプションを有効にする
" }}}

" {{{ command shortcut maps
nmap <Esc><Esc> :nohlsearch<CR><Esc>
map <F2> yypki//<SPACE>{{{<SPACE><ESC>jo}<ESC>o//<SPACE>}}}<CR><ESC>
map <silent><C-e> :NERDTreeToggle<CR>
nmap [q :cprevious<CR>
nmap ]q :cnext<CR>
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" {{{ color
set t_Co=256
colorscheme molokai
autocmd ColorScheme * highlight Visual term=reverse cterm=reverse ctermbg=250 guibg=#cccccc↲
autocmd ColorScheme * highlight LineNr ctermfg=231 guifg=#cccccc↲
autocmd ColorScheme * highlight Comment ctermfg=9 guifg=#cccc66↲

" }}}

" {{{ Vim内 I/O
"set mouse=a "マウスの入力を受け付ける

" コメント挿入後改行時に、コメントアウトになるのを防ぐ。
augroup auto_comment_off
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
augroup END

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.* setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufNewFile,BufRead *.conf setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END

" }}}

" {{{ read outside file
if filereadable(expand('~/.vim/indent/common.vim'))
	source ~/.vim/indent/common.vim
endif
" }}}

" {{{ 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on
 
    " PODバグ対策
    syn sync fromstart
 
    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space '　' display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace '[ \t]\+$' display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab '\t' display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction
 
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
" }}}

" filetype 検出をon
"filetype on
"filetype plugin indent on "filetype plugin による indent 等の設定
"filetype indent on

