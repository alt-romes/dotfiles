# Included plugins

| Plugin name    | Repository                              | Description                     |
| ---            | ---                                     | ---                             |
| ALE            | https://github.com/dense-analysis/ale   | LSP integration                 |
| Tabular        | https://github.com/godlygeek/tabular    | Table creation                  |
| vim-commentary | https://github.com/tpope/vim-commentary | Minimalist commenting plugin    |
| vim-surround   | https://github.com/tpope/vim-surround   | Mappings for "surrounding"      |
| vim-polyglot   | https://github.com/sheerun/vim-polyglot | Language pack                   |
| wal.vim        | https://github.com/dylanaraps/wal.vim   | Colorscheme (being replaced...) |

---

Tabularize example...

```vim
set statusline=%1*\ %{mode_map[mode()]}\    " Mode
set statusline+=%0*%(\ %r%)                    " Read-only flag
set statusline+=\ %t\                       " File name
set statusline+=%(%M\ %)                    " Modified flag
set statusline+=%2*\ %n\                 " Buffer number
set statusline+=%0*%=                       " Switch to right-side
set statusline+=%2*%(\ %{&filetype}\ %)      " Filetype
set statusline+=%0*%(\ %{FileSize()}\ \|%)     " File size
set statusline+=%(\ %{&fenc?&fenc:&enc}\ \|%) " Encoding
set statusline+=\ %p%%\                 " Percentage
set statusline+=%3*\ %3l:%-2c\              " Line:Column
```

Tabularize against `"` by selecting these lines and executing `:Tabularize /"`
```vim
set statusline=%1*\ %{mode_map[mode()]}\      " Mode
set statusline+=%0*%(\ %r%)                   " Read-only flag
set statusline+=\ %t\                         " File name
set statusline+=%(%M\ %)                      " Modified flag
set statusline+=%2*\ %n\                      " Buffer number
set statusline+=%0*%=                         " Switch to right-side
set statusline+=%2*%(\ %{&filetype}\ %)       " Filetype
set statusline+=%0*%(\ %{FileSize()}\ \|%)    " File size
set statusline+=%(\ %{&fenc?&fenc:&enc}\ \|%) " Encoding
set statusline+=\ %p%%\                       " Percentage
set statusline+=%3*\ %3l:%-2c\                " Line:Column
```
