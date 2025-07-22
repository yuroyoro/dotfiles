"------------------------------------
" ALE(Asynchronous Lint Engine)
"------------------------------------

let g:airline#extensions#ale#enabled = 1

" always show error sign colum left with line number col
let g:ale_sign_column_always = 1

" don't fire linting on each text chnage evnet
let g:ale_lint_on_text_changed = 'never'

" add errors to quickfix, not to location list
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 1

" open quickfix window on save
let g:ale_open_list = 'on_save'

let g:ale_sign_error        = '⨉'
let g:ale_sign_warning      = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format      = '[%linter%] %s [%severity%]'
let g:ale_loclist_msg_format   = '[%linter%] %s [%severity%]'

let g:ale_linters.ruby  = ['ruby', 'rubocop']

let g:ale_fix_on_save = 1
let g:ale_linters.go  = ['go build', 'gofmt', 'golint', 'govet']
let g:ale_fixers.go   = ['gofmt', 'goimports']

let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = "--enable-all --disable gochecknoglobals"
let g:ale_go_gofmt_options = "-s"

let g:ale_linters.javascript  = ['eslint']
let g:ale_fixers.javascript   = ['eslint']
let g:ale_linters.typescript  = ['eslint', 'tsserver']
let g:ale_fixers.typescript   = ['eslint']
