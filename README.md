## Ultimate Goal
> [!NOTE]
> 
> Anything will be done without leaving vim!

## Required
- [nvim >= 0.11](https://github.com/neovim/neovim/releases)
- [git](https://git-scm.com/downloads)
- [tree-sitter](https://github.com/tree-sitter/tree-sitter/releases)

## Install
```bash
git clone --recurse-submodules -b v3 git@github.com:Arkissa/nvim.git ~/.config/nvim
nvim --cmd "helptags ALL"
```

## TODO
- [x] Basic option, keymaps, lsp-keymaps, autocmd.
- [x] Automatic completion for lsp-code, path, keyword.
- [ ] Quick fuzzy find files and word in current project on quickfix.
- [ ] Support zettelkasten for vimwiki.
- [ ] Automatic to init for my neovim config.
- [ ] Better gitsubmodule install and remove plugin.
- [ ] Better textobject.
- [ ] Better buil-in terminal.
- [ ] Better buil-in indent.
- [ ] Better buil-in compiler.
- [ ] Better buil-in formatter.
- [ ] Better code action.
- [ ] Better engineering support for different programming language e.g code generator and lint.
- [ ] ~Make snippets of code~ Postponed this the neovim not yet ready.
