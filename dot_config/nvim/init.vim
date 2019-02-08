" This now assumes Neovim, not vim

" I'm not sure what I used this for anymore.
:let mapleader=","


" Load and configure all my Vim plugins
source ~/.config/nvim/plugins.vim

" Only insert the longest menu item, then a menu
set completeopt=longest,menu
set completeopt-=menuone


"" Use "Tab" for most completions, but Control-J for UtilSnips completion
"let g:UltiSnipsExpandTrigger="<C-j>"
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Allow "jk" as alternative to "Esc"
" See: http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
inoremap jk <esc>

syntax enable

set tabstop=2
set shiftwidth=2
" convert all tabs to spaces
set expandtab

" ignore case issues, smartly
set ignorecase smartcase
set autoindent

" I find search highlighting annoying most of the time.
set nohlsearch

au BufRead,BufNewFile *.tmpl setlocal syntax=html
au BufRead,BufNewFile *.dwt setlocal syntax=html

" what I would like to happen is this: perldoc -f term || perldoc term
" So, it tries to look up the keyword as a perl function
" and then it tries to look it up as a module name if that fails
au BufRead,BufNewFile *.pm setlocal keywordprg=perldoc\ -f
au BufRead,BufNewFile *.pl setlocal keywordprg=perldoc\ -f
au BufRead,BufNewFile *.cgi setlocal keywordprg=perldoc\ -f
au BufRead,BufNewFile *.t setlocal ft=perl

set errorformat=%f:%l:%m

" smartly read and write files in some cases
set autowrite autowrite

set shortmess=a

set guioptions-=T "get rid of toolbar
"#set guioptions-=m "get rid of menu

" Split Explorer window vertically
let g:explVertical=1

" When splitting, new windows appear to the right or below the current one
set splitright
set splitbelow

" walk up the directory try looking for a tags file.
set tags=tags,/

" show status bars all the time
set laststatus=2
set statusline=%<%f%h%m%r%=%l,%c%V\ %P

" Use a better tab completion system
set wildmode=longest,list

" make the Y command work like I expect
:map Y y$

iab qalog Actionable feedback<CR>-------------------<CR><CR>Deferrable or non-spec feedback<CR>-------------------------------<CR><CR>QA Log<CR>-------



" insert the current date
iab ydate <C-R>=strftime('%x')<CR>

" make backup files
set backup
" and put them out of the way
set backupdir=~/.local/share/nvim/backup,.

" I prefer the visual bell
set visualbell

" make filetype specific features work
filetype plugin on
filetype indent on

" set my print options
set printoptions=left:18pt,right:18pt,top:18pt,bottom:18pt,paper:letter

" I don't think I use this anymore.
:set pastetoggle=<F2>

" turn on spell checking
:map <Leader>s :setlocal spell spelllang=en spellcapcheck=<cr>
:map <Leader>S :setlocal nospell<cr>

" Right-click brings up a popup men
set mousemodel=popup
" Maximal mouse support.
set mouse=a

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m


augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

autocmd syntax * SpaceHi

"autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
"autocmd FileType javascript setlocal equalprg=js-beautify\ \-f\ \-


" Don't put swp files in the local directory
set directory=/tmp,/usr/tmp,/var/tmp.


" colorscheme slate
"colorscheme default

" Trying out these settings for now.
:set background=dark
" Syntax not working, not sure I want it anyway.
" :set g:molokai_original=1
set  t_Co=256
"colorscheme molokai
colorscheme jellybeans

:set exrc            " enable per-directory .vimrc files
:set secure          " disable unsafe commands in local .vimrc files


" Maybe this should be limited to *.js files
"autocmd! BufWritePost,BufEnter * Neomake

" For the IndentToggle plugin
let g:indentLine_char = '┊'


" Convert tabs to spaces
set expandtab

" Don't hide the double quotes in JSON!
let g:vim_json_syntax_conceal = 0

" Use ,r to repeat last command in the next tmux pane. (used for re-running tests)
nnoremap <Leader>r :call <SID>TmuxRepeat()<CR>

function! s:TmuxRepeat()
  silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
  redraw!
endfunction

" integration with the system clipboard
set clipboard=unnamedplus

" RideAmigos shortcuts
cnoreabbrev lcdu lcd ~/unity
cnoreabbrev cdu cd ~/unity

"To use `ALT+{h,j,k,l}` to navigate windows from any mode: (useful with NeoVim :terminal)
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Highlight the 100th column as a suggested max code width
set colorcolumn=100
