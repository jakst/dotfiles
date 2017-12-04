# Dependencies:
# * vscode
# * hln (https://github.com/selkhateeb/hardlink)
# * git
# * oh-my-zsh
# * iTerm2

PURPLE='\033[0;35m'
NC='\033[0m' # No color

### VS Code extension
code --install-extension PeterJausovec.vscode-docker
code --install-extension eg2.tslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension robertohuertasm.vscode-icons
code --install-extension yzhang.markdown-all-in-one
code --install-extension waderyan.gitblame
code --install-extension robinbentley.sass-indented

### zsh-syntax-highlighting
echo "${PURPLE}Installing zsh-syntax-highlighting...${NC}"
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git dependencies/zsh-syntax-highlighting


echo "${PURPLE}\nInstallation complete!${NC}\n\n"
./update.sh
