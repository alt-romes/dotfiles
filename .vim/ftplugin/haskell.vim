" hack for ghc to detect cabal packages
" let g:ale_haskell_ghc_options = '-fno-code -v0 -package-db /Users/romes/.cabal/store/ghc-8.10.4/package.db'

" disable ghc integration
let b:ale_linters = ['cabal_ghc', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'hls', 'stack_build', 'stack_ghc']
