# Dotfiles

## Install

```
git clone --bare https://github.com/thizanne/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

Then `git dot` alias will be available.
