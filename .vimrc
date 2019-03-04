syntax on          " Enable keyword color
syntax enable      " Enable syntax color
filetype off       "required
" 設置包括vundle和初始化相關的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'gnattishness/cscope_maps'
" Git tool
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
" 加入 NERDTree Tabs 套件 "
Plugin 'scrooloose/nerdtree'
" 加入 Taglist 套件 global -u"
Plugin 'taglist.vim'
" 加入 NERDTree Tabs 套件 "
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'tracyone/vinux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Mark--Karkat' 
Plugin 'kshenoy/vim-signature' 
" CtrlP ag
Plugin 'kien/ctrlp.vim'
Plugin 'lokikl/vim-ctrlp-ag'
" FZF
"Plugin 'junegunn/fzf.vim'
" LeaderF
Plugin 'Yggdroot/LeaderF'

Plugin 'ludovicchabant/vim-gutentags' 
Plugin 'skywind3000/gutentags_plus'
" GNU GLOBAL
Plugin 'vim-script/gtags.vim' 

" Super tab
Plugin 'ervandew/supertab'
" You complete me
Plugin 'Valloric/YouCompleteMe'
" Work with serveral variants of a word at once.
Plugin 'tpope/vim-abolish'
" Lookup file
Plugin 'genutils'
Plugin 'lookupfile'
" Colorscheme 
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sickill/vim-monokai'
Plugin 'skielbasa/vim-material-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

call vundle#end() "Required
filetype plugin indent on    "required

function! RunShell(Msg, Shell)
    echo a:Msg.'...'
    call system(a:Shell)
    echo 'done'
endfunction

"" set leader key <leader>
let mapleader = "\<Space>"

"  Leader Key mapping list-------------------------------------{{{2
" ,q - close document
nnoremap <Leader>q :q!<CR>
" ,s - Save document
nnoremap <Leader>s :w<CR>
" ,x - Close all documents and terminate VIM 
nnoremap <Leader>x :qall<CR>

"  Nerdtree ---------------------------------------------------{{{2
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=0
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"  Taglist  ---------------------------------------------------{{{2
nnoremap <F7> :TlistToggle<CR>
"  Tagbar -----------------------------------------------------{{{2
nnoremap <F8> :TagbarToggle<CR>
"nmap <F9>  :call RunShell("Generate tags", "rm -fr tags && ctags --langmap=c:.c.h --languages=c -R --exclude=@.ctagsignore")<CR>
"nmap <F11> :call RunShell("Generate lookup filename tags", "genfiletags.sh")<CR>
nmap <F12> :call RunShell("Generate gtags", "gengtags.sh")<CR>
map :ts :set noic<CR>:set ts<CR> 

" [ PLUGINS    ] ==============================================
" You compelete ME --------------------------------------------{{{2
let g:deoplete#enable_at_startup=1
let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 0 " disable rule prompt
let g:ycm_server_python_interpreter='/usr/bin/python'
"olet g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2 " match from second character
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1 " Auto complete in strings
let g:ycm_disable_for_files_larger_than_kb = 50000
let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>']
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1,
            \ 'mundo': 1,
            \ 'fzf': 1,
            \ 'ctrlp' : 1
            \}
let g:ycm_error_symbol = '✖✖'
let g:ycm_warning_symbol = '>*'
" Lookupfile --------------------------------------------------{{{2
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
    let g:LookupFile_TagExpr = '"./filenametags"' 
endif
" gutentags ----------------------------------------------------{{{2
" let g:gutentags_trace = 1
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "system"]
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.project', 'fastpath'] 
let g:gutentags_project_root = ['.root'] 
" Produce document name 
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
" 同時開啟ctags和gtags支援
"let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_modules = []

if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif
" 將自動生成的 tags/gtags 文件全部放入~/.cahche/tags 目錄中，避免污染工作目錄
let g:gutentags_cache_dir = expand('~/.cache/tags')

"let g:gutentags_plus_switch = 1

" 配置ctags的參數
"ctags --langmap=c:.c.h --languages=c -R --exclude=@.ctagsignore")<CR>
let g:gutentags_ctags_extra_args = ['--langmap=c:.c.h']
let g:gutentags_ctags_extra_args += ['--languages=c', '-R']
let g:gutentags_ctags_extra_args += ['--exclude=@.ctagsignore']

" 禁用gutentags自動加載gtags數據庫的行為
" 避免多個數據庫相互干擾
" 使用plus plugin解決問題
let g:gutentags_auto_add_gtags_cscope = 0
"Default is 1, incrementally update,
"i.e it will rescan the file you saved, and patch the existing tags file to
"include the result of that scan. It will not generate the entire tags
"file from the entire codebase.
" gtags --------------------------------------------------------{{{2
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

set tags +=~/.cache/tags     " Use ctags to be gtags command
"set tags +=tags              " Use ctags to be gtags command
set cscopetag                  " Use cscope to be gtags command
set cscopeprg='gtags-cscope'   " Use gtags-cscope in place of cscope
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Auto_Quiet = 1


" Leader key ----------------------------------------------{{{2
nmap <silent><leader>lk :LUTags<CR>
nmap <silent><leader>lb :LUBufs<CR>
nmap <silent><leader>lw :LUWalk<CR>

" Super tab -----------------------------------------------{{{2
let g:SuperTabDefaultCompletionType='context'
" Ctrlp  --------------------------------------------------{{{2
" Ctrlp extension for global searching source code with ag {{{2
" Excluding version control directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.tmp/*,*/.so/*,*/.swp/*,*/.zip/*,*/.yml/*,*/.root,*/.o  " Linux/MacOSX
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|doc|tmp|svn)',
    \ 'file': '\v[\/]\.(exe|so|tar.gz|tar|gz|vim|git|hg|svn|o|a)$', 
    \}
let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore out
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore .o
    \ -g ""'
" By default ag will search from PWD
" Using the magic word 'current-file-dir' to use current file base directory
" let g:ctrlp_ag_search_base = 'current-file-dir'
" let g:ctrlp_ag_search_base = 'app/controllers' "both relative and absolute
" path supported

" LeaderF -----------------------------------------------------{{{2
let g:Lf_CacheDirectory = expand('~/.cache')
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_ReverseOrder = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '.svn', '.hg', '.gitlab'],
    \ 'file': ['*.exe', '*.so', '*.tar', '*.gz', '*.tar', '*.gz', '*.vim', '*.git', '*.o', '*.svn'], 
    \}
"
" Airline -----------------------------------------------------{{{2
set laststatus=2
"let g:airline_theme='powerlineish'
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#bufer_nr_show = 1 " Show bufer number
let g:airline#extensions#tabline#fnametruncate = 30 " Show bufer number
let g:airline#extensions#tabline#fnamecollapse = 1  " Show bufer number
let g:airline#extensions#tabline#buffer_idx_mode = 1 "  * enable/disable displaying index of the buffer.


set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11 "config font for vim

" tab or buf 1
nmap <leader>1 <Plug>AirlineSelectTab1
" tab or buf 2
nmap <leader>2 <Plug>AirlineSelectTab2 
" tab or buf 3 
nmap <leader>3 <Plug>AirlineSelectTab3 
" tab or buf 4 
nmap <leader>4 <Plug>AirlineSelectTab4 
" tab or buf 5 
nmap <leader>5 <Plug>AirlineSelectTab5 
" tab or buf 6 
nmap <leader>6 <Plug>AirlineSelectTab6 
" tab or buf 7 
nmap <leader>7 <Plug>AirlineSelectTab7 
" tab or buf 8
nmap <leader>8 <Plug>AirlineSelectTab8 
" tab or buf 9 
nmap <leader>9 <Plug>AirlineSelectTab9 
" tab or buf previous/next
nmap <leader>pp <Plug>AirlineSelectPrevTab
nmap <leader>nn <Plug>AirlineSelectNextTab
" Colorscheme -------------------------------------------------{{{2
" Colorscheme 1: [Papercolor]
set t_Co=256   " This is may or may not need
if has('gui_running')
    set background=light
else
    set background=dark
endif
" colorscheme monokai
"colorscheme material-monokai
"
"colorscheme gruvbox
"let g:gruvbox_italic=1
"
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline = 1
colorscheme solarized

" VIM EDITOR -------------------------------------------------{{{2
set ruler
"set nofoldenable 
set foldlevel=99 
set showmode
" show line number
set nu
set hlsearch
set smartindent
" tabstop size 
set tabstop=4
" Acknowledge C or Java language and use C format to process indent >> <<
set cindent shiftwidth=4
" use space to replace when using tab key
set expandtab
set nowrap
set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:«
set list
set ut=100
if has("autocmd")
    filetype on
    autocmd Filetype html,aspvbs,javascript,xml setlocal ts=2 sts=2 sw=2 expandtab

endif

set ic
set backspace=2
set history=100
" set nomore
" set so=1
set cursorline " show current line
" enable or disable mouse use
nnoremap <F9> :call ToggleMouse() <CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        set nonumber
        echo "Mouse usage disabled"
    else
        set
        mouse=a
        set number
        echo "Mouse usage enabled"
    endif
endfunction

"" search result at center
nnoremap N nzz
nnoremap n nzz
"" ESC mapping
inoremap jk <ESC>
"" adjust window size
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <RIGHT> <C-W><
nnoremap <LEFT> <C-W>>

" Quick fix windows setting-----------------------------------{{{2
set cscopequickfix=c-,i-,t-,d-,e-,s-
function! GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
endfunction

function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx == 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo "Location List is Empty."
        return
    endif
    let winnr = winnr()
    exec(a:pfx.'open')
    if winnr() != winnr
        wincmd p
    endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
