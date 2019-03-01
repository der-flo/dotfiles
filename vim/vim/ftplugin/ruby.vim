setlocal foldmethod=syntax
let ruby_fold=1

" The rubocop linter (Lint/Syntax) includes the "ruby -c -w" checks
" https://github.com/rubocop-hq/rubocop/blob/master/manual/basic_usage.md#2-rubocop-as-a-replacement-for-ruby--w
let b:ale_linters = ['rubocop']

let b:ale_fixers = ['rubocop']
let b:AutoPairs = AutoPairsDefine({'|' : '|'})
