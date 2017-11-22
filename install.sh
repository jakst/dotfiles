# Dependencies:
# * hln (https://github.com/selkhateeb/hardlink)
# * git
# * oh-my-zsh
# * iTerm2

PURPLE='\033[0;35m'
NC='\033[0m' # No color

### zsh-syntax-highlighting
echo "${PURPLE}Installing zsh-syntax-highlighting...${NC}"
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git dependencies/zsh-syntax-highlighting


echo "${PURPLE}\nInstallation complete!${NC}\n\n"
./update.sh
