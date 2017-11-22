# Dependencies: hln (https://github.com/selkhateeb/hardlink)

rm ~/.zshrc
hln ./.zshrc ~/.zshrc

rm ~/.oh-my-zsh/themes/jakst.zsh-theme
hln ./jakst.zsh-theme ~/.oh-my-zsh/themes/jakst.zsh-theme

echo "\nConfig files copied!"