call plug#begin('~/.config/nvim/plugged')
"
"   " Make sure you use single quotes
"   Plug 'junegunn/seoul256.vim'
"   Plug 'junegunn/vim-easy-align'
"
"   " Group dependencies, vim-snippets depends on ultisnips
"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"   " On-demand loading
"   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"   " Using git URL
"   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"   " Using a non-master branch
"   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"   " Plugin options
"   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"   " Plugin outside ~/.vim/plugged with post-update hook
"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"   " Unmanaged plugin (manually installed and updated)
"   Plug '~/my-prototype-plugin'
"
"   " Add plugins to &runtimepath

Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'

call plug#end()

set background=dark
colorscheme solarized

call textobj#quote#init()

let g:gtfo#terminals = { 'mac': 'iterm' }

nmap <Space> <Plug>SneakForward

map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

