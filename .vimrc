syntax enable      " Enable syntax color
filetype off       "required
call plug#begin('~/.vim/plugged')
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" 加入 NERDTree Tabs 套件 "
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Mark--Karkat'
" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
" GNU GLOBAL
Plug 'vim-scripts/gtags.vim'
" You complete me
Plug 'Valloric/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
call plug#end()
filetype plugin indent on
function! RunShell(Msg, Shell)
    echo a:Msg.'...'
    call system(a:Shell)
    echo 'done'
endfunction


"" set leader key <leader>
let mapleader = "\<Space>"
"  Leader Key mapping list-------------------------------------{{{2
" q - close the current window and buffer. if it is the last window if will also exit vim
"nnoremap <Leader>q :q!<CR>
" q - unload the current buffer and close the current window.
nnoremap <Leader>q :bd<CR>
" s - Save document
nnoremap <Leader>s :w<CR>
" x - Close all documents and terminate VIM↵
nnoremap <Leader>x :qall<CR>

nnoremap <Leader>a :Ack!<Space>

nmap ss <Plug>(easymotion-s2)

" ACK ----------------------------------------------------------{{{2
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Highlight search key word for ag
let g:ackhighlight = 1
" Nerdtree -----------------------------------------------------{{{2
nnoremap <F6> :NERDTreeToggle<CR>
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

" Tagbar-- -----------------------------------------------------{{{2
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F12> :call RunShell("Generate gtags", "gengtags.sh")<CR>
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
set t_Co=256   " This is may or may not need
if has('gui_running')
        set background=light
else
        set background=dark
endif
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline = 1
colorscheme solarized
" You compelete ME --------------------------------------------{{{2
let g:deoplete#enable_at_startup=1
let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 0 " disable rule prompt
let g:ycm_server_python_interpreter='/usr/bin/python'
"olet g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
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


" Gutentags------ --------------------------------------------{{{2
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "system"]
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }

let g:gutentags_modules = []


if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif
" Automatical generating tags/gtags are moved to ~/.cache/tags directory to
" avoid pollute working directory
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_ctags_extra_args = ['--langmap=c:.c.h']
let g:gutentags_ctags_extra_args += ['--languages=c', '-R']
let g:gutentags_ctags_extra_args += ['--exclude=@.ctagsignore']

let g:gutentags_auto_add_gtags_cscope = 0



" gtags ------------------------------------------------------{{{2
"let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
set tags +=~/.cache/tags     " Use ctags to be gtags command
set cscopetag                  " Use cscope to be gtags command
set cscopeprg='gtags-cscope'   " Use gtags-cscope in place of cscope

let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Auto_Quiet = 1
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" VIM EDITOR -------------------------------------------------{{{2
set ruler
set foldlevel=99
set showmode
" " show line number
set nu
set hlsearch
set smartindent
" " tabstop size
set tabstop=4
" " Acknowledge C or Java language and use C format to process indent >> <<
set cindent shiftwidth=4
" " use space to replace when using tab key
set expandtab
set nowrap
set listchars=eol:↵,tab:»·,trail:╳,extends:»,precedes:«
set list
set ut=100
if has("autocmd")
     filetype on
     autocmd Filetype html,aspvbs,javascript,xml setlocal ts=2 sts=2 sw=2 expandtab
 endif
"
set ic
set backspace=2
set history=100
set cursorline " show current line
set nomore
"" search result at center↵
nnoremap N nzz↵
nnoremap n nzz↵

"" ESC mapping
inoremap jk <ESC>
"" adjust window size
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <RIGHT> <C-W><
nnoremap <LEFT> <C-W>

" Quick fix windows setting-----------------------------------{{{2↵
set cscopequickfix=c-,d-,e-,g-,i-,s-,t-
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

" Quickfix window make previous tag stake and Ctrl-t fail, so redefine Ctrl-t
nmap <C-t> :colder<CR>:cc<CR>
