" Set comment formats
setlocal comments=:#
setlocal formatoptions+=or
let b:undo_ftplugin .= '|setlocal comments< formatoptions<'

" Fold based on indent level, but start with all folds open
setlocal foldmethod=indent
setlocal foldlevel=99
let b:undo_ftplugin .= '|setlocal foldmethod< foldlevel<'

" Choose check compiler based on file subtype
if exists('b:is_bash')
  let b:sh_check_compiler = 'bash'
elseif exists('b:is_kornshell')
  let b:sh_check_compiler = 'ksh'
else
  let b:sh_check_compiler = 'sh'
endif
execute 'compiler '.b:sh_check_compiler
let b:undo_ftplugin .= '|unlet b:current_compiler b:sh_check_compiler'
      \ . '|setlocal errorformat< makeprg<'

" Resort to g:is_posix for correct syntax on older runtime files
" 8.1.257 updated the runtime files to include a fix for this
if exists('b:is_posix') && !has('patch-8.0.257')
  let is_posix = 1
endif

" Queue up undo commands to clear the shell language flags that we set for
" this buffer during filetype detection in filetype.vim, or that the stock
" syntax highlighting chose for us
let b:undo_ftplugin .= '|unlet! b:is_bash b:is_kornshell b:is_posix'

" Stop here if the user doesn't want ftplugin mappings
if exists('no_plugin_maps') || exists('no_sh_maps')
  finish
endif

" ,! executes line with 'shell'
nnoremap <buffer> <LocalLeader>! ^"zyg_:!<C-R>z<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <LocalLeader>!'
