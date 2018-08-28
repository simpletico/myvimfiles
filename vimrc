"
"Andy's configs
"
" Get pathogen up and running
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Add xptemplate global personal directory value
if has("unix")
  set runtimepath+=~/.vim/xpt-personal
endif

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Printing options
"set printoptions=header:0,duplex:long,paper:letter

" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash
if has("unix")
    set shell=bash
else
    set shell=ksh.exe
endif

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
" set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" Setting this below makes it sow that error messages don't disappear after one second on startup.
"set debug=msg

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
"set textwidth=180

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
"set relativenumber
set number

" dictionary for english words
" I don't actually use this much at all and it makes my life difficult in general
"set dictionary=$VIM/words.txt

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" System default for mappings is now the "," character
let mapleader = ","

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" put the vim directives for my file editing settings in
nmap <silent> ,vi ovim:set ts=2 sts=2 sw=2:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Show all available VIM servers
nmap <silent> ,ss :echo serverlist()<CR>

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" allow command line editing like emacs
"cnoremap <C-A>      <Home>
"cnoremap <C-B>      <Left>
"cnoremap <C-E>      <End>
"cnoremap <C-F>      <Right>
"cnoremap <C-N>      <End>
"cnoremap <C-P>      <Up>
"cnoremap <ESC>b     <S-Left>
"cnoremap <ESC><C-B> <S-Left>
"cnoremap <ESC>f     <S-Right>
"cnoremap <ESC><C-F> <S-Right>
"cnoremap <ESC><C-H> <C-W>

" Maps to make handling windows a bit easier
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Search the current file for what's currently in the search register and display matches
nmap <silent> ,gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Toggle fullscreen mode
""nmap <silent> <F3> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap ,bd :BD<cr>

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

" Alright... let's try this out
imap jj <esc>
cmap jj <esc>

" I like jj - Let's try something else fun
"imap ,fn <c-r>=expand('%:t:r')<cr>

" Clear the text using a motion / text object and then move the character to the
" next word

vmap <silent> ,C :<C-U>call ClearText(visual(), 1)<CR>

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

function! ClearText(type, ...)
	let sel_save = &selection
	let &selection = "inclusive"
	let reg_save = @@
	if a:0 " Invoked from Visual mode, use '< and '> marks
		silent exe "normal! '<" . a:type . "'>r w"
	elseif a:type == 'line'
		silent exe "normal! '[V']r w"
	elseif a:type == 'line'
		silent exe "normal! '[V']r w"
    elseif a:type == 'block'
      silent exe "normal! `[\<C-V>`]r w"
    else
      silent exe "normal! `[v`]r w"
    endif
    let &selection = sel_save
    let @@ = reg_save
endfunction

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

if has("mac")
  let g:main_font = "Anonymous\\ Pro:h16"
  let g:small_font = "Anonymous\\ Pro:h2"
else
  let g:main_font = "DejaVu\\ Sans\\ Mono\\ 12"
  let g:small_font = "DejaVu\\ Sans\\ Mono\\ 5"
endif

"""-----------------------------------------------------------------------------
""" NERD Tree Plugin Settings
"""-----------------------------------------------------------------------------
""" Toggle the NERD Tree on an off with F7
"""Use nerd tree tab so keep in sync nmap <F7> :NERDTreeToggle<CR>
""map <F7> :NERDTreeTabsToggle<CR>
"""map <F6> :NERDTreeFind<CR>
""nmap <silent> ,nf :NERDTreeFind<CR>
""
""" Close the NERD Tree with Shift-F7
""nmap <S-F7> :NERDTreeTabsClose<CR>
""
""" Show the bookmarks table on startup
"""NERDTreeShowBookmarks=1
""
""" Don't display these kinds of files
""let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
""                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
""                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
""                   \ '\.intermediate\.manifest$', '^mt.dep$' ]
""
"""set autochdir
""let NERDTreeChDirMode=2
""
"-----------------------------------------------------------------------------
" GPG Stuff
"-----------------------------------------------------------------------------
if has("mac")
    let g:GPGExecutable = "gpg2"
    let g:GPGUseAgent = 0
endif

"-----------------------------------------------------------------------------
" FSwitch mappings
"-----------------------------------------------------------------------------
nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>

"-----------------------------------------------------------------------------
" XPTemplate settings
"-----------------------------------------------------------------------------
let g:xptemplate_brace_complete = ''

"-----------------------------------------------------------------------------
" TwitVim settings
"-----------------------------------------------------------------------------
let twitvim_enable_perl = 1
let twitvim_browser_cmd = 'firefox'
nmap ,tw :FriendsTwitter<cr>
nmap ,tm :UserTwitter<cr>
nmap ,tM :MentionsTwitter<cr>
function! TwitVimMappings()
    nmap <buffer> U :exe ":UnfollowTwitter " . expand("<cword>")<cr>
    nmap <buffer> F :exe ":FollowTwitter " . expand("<cword>")<cr>
    nmap <buffer> 7 :BackTwitter<cr>
    nmap <buffer> 8 :ForwardTwitter<cr>
    nmap <buffer> 1 :PreviousTwitter<cr>
    nmap <buffer> 2 :NextTwitter<cr>
    nmap <buffer> ,sf :SearchTwitter #scala OR #akka<cr>
    nmap <buffer> ,ss :SearchTwitter #scala<cr>
    nmap <buffer> ,sa :SearchTwitter #akka<cr>
    nmap <buffer> ,sv :SearchTwitter #vim<cr>
endfunction
augroup derek_twitvim
    au!
    au FileType twitvim call TwitVimMappings()
augroup END

"g:asyncfinder_open_in_prev_win
"g:asyncfinder_ignore_dirs
"g:asyncfinder_ignore_files
"g:asyncfinder_initial_mode
"g:asyncfinder_initial_pattern
"g:asyncfinder_match_exact
"g:asyncfinder_match_camel_case
"g:asyncfinder_include_buffers
"g:asyncfinder_include_mru_files
"g:asyncfinder_edit_file_on_single_result
"g:asyncfinder_speed_mode
"g:asyncfinder_grep_cmd
"g:asyncfinder_grep_open_in_prev_win
"g:asyncfinder_grep_initial_pattern
"g:asyncfinder_grep_ignore_case
"g:asyncfinder_grep_ignore_dirs
"g:asyncfinder_grep_ignore_files

nmap <silent> ,fo :AsyncFinder **/*<cr>
nmap <silent> ,fs :tab new<CR>:e. <cr>
nmap <silent> ,fn :tab new<CR>:AsyncFinder **/*<cr>

"-----------------------------------------------------------------------------
" SVN Helpers
"-----------------------------------------------------------------------------
function! VCSDiffMore(from)
  let f = expand('%:p')
  let revisions = split(system("svn log " . f . " | grep '^r[0-9][0-9]*'"), '\n')
  let revisions = map(revisions, 'substitute(v:val, "r\\(\\d\\+\\) .*$", "\\1", "")')
  exec ":VCSVimDiff " . revisions[a:from]
endfunction
nmap ,dd :call VCSDiffMore(0)<cr>
"function! ShowSVNRevisions()
"  let f = expand('%:p')
"  let revisions = system("svn log " . f)
"  let buffer = bufnr('%')
"endfunction

"-----------------------------------------------------------------------------
" Gundo Settings
"-----------------------------------------------------------------------------
nmap <c-F5> :GundoToggle<cr>

"-----------------------------------------------------------------------------
" Conque Settings
"-----------------------------------------------------------------------------
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_PromptRegex = '^-->'
let g:ConqueTerm_TERM = 'xterm'

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------
if !exists('g:bufferJumpList')
    let g:bufferJumpList = {}
endif

function! MarkBufferInJumpList(bufstr, letter)
    let g:bufferJumpList[a:letter] = a:bufstr
endfunction

function! JumpToBufferInJumpList(letter)
    if has_key(g:bufferJumpList, a:letter)
        exe ":buffer " . g:bufferJumpList[a:letter]
    else
        echoerr a:letter . " isn't mapped to any existing buffer"
    endif
endfunction

function! ListJumpToBuffers()
    for key in keys(g:bufferJumpList)
        echo key . " = " . g:bufferJumpList[key]
    endfor
endfunction

function! IndentToNextBraceInLineAbove()
    :normal 0wk
    :normal "vyf(
    let @v = substitute(@v, '.', ' ', 'g')
    :normal j"vPl
endfunction

nmap <silent> ,ii :call IndentToNextBraceInLineAbove()<cr>

nmap <silent> ,mba :call MarkBufferInJumpList(expand('%:p'), 'a')<cr>
nmap <silent> ,mbb :call MarkBufferInJumpList(expand('%:p'), 'b')<cr>
nmap <silent> ,mbc :call MarkBufferInJumpList(expand('%:p'), 'c')<cr>
nmap <silent> ,mbd :call MarkBufferInJumpList(expand('%:p'), 'd')<cr>
nmap <silent> ,mbe :call MarkBufferInJumpList(expand('%:p'), 'e')<cr>
nmap <silent> ,mbf :call MarkBufferInJumpList(expand('%:p'), 'f')<cr>
nmap <silent> ,mbg :call MarkBufferInJumpList(expand('%:p'), 'g')<cr>
nmap <silent> ,jba :call JumpToBufferInJumpList('a')<cr>
nmap <silent> ,jbb :call JumpToBufferInJumpList('b')<cr>
nmap <silent> ,jbc :call JumpToBufferInJumpList('c')<cr>
nmap <silent> ,jbd :call JumpToBufferInJumpList('d')<cr>
nmap <silent> ,jbe :call JumpToBufferInJumpList('e')<cr>
nmap <silent> ,jbf :call JumpToBufferInJumpList('f')<cr>
nmap <silent> ,jbg :call JumpToBufferInJumpList('g')<cr>
nmap <silent> ,ljb :call ListJumpToBuffers()<cr>

function! DiffCurrentFileAgainstAnother(snipoff, replacewith)
    let currentFile = expand('%:p')
    let otherfile = substitute(currentFile, "^" . a:snipoff, a:replacewith, '')
    only
    execute "vertical diffsplit " . otherfile
endfunction

command! -nargs=+ DiffCurrent call DiffCurrentFileAgainstAnother(<f-args>)

function! RunSystemCall(systemcall)
    let output = system(a:systemcall)
    let output = substitute(output, "\n", '', 'g')
    return output
endfunction

function! HighlightAllOfWord(onoff)
    if a:onoff == 1
        :augroup highlight_all
            :au!
            :au CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
        :augroup END
    else
        :au! highlight_all
        match none /\<%s\>/
    endif
endfunction

:nmap ,ha :call HighlightAllOfWord(1)<cr>
:nmap ,hA :call HighlightAllOfWord(0)<cr>

function! LengthenCWD()
	let cwd = getcwd()
    if cwd == '/'
        return
    endif
	let lengthend = substitute(cwd, '/[^/]*$', '', '')
    if lengthend == ''
        let lengthend = '/'
    endif
    if cwd != lengthend
	    exec ":lcd " . lengthend
	endif
endfunction

:nmap ,ld :call LengthenCWD()<cr>

function! ShortenCWD()
	let cwd = split(getcwd(), '/')
	let filedir = split(expand("%:p:h"), '/')
    let i = 0
    let newdir = ""
    while i < len(filedir)
        let newdir = newdir . "/" . filedir[i]
        if len(cwd) == i || filedir[i] != cwd[i]
            break
        endif
        let i = i + 1
    endwhile
    exec ":lcd /" . newdir
endfunction

:nmap ,sd :call ShortenCWD()<cr>

function! RedirToYankRegisterF(cmd, ...)
    let cmd = a:cmd . " " . join(a:000, " ")
    redir @*>
    exe cmd
    redir END
endfunction

command! -complete=command -nargs=+ RedirToYankRegister 
  \ silent! call RedirToYankRegisterF(<f-args>)

function! ToggleMinimap()
    if exists("s:isMini") && s:isMini == 0
        let s:isMini = 1
    else
        let s:isMini = 0
    end

    if (s:isMini == 0)
        " save current visible lines
        let s:firstLine = line("w0")
        let s:lastLine = line("w$")

        " make font small
        exe "set guifont=" . g:small_font
        " highlight lines which were visible
        let s:lines = ""
        for i in range(s:firstLine, s:lastLine)
            let s:lines = s:lines . "\\%" . i . "l"

            if i < s:lastLine
                let s:lines = s:lines . "\\|"
            endif
        endfor

        exe 'match Visible /' . s:lines . '/'
        hi Visible guibg=lightblue guifg=black term=bold
        nmap <s-j> 10j
        nmap <s-k> 10k
    else
        exe "set guifont=" . g:main_font
        hi clear Visible
        nunmap <s-j>
        nunmap <s-k>
    endif
endfunction

command! ToggleMinimap call ToggleMinimap()

" I /literally/ never use this and it's pissing me off
" nnoremap <space> :ToggleMinimap<CR>

command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
nmap <C-S-Tab> :call Stab()<CR>

"-----------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------
function! FreemindToListF()
    setl filetype=
    silent! :%s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/
    silent! :g/^\s*</d
    silent! :%s/&quot;/"/g
    silent! :%s/&apos;/\'/g
    silent! g/^-/s/- //
    silent! g/^\w/t.|s/./=/g
    silent! g/^\s*-/normal O
    silent! normal 3GgqG
    silent! %s/^\s\{4}\zs-/o/
    silent! %s/^\s\{12}\zs-/+/
    silent! %s/^\s\{16}\zs-/*/
    silent! %s/^\s\{20}\zs-/#/
    silent! normal gg
endfunction

command! FreemindToList call FreemindToListF()


"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------

iab Acheive    Achieve
iab acheive    achieve
iab Alos       Also
iab alos       also
iab Aslo       Also
iab aslo       also
iab Becuase    Because
iab becuase    because
iab Bianries   Binaries
iab bianries   binaries
iab Bianry     Binary
iab bianry     binary
iab Charcter   Character
iab charcter   character
iab Charcters  Characters
iab charcters  characters
iab Exmaple    Example
iab exmaple    example
iab Exmaples   Examples
iab exmaples   examples
iab Fone       Phone
iab fone       phone
iab Lifecycle  Life-cycle
iab lifecycle  life-cycle
iab Lifecycles Life-cycles
iab lifecycles life-cycles
iab Seperate   Separate
iab seperate   separate
iab Seureth    Suereth
iab seureth    suereth
iab Shoudl     Should
iab shoudl     should
iab Taht       That
iab taht       that
iab Teh        The
iab teh        the

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
  :hi TabLine guifg=Blue guibg=Yellow
  exe "set guifont=" . g:main_font
  if hostname() == "dqw-linux"
    set background=light
  else
    set background=dark
  endif
  if !exists("g:vimrcloaded")
      winpos 0 0
      if !&diff
          winsize 130 120
      else
          winsize 227 120
      endif
      let g:vimrcloaded = 1
  endif
endif
:nohls

" Find file in current directory and edit it.
function! Find(...)
  let path="."
  if a:0==2
    let path=a:2
  endif
  let l:list=system("find ".path. " -name '".a:1."' | grep -v .svn ")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:1."' not found"
    return
  endif
  if l:num == 1
    exe "open " . substitute(l:list, "\n", "", "g")
  else
    let tmpfile = tempname()
    exe "redir! > " . tmpfile
    silent echon l:list
    redir END
    let old_efm = &efm
    set efm=%f

    if exists(":cgetfile")
        execute "silent! cgetfile " . tmpfile
    else
        execute "silent! cfile " . tmpfile
    endif

    let &efm = old_efm

    " Open the quickfix window below the current window
    botright copen

    call delete(tmpfile)
  endif
endfunction
command! -nargs=* Find :call Find(<f-args>)

colorscheme wombat256mod
map <C-x> :bd<CR>
map <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
map <C-n> :tab new<CR>
"map <C-n> :tab new<CR>:e.<CR>
set backupdir=/home/andy/.vimswaps
set directory=/home/andy/.vimswaps
set showtabline=2

let g:dbgPavimPort = 9000
let g:dbgPavimBreakAtEntry = 1
let g:dbgPavimKeyEval = '<C-e>'
"let g:dbgPavimPathMap = [ ['/home/andy/work/fh/sources', '/home/vagrant/Code'] ]
"let g:dbgPavimPathMap = [ ['/home/andy/apps', '/apps'] ]
let g:dbgPavimPathMap = [ ['/home/andy/work/fh/apps', '/apps'], ['/home/andy/work/fh/apps', '/var/www/html'] ]

"nmap <C-o> :tab sball<CR>
"nmap <C-o> :bn<CR>
"nmap <C-i> :bp<CR>
:noremap <Leader>t :!ctags-proj.sh<CR>
":set tags=./.tags;~/Projects
":set tags=./.ctags
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
:hi TabLine guibg=DarkGreen
"My color reset after debug
nmap ,cr :hi TabLine guibg=DarkGreen <CR>
map ; :
noremap ;; ;
autocmd! BufWritePost :echo %:p
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"PreserveNoEOL : Preserve missing EOL at the end of text files. 
let g:PreserveNoEOL_Function = function('PreserveNoEOL#Python#Preserve') 
"Automatically source the vimrc file on save
augroup autosourcing
   autocmd!        
   autocmd BufWritePost .vimrc source % 
augroup END
" Ability to move tabs..
nnoremap <silent> <C-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" no wrap lines pls
set nowrap
""To include another configuration file
"source ~/.vim/another.config.file

"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

let b:phpfold_text_right_lines = 1
let b:phpfold_text_percent = 1
let b:phpfold_use = 0
let b:phpfold_docblocks = 0

hi StatusLine guibg=black
hi StatusLineNC guibg=black
runtime macros/matchit.vim

