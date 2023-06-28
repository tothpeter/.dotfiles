# Peter's Dotfiles

Install
=======

```bash
git clone git@github.com:tothpeter/dotfiles.git
mv ~/dotenv ~/.dotenv
```

iTerm2
======

## Sync Configs

```bash
# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm/settings"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

zshrc
=====

## Symlink `.zshrc`

```bash
mv ~/.zshrc ~/.zshrc.old
ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
```

## zsh-syntax-highlighting plugin

It has to be listed LAST in the plugins list in `~/.zshrc` for it to be enabled.

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
