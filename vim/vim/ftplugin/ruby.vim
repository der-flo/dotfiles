setlocal foldmethod=syntax
let ruby_fold=1

let b:ale_linters = ['ruby', 'rubocop']
let b:ale_fixers = ['rubocop']

let b:AutoPairs = AutoPairsDefine({'|' : '|'})
