" ==============================================================================
" Файл пользовательских настроек vim (7.3)
" Maintrainer: azz
" ==============================================================================
" "Bundles"                 {{{1
" ==============================================================================

" Need to review {{{2
" ==============================================================================
" ShowMarks {
		" let showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
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
" Vim from Ubuntu ppa: http://askubuntu.com/questions/7283/where-can-i-find-vim-7-3
" VimOrganizer
"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org call org#SetOrgFileType()
" ==============================================================================
" }}}

filetype off

set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#rc()

Bundle "git://github.com/gmarik/vundle.git"
Bundle "git://github.com/ujihisa/netrw.vim"
Bundle "git://github.com/tyru/fencview.vim.git"
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle "git://github.com/vim-scripts/matchit.zip.git"
Bundle "git://github.com/vim-scripts/sessionman.vim.git"
Bundle "git://github.com/Shougo/neocomplcache.git"
Bundle "git://github.com/tpope/vim-fugitive.git"
Bundle "git://github.com/gregsexton/gitv.git"
Bundle "git://github.com/xolox/vim-easytags.git"
Bundle "git://github.com/vim-scripts/Open-associated-programs.git"
Bundle "git://github.com/Raimondi/delimitMate.git"
Bundle "git://github.com/majutsushi/tagbar.git"
Bundle "git://github.com/thinca/vim-template.git"
Bundle "git://github.com/scrooloose/syntastic.git"
Bundle "git://github.com/kien/ctrlp.vim.git"
Bundle "git://github.com/rom399/vim-colors.git"
Bundle "git://github.com/skammer/vim-css-color.git"
Bundle 'git://github.com/vim-scripts/IndexedSearch.git'
Bundle "git://github.com/vim-scripts/vimwiki.git"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/Lokaltog/vim-powerline.git"
Bundle "git://github.com/fholgado/minibufexpl.vim.git"

" Syntax and filetype plugins
Bundle "git://github.com/digitaltoad/vim-jade.git"
Bundle "git://github.com/kchmck/vim-coffee-script.git"
Bundle "git://github.com/zaiste/tmux.vim.git"
" JS
Bundle "git://github.com/vim-scripts/jsflakes.vim.git"
Bundle "git://github.com/michalliu/jsruntime.vim.git"
Bundle "git://github.com/michalliu/jsoncodecs.vim.git"

" Тестируемые
Bundle "git://github.com/vim-scripts/EasyGrep.git"
Bundle "git://github.com/godlygeek/tabular.git"
Bundle "git://github.com/vim-scripts/UltiSnips.git"
Bundle "git://github.com/spiiph/vim-space.git"
" Zoom one window and then restore others
Bundle "git://github.com/vim-scripts/ZoomWin.git"
" Text object that manipulates indentation, e.g. vai / vii = select indent block
" including / excluding the outer lines. For python, coffee, jade etc
Bundle "git://github.com/austintaylor/vim-indentobject.git"

Bundle "git://github.com/benmills/vimux.git"

Bundle "git://github.com/vim-scripts/YankRing.vim.git"
Bundle "git://github.com/vim-scripts/diffchanges.vim.git"

Bundle "git://github.com/vim-scripts/scratch.vim.git"
Bundle "git://github.com/vim-scripts/bufkill.vim.git"
Bundle "git://github.com/tpope/vim-repeat.git"

" Org mode
Bundle "git://github.com/vim-scripts/calendar.vim--Matsumoto.git"
Bundle "git://github.com/chrisbra/NrrwRgn.git"
Bundle "git://github.com/vim-scripts/utl.vim.git"
Bundle "git://github.com/hsitz/VimOrganizer.git"

" Colorschemes
Bundle "git://github.com/sjl/badwolf.git"
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
" Nice light scheme
" Tutti color theme https://github.com/satyajitranjeev/Dotvim


filetype plugin indent on
" ==============================================================================
" "Primary"                 {{{1
" ==============================================================================
let s:iswin = has('win32') || has('win64')

" Creating directories if they don't exist
"silent execute '!mkdir -p $HOME/.vim'
"silent execute '!mkdir -p $HOME/.vim/tmp'
"silent execute '!mkdir -p $HOME/.vim/tmp/bac'
"silent execute '!mkdir -p $HOME/.vim/tmp/undo'

let $TEMP = $HOME . '/.vim/tmp'
let $VIMHOME = $HOME . '/.vim'
" Отключение совместимости с vi
set nocompatible

" Использовать англоязычное меню
set langmenu=en
" ==============================================================================
" "Quick"                   {{{1
" ==============================================================================
" (0 - откл. 1 - вкл.)
let s:us_folding       = 1 " Свертывание участков кода
let s:us_linewrap      = 1 " Перенос длинных строк
let s:us_goto_last_pos = 1 " Перемещать курсор на предыдущую позицию при открытии файла
let s:us_spell         = 0
" ==============================================================================
" "General"                 {{{1
" ==============================================================================
" AutoReload .vimrc
if has("autocmd")
	autocmd! bufwritepost .vimrc source $MYVIMRC
	if s:iswin
		autocmd! bufwritepost _vimrc source $MYVIMRC
	endif
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

set ttyfast

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
set completeopt=longest,menuone,preview

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
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc

" Включение проверки орфографии, для русского и английского
if s:us_spell
	set spelllang=ru_yo,en_us
	set spell
endif

" Раскладка по умолчанию - английская
set iminsert=0

" Не перерисовывать окно при работе макросов
set lazyredraw

" Испольвозать англоязычный интерфес
if s:iswin
	language message en
else " для linux
	language mes C
endif

" русская раскладка клавиатуры
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" ==============================================================================
" "Files"                   {{{1
" ==============================================================================

" Кодировка по умолчанию
set encoding=utf-8
set fileencodings=utf-8,cp1251

set fileencodings=ucs-bom,utf-8,cp1251

set fileformat=unix          " Формат файла по умолчанию
set fileformats=unix,dos,mac " Порядок определения формата файла

" ==============================================================================
" "Backup,Undo,Swap"        {{{1
" ==============================================================================
" История команд
set history=1000

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Максимальное количество изменений, которые могут быть отменены
set undolevels=5000

set backup
set noswapfile
" Настройки отмены изменений
if v:version >= 703
	set undodir=$TEMP/undo
	set undofile
endif

set backupdir=$TEMP/bac//,/tmp
" ==============================================================================
" "GUI"                     {{{1
" ==============================================================================
set t_Co=256	" 256 colors in terminal
set ruler       " Включение отображения позиции курсора (всё время)

set mouse=a     " Подключение мыши
set mousehide   " Прятать указатель во время набора текста

set guicursor=  " Switch off cursor blink

set cursorline  " Включить подсветку текущей позиции курсора
set cursorcolumn
set mousemodel=popup
set colorcolumn=0

" Move beyond actual end of the line. If set to 1 = one more column at the end of the line
" http://www.uvm.edu/~gcd/2008/12/virtualedit-in-vim/
"set virtualedit=all
set virtualedit=onemore

" Cursor line always in center of the screen
set scrolloff=999

if s:iswin
	set gfn=DejaVu_Sans_Mono:h10:,consolas:h11
elseif has("gui_gtk2")
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

set background=dark
try
	let g:solarized_termcolors=256
	"colorscheme solarized
	colorscheme badwolf
	"colorscheme mustang
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme desert
endtry

"if s:iswin
	"" Установка высоты и ширины окна
	"winsize 150 800
"endif

set guioptions=
set guioptions+=c   " Отключение графических диалогов

set nonumber          " Включение отображения номеров строк
set numberwidth=5
set shortmess+=I    " Отключение приветственного сообщения
set wildmenu        " Показывать меню в командной строке
" для выбора вариантов авто-дополнения
set showmatch       " Довсвечивать совпадающую скобку
set nolist          " Не подсвечивать некоторые символы

" Replace fold's hyphen with dot
set fillchars=fold:\ 
set fillchars+=vert:\|

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
" "Statusline"              {{{1
" ==============================================================================
" Включение отображения незавершенных команд в статусной строке
set showcmd
set laststatus=2
" ==============================================================================
" "Indent"                  {{{1
" ==============================================================================
set autoindent                          " Наследовать отступы предыдущей строки
set smartindent                         " Включить 'умные' отступы
"set expandtab                           " Преобразование таба в пробелы
set shiftwidth=4                        " Размер табуляции по умолчанию
set softtabstop=4
set tabstop=4
" ==============================================================================
" "Search"                  {{{1
" ==============================================================================
set hlsearch        " Включение подсветки слов при поиске
set incsearch       " Использовать поиск по мере набора
set ignorecase " игнорировать регистр при поиске
set smartcase  " искать сначала по заданному регистру а потом в любом
set gdefault   " 'g' flag for all commands like :%s/a/b

" В режиме поиска используется раскладка, заданная по умолчанию
set imsearch=-1
" ==============================================================================
" "Folding"                 {{{1
" ==============================================================================
if s:us_folding
	" Включение складок
	set foldenable

	" Ширина колонки
	set foldcolumn=0

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
    set fdc=0
else
	set nofoldenable
endif
" ==============================================================================
" "Sessions"                {{{1
" ==============================================================================
" Опции сессий
set sessionoptions=curdir,buffers,folds,tabpages,winpos,help,blank,resize,winpos,winsize
" Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот
set sessionoptions+=unix,slash
" ==============================================================================
" "LineWrap"                {{{1
" ==============================================================================
command! -nargs=* Wrap set wrap linebreak nolist | set showbreak=↳  
if s:us_linewrap

	" Hard line wrap
	set textwidth=80
	set formatoptions=
	set formatoptions=rcqln " auto-wrap comments
	
	" Soft line wrap
	execute "Wrap"
else
	" Запретить перенос строк
	set nowrap
endif
" ==============================================================================
" "Mappings"                {{{1
" ==============================================================================
let mapleader=","

" "MISC"	{{{2

" System clipboard interaction.  Mostly from:
" https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
noremap <leader>y "*y
noremap <leader>Y "*y$
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap ; :

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"inoremap jj <Esc>
inoremap jk <Esc>

" Show hidden chars
nmap <Leader>i :call ToggleListChars()<cr>

" Ctrl+S
map <C-s> <esc>:w<CR>
imap <C-s> <C-o>:w<CR>

" ,g Toggle GUI Noise
map <Leader>gg <Esc>:call ToggleGUINoise()<cr>
map <Leader>gd <Esc>:call ToggleDistractionFree()<cr>
map <Leader>gf :call <SID>ToggleFold()<CR>
map <Leader>gw :set invwrap<CR>

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
noremap <Leader>= <C-W>=

" ,bl show buffers
nmap <Leader>bl :ls<cr>:b
nmap <Leader>h :bp<cr>
nmap <Leader>l :bn<cr>
"nmap <S-Tab> :bp<cr>
"nmap <Tab> :bn<cr>

" Wipeout buffer but save split
nmap <Leader>qq :call SmartExit()<CR>

" Wipeout buffer and close split
nmap <Leader>qb :bw<CR>

" Close split
nmap <Leader>qw <C-W>c

" Close all
nmap <Leader>qa :qa<CR>

" Save all changed buffers and close VIM
nmap <Leader>qx :xa<CR>

" "FORMATING" {{{2
" Reformat whole file
nmap <Leader>ff gg=G''

" Remove trailing spaces
nmap <Leader>f<Space> :%s/\s\+$//<cr>''

" Yank to the end of the line
nnoremap Y y$

" "NAVIGATION" {{{2
noremap H ^
noremap L $

noremap j gj
noremap k gk
noremap gj j
noremap gk k

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
" "FIND AND REPLACE IN FILE" {{{2
" Replace the word under cursor
nnoremap <Leader>rr :call Replace(1, 0)<CR>

" Quick replace
nnoremap <Leader>rs :call Replace(0, 0)<CR>

" Replace in visual mode
vnoremap <Leader>r :call Replace(0, 1)<CR>

" <Esc><Esc>  Clear the search highlight
nnoremap <silent><Leader><Space> :nohlsearch<CR><ESC>

" Centered search results
nmap n nzz
nmap N Nzz
nmap g* g*zz
nmap g# g#zz
nmap * *zz
nmap # #zz

" "QUICK EDITING"	{{{2
" ,ev open _vimrc in new tab
nmap <leader>ev :e $MYVIMRC<CR>
"
" ,ei open _vimrc in new tab
nmap <leader>ei :e .gitignore<CR>

" ,es Scratch buffer
nmap <leader>es :Sscratch<cr>

" New blank buffer
map <Leader>n :enew<CR>

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
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = $TEMP
" ==============================================================================
" }}}
" ==============================================================================
" "Functions"               {{{1
" ==============================================================================
let s:cmdline = ""

function! s:ToggleFold()
	if &foldmethod == 'marker'
		let &l:foldmethod = 'indent'
	elseif &foldmethod == 'indent'
		let &l:foldmethod = 'syntax'
	else
		let &l:foldmethod = 'marker'
	endif
	echo 'foldmethod is now ' . &l:foldmethod
endfunction

function! ToggleGUINoise()
	if &go=='c'
		exec('se go=mc')
		exec('se go-=b')
		echo "Show GUI elements"
	else
		exec('se go=')
		exec('se go+=c')
		echo "Show no GUI elements"
	endif
endfunction

function! ToggleDistractionFree()
	if &colorcolumn > 0
		exec('set fdc=0')
		exec('set nonu')
		exec('set colorcolumn=0')
		echo "Distraction free"
	else
		exec('set fdc=1')
		exec('set nu')
		exec('set colorcolumn=80')
		echo "Interface"
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

function! Replace(state, visual)
	if(a:visual==1)
		let s:com = "'<,'>"
	else
		let s:com = "%"
	endif
	if(a:state==1)
		let s:word = input("Replace `" . expand('<cword>') . "` with: ")
		:exe '%s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
		:unlet! s:word
	else
		let s:what = input("What to replace: ")
		let s:word = input("Replace `". s:what . "` with: ")
		:exe s:com . 's/\<' . s:what . '\>/' . s:word . '/gce'
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

" http://stackoverflow.com/questions/6552295/deleting-all-empty-buffers-in-vim
function! DeleteEmptyBuffers()
    let empty = []
    let [i, n] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty, ' ')
    endif
endfunction

function! CountListedBuffers() 
  let cnt = 0 
  for nr in range(1,bufnr("$")) 
	if buflisted(nr) 
	  let cnt += 1 
	endif 
  endfor 
  return cnt 
endfunction 

function! SmartExit()
	let s:BufferToKill = bufnr('%')
	let s:EmptyBuffer = 0

	if bufname('%') == '' && ! &modified && &modifiable
		if &buftype == 'nofile' && &swapfile == 0
			" Is scratch buffer, not empty
		else
			let s:EmptyBuffer = 1
		endif
	endif

	" Get a list of all windows which have this buffer loaded
	let s:WindowListWithBufferLoaded = []
	let i = 1
	let buf = winbufnr(i)
	while buf != -1
		if buf == s:BufferToKill
			let s:WindowListWithBufferLoaded += [i]
		endif
		let i = i + 1
		let buf = winbufnr(i)
	endwhile

	" Check that the buffer is last
	if(CountListedBuffers() < 2)
		let s:LastBuffer = 1
	else
		let s:LastBuffer = 0
	endif

	if s:LastBuffer
		if len(s:WindowListWithBufferLoaded) > 1
			execute "close"
		else
			if ! s:EmptyBuffer
				execute "bw | bw"
			else
				execute "q"
			endif
		endif
	else
		let g:BufKillActionWhenBufferDisplayedInAnotherWindow="kill"
		execute "BW"
		let g:BufKillActionWhenBufferDisplayedInAnotherWindow="confirm"
	endif
endfunction

" ==============================================================================
" "Filetype-specific"               {{{1
" ==============================================================================
" Javascript {{{2

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" CoffeeScript {{{2

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=indent
augroup END

" }}}
" CSS and LessCSS {{{2

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END
" C {{{2

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END

" }}}
" Python {{{2

augroup ft_python
    au!

    " au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <c-g> _(u'')<left><left>

    au FileType python inoremap <buffer> <c-b> """"""<left><left><left>
augroup END

" }}}
" ==============================================================================
" "Fix"                     {{{1
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
" "Plugins"                 {{{1
" ==============================================================================
" "Plugin.CtrlP" {{{2
" ==============================================================================
let g:ctrlp_match_window_bottom = 1 "Show on the top of the screen if 0
let g:ctrlp_by_filename = 1 "Search by file name by default
nmap <C-e> :CtrlPMRU<cr>
imap <C-e> <esc>:CtrlPMRU<cr>

" Список файлов в текущей директории (plugin-CtrlP)
"imap <C-p> <esc>:CtrlP<cr>
" Don't now what is this, need to investigate
" let g:ctrlp_dont_split = 'NERD_tree_2'
" let g:ctrlp_jump_to_buffer = 0
" let g:ctrlp_map = '<leader>,'
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_match_window_reversed = 1
" let g:ctrlp_split_window = 0
" let g:ctrlp_max_height = 20
" let g:ctrlp_extensions = ['tag']
" ==============================================================================
" "Plugin.delimitMate" {{{2
" ==============================================================================
let g:loaded_delimitMate = 0 " 1 - will disable delimitMate
let g:delimitMate_expand_cr = 1 "Expand <CR>
" ==============================================================================
" "Plugin.FencView" {{{2
" ==============================================================================
" Auto detect file encoding when you open a file
let g:fencview_autodetect=0
" ==============================================================================
" "Plugin.neocomplcache" {{{2
" ==============================================================================
"" CTRL+Space для автозавершения (plugin-neocomplcache)
"imap <C-Space> <C-X><C-U>
"if !has("gui_running")
	"inoremap <C-@> <C-X><C-U>
"endif
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 0
let g:neocompe_enable_camel_case_completion = 1
let g:neocomplcachlcache_enable_smart_case = 1 
let g:neocomplcache_enable_underbar_completion = 1  
" AutoComplPop like behavior. 
"let g:neocomplcache_enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Если не выставить эту опцию то вырезание а затем вставка (в insert mode)
" через виндовые хоткеи страшно глючит
"let g:neocomplcache_disable_select_mode_mappings = 1
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
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 1

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg cterm=bold gui=bold cterm=italic gui=italic
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg cterm=bold gui=bold cterm=italic gui=italic
hi MBEChanged guifg=#CD5907 guibg=fg cterm=italic gui=italic
hi MBENormal guifg=#808080 guibg=fg cterm=italic gui=italic


" =============================================================================
"

" "Plugin.UltiSnips" {{{2
" ==============================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" ==============================================================================
"}}} {{{1
" vim: foldenable fdm=marker fdc=0 foldlevelstart=0 sts=4 sw=4 tw=64 fileencoding=utf-8
" }}}
