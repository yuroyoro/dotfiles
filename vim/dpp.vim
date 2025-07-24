" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dpp base path (required)
const s:dpp_base = '~/.cache/dpp/'

" Set dpp source path (required)
" NOTE: The plugins must be cloned before.
const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'
const s:ext_toml = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml'
const s:ext_lazy = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy'
const s:ext_installer = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
const s:ext_git = '~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git'
const s:dpp_config = '~/dotfiles/vim/dpp.ts'


" Set dpp runtime path (required)
execute 'set runtimepath^=' .. s:dpp_src
execute 'set runtimepath^=' .. s:denops_src
execute 'set runtimepath^=' .. s:ext_toml
execute 'set runtimepath^=' .. s:ext_lazy
execute 'set runtimepath^=' .. s:ext_git
execute 'set runtimepath^=' .. s:ext_installer


if s:dpp_base->dpp#min#load_state()
  " NOTE: dpp#make_state() requires denops.vim
  " NOTE: denops.vim and dpp plugins are must be added

  autocmd User DenopsReady
  \ : echohl WarningMsg
  \ | echomsg 'dpp load_state() is failed'
  \ | echohl NONE
  \ | call dpp#make_state(s:dpp_base,  s:dpp_config)
endif

autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

" Attempt to determine the type of a file based on its name and
" possibly its " contents. Use this to allow intelligent
" auto-indenting " for each filetype, and for plugins that are
" filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif


" DppInstall Command
command! DppInstall call dpp#async_ext_action('installer', 'install')

" DppUpdate Command
function! s:DppUpdateCmd(...) abort
  let l:args = a:000
  call dpp#async_ext_action('installer', 'update', { 'names': l:args })
endfunction

command! -nargs=* DppUpdate call <SID>DppUpdateCmd(<f-args>)

" DPPMakeState
command! DppMakeState call dpp#make_state(s:dpp_base,  s:dpp_config)
