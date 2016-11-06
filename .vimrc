
syntax on "コードに色つけ

" システムのvimrcとか読み込んでいる場合に備えて
filetype off
filetype plugin indent off "filetype plugin による indent 等の設定

" {{{ 表示
set number "行番号表示
set ruler "カーソルの位置を表示する表示
set tabstop=4 "タブのスペース4つ分
"set expandtab "タブを \t ではなく、半角空白にする
set shiftwidth=4 "自動挿入インデントの幅
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set paste
set softtabstop=0 "tabキーを押したときの幅 0はtabstopと同じ
set cindent "cスタイルのインデントを自動で入れる
set list "不可視文字を表示
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:% "不可視文字の表示記号指定
set showmatch "閉じ括弧に対応する括弧を一瞬表示
set matchtime=1 "括弧を閉じたときに次の開き括弧が表示される
set title "編集中のファイル名を表示
set foldmethod=marker "折り畳みできるように。
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set laststatus=2 "ステータスラインの表示位置
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " ステータスラインに情報表示
set ambiwidth=double "全角文字の幅を2に固定する

" }}}

" {{{ ファイル自体に対して
set encoding=utf8 "vim内部での文字コード指定
set fileencoding=utf8 "file encoding の自動判別対象の指定
set confirm "保存されてないファイルの終了時に確認
" filetype plugin indent on "filetype plugin による indent を onに

" }}}

" {{{ カーソル周り
set backspace=indent,eol,start " backspaceキーの影響範囲に制限を設けない
set cursorline "カーソル行にラインを表示
set whichwrap=b,s,h,l,<,>,[,] "行頭行末の左右移動で行をまたぐ
set scrolloff=8 "上下8行の視界を確保
set virtualedit=block "文字のないところに移動できるようにする

" }}}

" {{{ 検索/置換
set ignorecase "検索に大文字小文字の区別をつけない
set hlsearch "検索文字列をハイライト
set gdefault "置換時にgオプションを有効にする

" }}}

" {{{ Vim内 I/O
"set mouse=a "マウスの入力を受け付ける


" コメント挿入後改行時に、コメントアウトになるのを防ぐ。
augroup auto_comment_off
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
augroup END

" }}}



" {{{ 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on
 
    " PODバグ対策
    syn sync fromstart
 
    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction
 
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
" }}}


" filetype 検出をon
filetype plugin indent on "filetype plugin による indent 等の設定

