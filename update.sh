PURPLE='\033[0;35m'
NC='\033[0m' # No color


echo "${PURPLE}Updating configs...${NC}"


# TODO: check if files exist
### VS Code config ###
echo "${PURPLE}Updating VS Code configs...${NC}" 
rm ~/Library/Application\ Support/Code/User/keybindings.json 
rm ~/Library/Application\ Support/Code/User/settings.json 
rm ~/Library/Application\ Support/Code/User/vsicons.settings.json 
hln ./vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json 
hln ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json 
hln ./vscode/vsicons.settings.json ~/Library/Application\ Support/Code/User/vsicons.settings.json 


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
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
