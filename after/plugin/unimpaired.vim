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
