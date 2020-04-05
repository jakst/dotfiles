# Set up terminal colors
PURPLE='\033[0;35m'
NC='\033[0m' # No color

# Save our username for later reference
I_AM=$(whoami)

echo "Hello $I_AM! Let's get you set up."

CODE_FOLDER="$HOME/code"
echo "Creating home folder at $CODE_FOLDER"
mkdir -p $CODE_FOLDER

if ! command -v brew > /dev/null; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Updating Homebrew"
    brew update
fi

echo "Installing stuff with Homebrew"
brew bundle

echo "Installing node"
sudo mkdir -p /usr/local/n
sudo chown ${I_AM}:admin /usr/local/n
n latest
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"
echo "yarn --version: $(yarn --version)"

# Uninstall node from homebrew because we have it from n
brew uninstall --ignore-dependencies node

echo "Installing a few global npm packages"
yarn global add \
  serve \
  gatsby-cli \
  prettier \
  netlify-cli \
  now \
  create-next-app \
  create-react-app \
  create-react-native-app \

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Generating an RSA token for GitHub"
mkdir -p ~/.ssh
ssh-keygen -t rsa -b 4096 -C "jakob.stahl91@gmail.com"
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
eval "$(ssh-agent -s)"
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

# Install VS Code extension
code --install-extension PeterJausovec.vscode-docker
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension yzhang.markdown-all-in-one
code --install-extension eamodio.gitlens
code --install-extension vsmobile.vscode-react-native
code --install-extension cssho.vscode-svgviewer

echo "${PURPLE}Updating file links...${NC}"
./update.sh

# Set macOS settings
echo "${PURPLE}Updating mac settings...${NC}"
./macos-settings.sh

echo "${PURPLE}\nInstallation complete!${NC}\n\n"