" All my plugins are loaded AND configured here by vim-plug



" Use :PluginUpdate to install or update Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Jump to buffer if possible.
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
" I don't care about third-party or frontend code. You might.
let g:fzf_tags_command = 'ctags -R --exclude=node_modules --exclude=.git --exclude=frontend --exclude=frontend-src *'

" Fuzzy finding. Ref: https://github.com/junegunn/fzf.vim
" Use :Buffers to search buffers, and :Files to search files.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" .tmux.conf syntax highlighting
Plug 'keith/tmux.vim'

" Improved Node.js support. Ref: https://github.com/moll/vim-node
Plug 'moll/vim-node'

" Add :Bdelete to close a buffer without closing a window.
Plug 'moll/vim-bbye'

" Help switch between source files and test files
" Ref: https://github.com/tpope/vim-projectionist
" :A switches to the alternate file
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
Plug 'tpope/vim-projectionist'

" Used for async testing, particularly by vim-test below
" Ref: https://github.com/tpope/vim-dispatch
Plug 'tpope/vim-dispatch'
autocmd FileType javascript let b:dispatch = 'mocha %'

Plug 'janko-m/vim-test'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR><Paste>
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

"ES-6 syntax highlighting for Vim
Plug 'isRuslan/vim-es6'

" A colorscheme from https://github.com/nanotech/jellybeans.vim
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' }

Plug 'airblade/vim-gitgutter'

" Statusline on steriods
" ref: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
" The branch name was covering up the more-important file name.
let g:airline#extensions#branch#enabled = 0
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#show_buffers = 1
" helps the powerline symbols display
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
Plug 'vim-airline/vim-airline-themes'

" Highlight tabs and trailing whitespace  
Plug 'jpalardy/spacehi.vim'

" automatic, async linting
" Not working? Check :ALEInfo to see what it is up to
" Did you create your .eslintjs.rc file?
Plug 'w0rp/ale'
" Avoid performance hit of trying linters that don't exist.
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \}

" Display file tags (symbols, functions, headings, etc) in a sidebar
" Use F9 to toggle window. :help tagbar for more
" Within tag window, use '?' to toggle help
Plug 'majutsushi/tagbar'
let Tlist_Ctags_Cmd = '/usr/bin/jsctags'
nnoremap <silent> <F9> :TagbarToggle<CR>
" Open tagbar on the left side (it opens on the right by default)
let g:tagbar_left = 1


" Git integration
Plug 'tpope/vim-fugitive'

" A vim plugin to display the indention levels with thin vertical lines
" If you need to turn it off temporarily, use :IndentLinesToggle
Plug 'Yggdroot/indentLine'

" This is a Vim plugin that provides Tern-based JavaScript editing support.
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1


" Two lines of configuration I may not actually be using anymore
let g:syntastic_javascript_checkers = ['jshint']

" Autocompletion system: https://github.com/Shougo/deoplete.nvim
if has('nvim')
   Plug 'Shougo/deoplete.nvim'
   " Enable deoplete auto-completion at startup
   " May only work in neovim / nvim may need to be
   " moved to neovim-specific file.
   let g:deoplete#enable_at_startup = 1
   
   " Deoplete settings. Autocomplete is available with C->X, C->I
   " Autocomplete is off because it is too annoying. 
   "let g:deoplete#sources._ = ['buffer', 'file', 'ultisnips']
   let g:deoplete#omni#functions = {}
   let g:deoplete#complete_method = "omnifunc"
   let g:deoplete#disable_auto_complete = 1
   let g:deoplete#omni#functions.javascript = [
     \ 'tern#Complete',
     \ 'jspc#omni'
     \]
   let g:deoplete#sources = {}
   " file grabs words from the current file
   let g:deoplete#sources['javascript.jsx'] = ['buffer','file','ultisnips','ternjs']
endif




" UltiSnips
"let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"



" Manage autocompleting snippets. Ref: https://github.com/sirver/UltiSnips
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" https://github.com/othree/jspc.vim
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Color scheme: https://github.com/crusoexia/vim-monokai
Plug 'crusoexia/vim-monokai'

" Nginx support: https://github.com/chr4/nginx.vim
Plug 'chr4/nginx.vim'

" Transparent editing of GPG encrypted files
Plug 'jamessan/vim-gnupg'
"  prefer "ASCII-armor" for new files.
let g:GPGPreferArmor = 1

" Distraction-free editor mode for Vim
Plug 'mikewest/vimroom'

" Install Grammar checker
" Note: Downloads a big Java binary on first-run--
" Not necessary desirable for server installs.
Plug 'rhysd/vim-grammarous'

" Alignment options on steriods
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'


call plug#end()

