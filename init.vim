let g:python3_host_prog = expand('$HOME/.pyenv/versions/nvim/bin/python3')

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

Plug 'altercation/vim-colors-solarized'
Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
Plug 'shougo/deoplete.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'


call plug#end()

colorscheme solarized
set background=dark
set number
set wrap
set linebreak


" enable curly quote textobject but don't automatically insert them
let g:textobj#quote#educate = 0
 
filetype plugin on
augroup textobj_quote
  autocmd!
  autocmd FileType * call textobj#quote#init()
augroup END

let g:gtfo#terminals = { 'mac': 'iterm' }

let g:deoplete#enable_at_startup = 1

nmap <Space> <Plug>SneakForward
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> // :nohlsearch<CR>

set tabstop=2 shiftwidth=2 expandtab
" lets you hide buffers that aren't saved to disk
set hidden

" MAC MAPPINGS
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>


" unimpaired mappings for base64 encode/decode
" from https://github.com/brookst/dotfiles/blob/master/home/.vim/after/plugin/vim-unimpaired/base64.vim
function! B64_encode(str)
  return substitute(system('base64', a:str),'\n','','g')
endfunction

function! B64_decode(str)
  return system('base64 --decode', a:str)
endfunction

call UnimpairedMapTransform('B64_encode','[B')
call UnimpairedMapTransform('B64_decode',']B')


" yadr-window-killer.vim
" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

