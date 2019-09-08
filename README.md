# dotfiles

My Linux dotfiles including Neovim, Tmux, Bash and [Fish](http://fishshell.com/).

Managed by [chezmoi](https://github.com/twpayne/chezmoi).

## Boostrap

1. Instal Chezmoi

> sudo snap install chezmoi --classic

2. Clone dotfiles Repo:

> git clone https://github.com/markstos/dotfiles.git ~/.local/share/chezmoi

3. Apply Chezmoi sources to home directory

> chezmoi -v apply
