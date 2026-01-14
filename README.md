# Dotfiles

## Install

I don't use a bare repo as being able to cd-in is invaluable for git debug/fixing.

```
git clone git@github.com:thizanne/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/.git/" --work-tree="$HOME"'
dotfiles checkout master # Or any relevant branch
dotfiles restore .
dotfiles config --local status.showUntrackedFiles no
```

Then `git dot` alias will be available.
