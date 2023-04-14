PURPLE='\033[0;35m'
NC='\033[0m' # No color

echo "${PURPLE}Updating configs...${NC}"

### VS Code config ###
echo "${PURPLE}Updating VS Code configs...${NC}"
mkdir -p ~/Library/Application\ Support/Code/User
rm -f ~/Library/Application\ Support/Code/User/keybindings.json
rm -f ~/Library/Application\ Support/Code/User/settings.json
ln ./vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json 
ln ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

### Z shell config file ###
echo "${PURPLE}Updating Z shell config...${NC}"
rm -f ~/.zshrc
ln ./.zshrc ~/.zshrc

### Z shell theme ###
echo "${PURPLE}Updating Z shell theme...${NC}"
rm -f ~/.oh-my-zsh/themes/jakst.zsh-theme
ln ./jakst.zsh-theme ~/.oh-my-zsh/themes/jakst.zsh-theme
