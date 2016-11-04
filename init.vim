let g:python_host_prog = expand('$HOME/.pyenv/versions/nvim-py2/bin/python')
let g:python3_host_prog = expand('$HOME/.pyenv/versions/nvim/bin/python3')
let g:Guifont="Consolas:h13"

call plug#begin('~/.config/nvim/plugged')

Plug 'benekastah/neomake'
"
" http://aftnn.org/post/75730734352/vim-auto-closers-compared
Plug 'jiangmiao/auto-pairs'

Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'ervandew/supertab'
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
Plug 'vim-scripts/YankRing.vim'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}

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
let g:deoplete#sources#jedi#show_docstring = 1
let deoplete#sources#jedi#show_docstring = 1

" autocmd CompleteDone * pclose " To close preview window of deoplete automagically

nnoremap <Space> <Plug>SneakForward
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> // :nohlsearch<CR>

set tabstop=2 shiftwidth=2 expandtab
" lets you hide buffers that aren't saved to disk
set hidden

" MAC MAPPINGS
noremap <silent> <D-1> :tabn 1<cr>
noremap <silent> <D-2> :tabn 2<cr>
noremap <silent> <D-3> :tabn 3<cr>
noremap <silent> <D-4> :tabn 4<cr>
noremap <silent> <D-5> :tabn 5<cr>
noremap <silent> <D-6> :tabn 6<cr>
noremap <silent> <D-7> :tabn 7<cr>
noremap <silent> <D-8> :tabn 8<cr>
noremap <silent> <D-9> :tabn 9<cr>
noremap <silent> <D-{> :tabp<cr>
noremap <silent> <D-}> :tabn<cr>
inoremap <silent> <D-{> <Esc>:tabp<cr>
inoremap <silent> <D-}> <Esc>:tabn<cr>


inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>

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

set whichwrap+=<,>,h,l,[,] " go to prev/next line with h/l and left/right arrows instead of getting stuck at beginning/end of line

if $GOPATH == ""
  let $GOPATH = expand("~/go")
endif

let mapleader = ","
au FileType go nnoremap <leader>r <Plug>(go-run)
au FileType go nnoremap <D-r> <Plug>(go-run) %
au FileType go nnoremap <leader>b <Plug>(go-build)
au FileType go nnoremap <leader>t <Plug>(go-test)
au FileType go nnoremap <leader>c <Plug>(go-coverage)
au FileType go nnoremap <D-i> <Plug>(go-imports)

noremap <silent> [t :tabp<cr>
noremap <silent> ]t :tabn<cr>
noremap <silent> <C-S-tab> :tabp<cr>
noremap <silent> <C-tab> :tabn<cr>




" trying fasd cd stuff
function! FasdCd(path)
  let dir = system('fasd -e ''printf %s'' "' . a:path . '"')
  echom dir
  if strlen(dir) > 0
    execute ":cd " . dir
  endif
endfunction
command! -nargs=1 Z call FasdCd(<f-args>)
