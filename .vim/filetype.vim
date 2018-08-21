augroup filetypedetect
	au BufRead,BufNewFile *.rb setfiletype ruby
"	au BufRead,BufNewFile *.php setfiletype php
    au BufRead,BufNewFile *.ts setfiletype javascript
	au BufRead,BufNewFile *.phtml setfiletype php
"	au BufRead,BufNewFile *.swift setfiletype swift
	au BufRead,BufNewFile *.conf setfiletype conf
augroup END
