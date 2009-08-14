set ts=4 " Табуляция равна 4-ем пробелам
set sts=4 " Двигать блоки в визуальном режиме на 4 пробела с помощью клавиш < и >
set sw=4 "
set et
set ai " Включаем автоотступ

" Делаем «умный» отступ в файлах содержащих Python-код после перечисленных ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Другой способ, после последовательного набора :Enter делать табуляцию (Я предпочитаю первый способ),
" расскоментируйте строку, убрав ", если собираетесь использовать этот подход
" im :<CR> :<CR><TAB>
colorscheme darkblue " (Цветовая схема, работает у меня в rxvt-unicode с патчем для поддержки 256 цветов,
" увидеть её можно ниже на скриншоте)
syntax on " Включить подсветку синтаксиса, если это возможно (тоесть если типа файла определен)
set nu " Включаем нумерацию строк
set mousehide " Спрятать курсор мыши когда набираем текст
set mouse=a " Включить поддержку мыши
set termencoding=utf-8 " Кодировка терминала
set novisualbell
set t_vb=
set backspace=indent,eol,start whichwrap+=<,>,[,]
set nocompatible " Vim не vi
set showtabline=0
set modifiable
set foldcolumn=1
set smartindent
set wrap
set linebreak
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
autocmd BufWritePre *.py normal m`:%s/\s\+$//e `` " Убирать пробелы в конце строки
" Установим статусную строку
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
set laststatus=2
call <SID>SetStatusLine()

set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

"  Настройка omnicomletion для Python, Ruby(а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" Копи/паст по Ctrl+C/Ctrl+V
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
" Табы по Alt+n
hi Tb_Changed ctermbg=black ctermfg=yellow 
hi Tb_VisibleChanged ctermbg=black ctermfg=magenta

"Схраниться по <F2>
nmap <F2> :w<cr>
imap <F2> <esc>:w<cr>i
vmap <F2> <esc>:w<cr>i

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
