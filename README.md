# Dotfiles

## Install

I don't use a bare repo as being able to cd-in is invaluable for git debug/fixing.

```
git clone https://github.com/thizanne/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/.git/" --work-tree="$HOME"'
dotfiles reset --hard master # Or any relevant branch
dotfiles config --local status.showUntrackedFiles no
```

Then `git dot` alias will be available.
