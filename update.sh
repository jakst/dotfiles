PURPLE='\033[0;35m'
NC='\033[0m' # No color


echo "${PURPLE}Updating configs...${NC}"

### Z shell config file ###
echo "${PURPLE}Updating Z shell config...${NC}"
rm ~/.zshrc
hln ./.zshrc ~/.zshrc


### Z shell theme ###
echo "${PURPLE}Updating Z shell theme...${NC}"
rm ~/.oh-my-zsh/themes/jakst.zsh-theme
hln ./jakst.zsh-theme ~/.oh-my-zsh/themes/jakst.zsh-theme


### iTerm2 config ###
echo "${PURPLE}Updating iTerm2 config...${NC}"

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/projects/~"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
