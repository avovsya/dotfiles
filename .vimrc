" ==============================================================================
" Файл пользовательских настроек vim (7.3)
" Maintrainer: azz
" ==============================================================================
" "Bundles"                 Пакеты плагинов {{{1
" ==============================================================================
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
	!git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

" Need to review
" ==============================================================================
	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier. 
		"if has('win32') || has('win64')
		 " set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		"endif
	" }


	" set virtualedit=onemore 	   	" allow for cursor beyond last character
	" http://www.uvm.edu/~gcd/2008/12/virtualedit-in-vim/

		"" Creating directories if they don't exist
		"silent execute '!mkdir -p $HVOME/.vimbackup'
		"silent execute '!mkdir -p $HOME/.vimswap'
		"silent execute '!mkdir -p $HOME/.vimviews'


	" nnoremap ; :

    " Wrapped lines goes down/up to next row, rather than next line in file.
    " nnoremap j gj
    " nnoremap k gk

" visual shifting (does not exit Visual mode)
	" vnoremap < <gv
	" vnoremap > >gv

" ShowMarks {
		" let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		" Don't leave on by default, use :ShowMarksOn to enable
		" let g:showmarks_enable = 0
		" For marks a-z
		" highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
		" For marks A-Z
		" highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
		" For all other marks
		" highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
		" For multiple marks on the same line.
		" highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
	" }

"nmap <Leader>ff :call <SID>ToggleFold()<CR>
"function! s:ToggleFold()
"    if &foldmethod == 'marker'
"        let &l:foldmethod = 'syntax'
"    else
"        let &l:foldmethod = 'marker'
"    endif
"    echo 'foldmethod is now ' . &l:foldmethod
"endfunction

" System clipboard interaction.  Mostly from:
" https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv

" ==============================================================================

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "git://github.com/gmarik/vundle.git"
Bundle "git://github.com/ujihisa/netrw.vim"
Bundle "git://github.com/tyru/fencview.vim.git"
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle "git://github.com/vim-scripts/matchit.zip.git"
Bundle "git://github.com/vim-scripts/sessionman.vim.git"
Bundle "git://github.com/Shougo/neocomplcache.git"
Bundle "git://github.com/Shougo/neocomplcache-snippets-complete"
Bundle "git://github.com/tpope/vim-fugitive.git"
Bundle "git://github.com/gregsexton/gitv.git"
Bundle "git://github.com/xolox/vim-easytags.git"
Bundle "git://github.com/vim-scripts/Open-associated-programs.git"
Bundle "git://github.com/Raimondi/delimitMate.git"
Bundle "git://github.com/vim-scripts/jsflakes.vim.git"
Bundle "git://github.com/michalliu/jsruntime.vim.git"
Bundle "git://github.com/michalliu/jsoncodecs.vim.git"
Bundle "git://github.com/majutsushi/tagbar.git"
Bundle "git://github.com/thinca/vim-template.git"
Bundle "git://github.com/scrooloose/syntastic.git"
Bundle "git://github.com/kien/ctrlp.vim.git"
Bundle "git://github.com/kchmck/vim-coffee-script.git"
Bundle "git://github.com/rom399/vim-colors.git"
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle "git://github.com/digitaltoad/vim-jade.git"
Bundle "git://github.com/skammer/vim-css-color.git"
Bundle 'git://github.com/vim-scripts/IndexedSearch.git'
Bundle "git://github.com/vim-scripts/vimwiki.git"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/Lokaltog/vim-powerline.git"
Bundle "git://github.com/fholgado/minibufexpl.vim.git"

" Тестируемые
Bundle "git://github.com/vim-scripts/EasyGrep.git"
Bundle "git://github.com/godlygeek/tabular.git"

Bundle "git://github.com/zaiste/tmux.vim.git"
Bundle "git://github.com/benmills/vimux.git"

Bundle "git://github.com/vim-scripts/YankRing.vim.git"
Bundle "git://github.com/vim-scripts/diffchanges.vim.git"

Bundle "git://github.com/vim-scripts/scratch.vim.git"
Bundle "git://github.com/vim-scripts/bufkill.vim.git"
Bundle "git://github.com/tpope/vim-repeat.git"

filetype plugin indent on
" ==============================================================================
" "Primary"                 Приоритетные настройки {{{1
" ==============================================================================
let s:iswin = has('win32') || has('win64')

let $TEMP = '~/.vim/tmp'
let $VIMHOME = '~/.vim'

" Отключение совместимости с vi
set nocompatible

" Использовать англоязычное меню
set langmenu=en
set ttyfast
" ==============================================================================
" "Quick"                   Быстрые настройки {{{1
" ==============================================================================
" (0 - откл. 1 - вкл.)
let s:us_folding              = 1 " Свертывание участков кода
let s:us_linewrap             = 0 " Перенос длинных строк
let s:us_goto_last_pos        = 1 " Перемещать курсор на предыдущую позицию
" при открытии файла
" ==============================================================================
" "General"                 Основные настройки {{{1
" ==============================================================================
" AutoReload .vimrc
if has("autocmd")
	autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Включение подсветки синтаксиса
syntax on

" Включение определения типов файлов
filetype plugin indent on

" Отключение оповещения морганием и звуком
set novisualbell
set t_vb=

" Disable bell in GUI
autocmd GUIEnter * set novisualbell t_vb=

" Язык помощи
set helplang=en,ru

" Переход на предыдущую/следующую строку
set backspace=indent,eol,start

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap+=[,]

" Не выгружать буфер, при переключении на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden

set autoread            " Включение автоматического перечтения файла при изменении
"set autochdir           " Автоматически устанавливать текущей, директорию отрытого файла
set browsedir=buffer    " Начинать обзор с каталога текущего буфера
set confirm             " Включение диалогов с запросами

" Опции авто-дополнения
set completeopt=longest,menuone

" Если данная опция включена, то это позволяет отображать как имя метки,
" так и отредактированную форму шаблона поиска (если такая имеется), в
" качестве возможных соответствий при завершении слова в режиме Вставки
" (см. |вставка-автодополнение|) из файла меток. Таким образом, если вы
" ищете соответствие для функции на языке C, то вы сможете видеть
" необходимые аргументы для этой функции (если это позволяет стиль
" написания исходного текста программы).
set showfulltag

" Показывать все возможные кандидаты при авто-завершении команд
"set nowildmenu
set wildmode=list:longest,full

" Игнорировать данные файлы при автозавершении имён
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.pyo,.hg,.git,.svn

" Включение проверки орфографии, для русского и английского
set spelllang=ru_yo,en_us
"set spell

" Раскладка по умолчанию - английская
set iminsert=0

" Не перерисовывать окно при работе макросов
"set lazyredraw

" Испольвозать англоязычный интерфес
if s:iswin
	language message en
else " для linux
	language mes C
endif

" русская раскладка клавиатуры
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" ==============================================================================
" "Files"                   Настройки для файлов {{{1
" ==============================================================================

" Кодировка по умолчанию
set encoding=utf-8
set fileencodings=utf-8,cp1251

set fileencodings=ucs-bom,utf-8,cp1251

set fileformat=unix          " Формат файла по умолчанию
set fileformats=unix,dos,mac " Порядок определения формата файла

" ==============================================================================
" "Backup,Undo,Swap"        Резервное копирование {{{1 "
" ==============================================================================
" История команд
set history=1000

command! W exec 'w !sudo tee % > /dev/null' | e! " save file with root permissions

" Максимальное количество изменений, которые могут быть отменены
set undolevels=5000

" Настройки отмены изменений
if v:version >= 703
	set undodir=$TEMP
	set undofile
endif

set backupdir=~/.vim/tmp/bac//,/tmp
set directory=~/.vim/tmp/swp//,/tmp
" ==============================================================================
" "GUI"                     Вид {{{1
" ==============================================================================
set t_Co=256	" 256 colors in terminal
set ruler       " Включение отображения позиции курсора (всё время)

set mouse=a     " Подключение мыши
set mousehide   " Прятать указатель во время набора текста

set guicursor=  " Switch off cursor blink

set cursorline  " Включить подсветку текущей позиции курсора
set cursorcolumn
set mousemodel=popup

set scrolloff=999


if s:iswin
	set gfn=DejaVu_Sans_Mono:h10:,cRUSSIANconsolas:h11,
elseif has("gui_gtk2")
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

set background=dark
try
	let g:solarized_termcolors=256
	colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme desert
endtry

if s:iswin
	" Установка высоты и ширины окна
	winsize 90 30
endif

set guioptions-=b   " Отключение скролл-баров
set guioptions-=r
set guioptions-=T   " Убрать toolbar
set guioptions+=c   " Отключение графических диалогов
set guioptions-=e   " Замена графических табов, текстовыми

set number          " Включение отображения номеров строк
set numberwidth=5
set shortmess+=I    " Отключение приветственного сообщения
"set showtabline=2   " Показывать по умлочанию строку со вкладками Use MiniBufExplore instead
set wildmenu        " Показывать меню в командной строке
" для выбора вариантов авто-дополнения
set showmatch       " Довсвечивать совпадающую скобку
set nolist          " Не подсвечивать некоторые символы
"set splitbelow splitright

" Замена символа "-" на пробел, для свёрнутых блоков
"set fillchars=fold:\

" Установка символов для подсветки
if has('multi_byte')
	if version >= 700
		set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:×
	else
		set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
	endif
endif

" Подсветка всех слов под курсором
"autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
" ==============================================================================
" "Statusline"              Статусная строка {{{1
" ==============================================================================
" Включение отображения незавершенных команд в статусной строке
set showcmd
set laststatus=2
" ==============================================================================
" "Indent"                  Отступы и табуляция {{{1
" ==============================================================================
set autoindent                          " Наследовать отступы предыдущей строки
set smartindent                         " Включить 'умные' отступы
"set expandtab                           " Преобразование таба в пробелы
set shiftwidth=4                        " Размер табуляции по умолчанию
set softtabstop=4
set tabstop=4
" ==============================================================================
" "Search"                  Поиск текста {{{1
" ==============================================================================
set hlsearch        " Включение подсветки слов при поиске
set incsearch       " Использовать поиск по мере набора
set ignorecase " игнорировать регистр при поиске
set smartcase  " искать сначала по заданному регистру а потом в любом
set gdefault   " 'g' flag for all commands like :%s/a/b

" В режиме поиска используется раскладка, заданная по умолчанию
set imsearch=-1
" ==============================================================================
" "Folding"                 Свертывание блоков текста {{{1
" ==============================================================================
if s:us_folding
	" Включение складок
	set foldenable

	" Ширина колонки
	"set foldcolumn=4

	" Опция задаёт значение опции 'foldlevel' в начале редактирования нового
	" буфера в окне. Её полезно использовать для закрытия всех складок в
	" файле в начале редактирования (при значении 0), закрытия некоторых
	" складок (при значении от 1) или открывания всех складок (при значении 99)
	set foldlevelstart=99

	" Опция задаёт метод образования складок для текущего окна.
	" Список возможных значений:
	"   manual  Складки создаются вручную.
	"   indent  Складка формируется строками с одинаковыми отступами.
	"   expr    Уровень складки для строки задаётся значением опции 'foldexpr'.
	"   marker  Складки задаются с использованием маркеров.
	"   syntax  Складки задаются в соответствии с правилами подсветки синтаксиса.
	"   diff    В складки помещаются неизменённые фрагменты текста
	set foldmethod=indent

	" Опция назначает максимальное количество вложений складок для методов
	" "indent" и "syntax". Опция позволяет избежать создания слишком
	" большого количества складок. Использование значения, большего, чем 20,
	" не работает, поскольку встроенное ограничение количества вложений в
	" складках соответствует 20
	set foldnestmax=3
else
	set nofoldenable
	set foldmethod=manual

endif

" ==============================================================================
" "Sessions"                Сессии {{{1
" ==============================================================================
" Опции сессий
set sessionoptions=curdir,buffers,folds,tabpages,winpos,help,blank,resize,winpos,winsize
" Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот
set sessionoptions+=unix,slash
" ==============================================================================
" "LineWrap"                Перенос длинных строк {{{1
" ==============================================================================
if s:us_linewrap
	" Задать ширину строки
	set textwidth=80
	" Перенос по словам
	set linebreak
	if v:version >= 703
		" Подсвечивать границы
		set colorcolumn=80
	endif
	let &sbr = nr2char(8618).' ' "Show -> at the beginning of wraped line
	set wrap
else
	" Запретить перенос строк
	set nowrap
endif
" ==============================================================================
" "Mappings"                Горячие клавиши {{{1
" ==============================================================================
let mapleader=","

" "MISC"	{{{2

inoremap jj <Esc>

" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Page down with <Space>
nmap <Space> <PageDown>

" Move in insert mode with Ctrl+h,j,k,l
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" Move in command line with Ctrl+h,j,k,l
cmap <C-h> <Left>
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-l> <Right>

" Show hidden chars
nmap <C-q> :call ToggleListChars()<cr>

" Ctrl+S
map <C-s> <esc>:w<CR>
imap <C-s> <C-o>:w<CR>

" ,p Paste helper
set pastetoggle=<Leader>p

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>n :vnew <C-R>=expand("%:p:h") . '/'<CR>

" ,g Toggle GUI Noise
map <Leader>g <Esc>:call ToggleGUINoise()<cr>

" Show unsaved changes
" http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
" http://stackoverflow.com/questions/749297/can-i-see-changes-before-i-save-my-file-in-vim
nmap <Leader>z :DiffChangesDiffToggle<CR>

" "SPLITS AND BUFFERS"	{{{2
" Создаем пустой сплит относительно текущего
nmap <Leader><Bar> :rightbelow vnew <bar> set nobuflisted<CR>
nmap <Leader>- :rightbelow new <bar> set nobuflisted<CR>

" Переключение по сплитам
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Resize window
noremap <Up> 5<C-W>+
noremap <Down> 5<C-W>-
noremap <Left> 5<C-W><
noremap <Right> 5<C-W>>

" ,bl show buffers
nmap <Leader>bl :ls<cr>:b
nmap <Leader>bp :bp<cr>
nmap <Leader>bn :bn<cr>
nmap <S-Tab> :bp<cr>
nmap <Tab> :bn<cr>

" Wipeout buffer but save split
"nmap <Leader>qq <Plug>Kwbd
nmap <Leader>qq :BW<CR>

" Wipeout buffer and close split
nmap <Leader>qw :bw<CR>

" "FORMATING" {{{2
" Reformat whole file
nmap <Leader>ff gg=G''

" Remove trailing spaces
nmap <Leader>f<Space> :%s/\s\+$//<cr>''

" Yank to the end of the line
nnoremap Y y$

" "FIND AND REPLACE IN FILE" {{{2
" Replace the word under cursor
nnoremap <Leader>rr :call Replace(1)<CR>

" Quick replace
nnoremap <Leader>rs :call Replace(0)<CR>

" <Esc><Esc>  Clear the search highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><ESC>

" Centered search results
nmap n nzz
nmap N Nzz
nmap g* g*zz
nmap g# g#zz
nmap * *zz
nmap # #zz

" "EDIT THING"	{{{2
" ,ev open _vimrc in new tab
nmap <leader>ev :e $MYVIMRC<CR>
"
" ,ei open _vimrc in new tab
nmap <leader>ei :e .gitignore<CR>

" "SESSIONS"	{{{2
nmap <Leader>sl :SessionList<cr>
nmap <Leader>ss :SessionSave<cr>
nmap <Leader>sS :SessionSaveAs<cr>

" "ALIGN"	{{{2
" Tabularize
if exists(":Tab")
	nmap <leader>a\| :Tab /\|<CR>
	vmap <leader>a\| :Tab /\|<CR>
	nmap <leader>a= :Tab /=<CR>
	vmap <leader>a= :Tab /=<CR>
	nmap <leader>a: :Tab /:\zs<CR>
	vmap <leader>a: :Tab /:\zs<CR>
	nmap <leader>a :Tab /
	vmap <leader>a :Tab /
endif
" "TAGS"	{{{2
"Открытие/закрытие окна tagbar (plugin-tagbar)
map <Leader>tt :TagbarToggle<cr>
" Создать базу данных для файлов в текущей директории
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" map <leader>tg :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

" "YANK RING"	{{{2
" ==============================================================================
nmap <Leader>yy :YRShow<CR>
" ==============================================================================
" }}}
" ==============================================================================
" "Functions"               Пользовательские функции {{{1
" ==============================================================================
let s:cmdline = ""

function! ToggleGUINoise()
	if &go==''
		"exec('se go=mTrL')
		exec('se go=mrL')
		exec('se go-=b')
		echo "Show GUI elements"
	else
		exec('se go=')
		echo "Show no GUI elements"
	endif
endfunction

function! ToggleListChars()
	if &list==1
		:set nolist
	else
		:set list
	endif
endfunction

" Открытие файла приложением определённым по умолчанию
function! s:OpenFileInDefaultApp()
	if s:cmdline == ""
		execute '!"%"'
	else
		execute '!"% ' . s:cmdline . '"'
	endif
endfunction

function! Replace(state)
	if(a:state==1)
		let s:word = input("Replace `" . expand('<cword>') . "` with: ")
		:exe '%s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
		:unlet! s:word
	else
		let s:what = input("What to replace: ")
		let s:word = input("Replace `". s:what . "` with: ")
		:exe '%s/\<' . s:what . '\>/' . s:word . '/gce'
		:unlet! s:word
	endif
endfunction

" Перемещать курсор на предыдущую позицию при открытии файла
if s:us_goto_last_pos
	autocmd BufReadPost * call SetCursorPosition()
endif

function! SetCursorPosition()
	if &filetype !~ 'svn\|commit\c'
		if line("'\"") > 0 && line("'\"") <= line("$")
			exe "normal! g`\""
			normal! zz
		endif
	end
endfunction
" ==============================================================================
" "Fix"                     Способы устранения непоняток с настройками {{{1
"
" Узнать из какого файла переменная была установлена посл. раз
"   :verbose set переменная
"
" Список всех переменных
"   :let
"
" Список всех пользовательских функций
"   :function
"
" Список всех привязок
"   :map
"
" Показывает значения всех опций, которые отличаются от настроек по умолчанию.
"   :set
"
" Записать все сообщения в файл
"   :set verbosefile=<FILE>
" ==============================================================================
" "Plugins"                 Plugins {{{1
" ==============================================================================
" "Plugin.CtrlP" {{{2
" ==============================================================================
let g:ctrlp_match_window_bottom = 1 "Show on the top of the screen if 0
let g:ctrlp_by_filename = 1 "Search by file name by default
nmap <C-e> :CtrlPMRU<cr>
imap <C-e> <esc>:CtrlPMRU<cr>

" Список файлов в текущей директории (plugin-CtrlP)
nmap <C-f> :CtrlP<cr>
imap <C-f> <esc>:CtrlP<cr>
" ==============================================================================
" "Plugin.delimitMate" {{{2
" ==============================================================================
let loaded_delimitMate = 0 " 1 - will disable delimitMate
let delimitMate_expand_cr = 1 "Expand <CR>
" ==============================================================================
" "Plugin.FencView" {{{2
" ==============================================================================
" Auto detect file encoding when you open a file
let g:fencview_autodetect=0
" ==============================================================================
" "Plugin.neocomplcache" {{{2
" ==============================================================================
" Переключение всплывающего меню neocomplcache
" (plugin-neocomplcache)
"nmenu PopUp.Toggle\ Neo\ PopUp\ menu :NeoComplCacheToggle<cr>
"imenu PopUp.Toggle\ Neo\ PopUp\ menu <esc>:NeoComplCacheToggle<cr>i

" CTRL+Space для автозавершения (plugin-neocomplcache)
imap <C-Space> <C-X><C-U>
if !has("gui_running")
	inoremap <C-@> <C-X><C-U>
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Раскрыть сниппет/переход по сниппету (plugin-neocomplcache)
imap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
smap <silent><C-j> <Plug>(neocomplcache_snippets_expand)

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 0

" Если не выставить эту опцию то вырезание а затем вставка (в insert mode)
" через виндовые хоткеи страшно глючит
let g:neocomplcache_disable_select_mode_mappings = 1

" Включение/отключение автоматики Активация по Ctrl+Space
let g:neocomplcache_disable_auto_complete = 1
" ==============================================================================
" "Plugin.NERDTree" {{{2
" ==============================================================================
" Обозреватель файлов (plugin-NERD_Tree)
" map <F8> :NERDTreeToggle<cr>
vmap <F8> <esc>:NERDTreeToggle<cr>
imap <F8> <esc>:NERDTreeToggle<cr>

" ==============================================================================

" Установить положение окна NERDTree, "left" или "right"
let NERDTreeWinPos = 'right'

let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo']
" let NERDChristmasTree = 0
"let NERDTreeMinimalUI=1

nmap <Bs> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
let NERDTreeBookmarksFile= $VIMHOME . '/.NERDTreeBookmarks'
" ==============================================================================
" "Plugin.Syntastic" {{{2
" ==============================================================================
let g:syntastic_enable_signs = 1
" ==============================================================================
" "Plugin.Tagbar" {{{2
" ==============================================================================
" Показывать окно слева
let g:tagbar_left = 1

" Ширина окна
let g:tagbar_width = 30

" Не оставлять пробелов между определениями в окне Tagbar
"let g:tagbar_compact = 1

" Показывать стрелки вместо +/-
"let g:tagbar_iconchars = ['▶', '▼']
let g:tagbar_iconchars = ['▶', '◢']

" Не сортировать
let g:tagbar_sort = 0
" ==============================================================================
" "Plugin.Vim-template" {{{2
" ==============================================================================
autocmd User plugin-template-loaded call s:template_keywords()

function! s:template_keywords()
	if search('<+FILE_NAME+>')
		silent %s/<+FILE_NAME+>/\=toupper(expand('%:t:r'))/g
	endif
	if search('<+CURSOR+>')
		execute 'normal! "_da>'
	endif
	"silent %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
endfunction
" ==============================================================================
" "Plugin.VimWiki" {{{2
" ==============================================================================
if s:iswin
	let g:vimwiki_list = [{'path': 'D:\Dropbox\vimwiki\'}]
else
	let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]
endif
" "Plugin.PowerLine" {{{2
" ==============================================================================
if s:iswin
	let g:Powerline_symbols = 'unicode'
else
	let g:Powerline_symbols = 'fancy'
endif
let g:Powerline_cache_enabled = 1
" "Plugin.MiniBufExplorer" {{{2
" =============================================================================
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
"}}} {{{1
" vim: foldenable fdm=marker fdc=2 foldlevelstart=0 sts=4 sw=4 tw=64 fileencoding=utf-8
" }}}
