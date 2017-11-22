# Dependencies:
# * hln (https://github.com/selkhateeb/hardlink)
# * oh-my-zsh
# * iTerm2

### Z shell config file ###
rm ~/.zshrc
hln ./.zshrc ~/.zshrc


### Z shell theme ###
rm ~/.oh-my-zsh/themes/jakst.zsh-theme
hln ./jakst.zsh-theme ~/.oh-my-zsh/themes/jakst.zsh-theme


### iTerm2 preferences ###

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/projects/~"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true


echo "\nConfig files copied!"