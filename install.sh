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
curl https://get.volta.sh | bash
volta setup
volta install node
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"
echo "yarn --version: $(yarn --version)"

# Uninstall node from homebrew because we have it from n
brew uninstall --ignore-dependencies node

echo "Installing a few global npm packages"
yarn global add \
  @khanacademy/flow-to-ts \
  @prisma/cli \
  alfred-fkill \
  blitz \
  create-next-app \
  create-react-app \
  create-react-native-app \
  depcheck \
  expo-cli \
  flow-typed \
  flowgen \
  gatsby-cli \
  get-changelogs \
  js-unused-exports \
  lerna \
  lerna-update-wizard \
  lighthouse \
  netlify-cli \
  njt \
  prettier \
  react-codemod \
  serve \
  ts-node \
  ts-node-dev \
  typesync \
  vercel \
  where-broke \
  yarn-deduplicate \

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

SSH_FOLDER="$HOME/.ssh"
SSH_KEY="$SSH_FOLDER/id_rsa"
if [ ! -f "$SSH_KEY" ]; then
  echo "Generating an RSA token for GitHub"
  mkdir -p $SSH_FOLDER
  
  # Generate key without passphrase
  ssh-keygen -t rsa -b 4096 -C "jakob.stahl91@gmail.com" -f "$SSH_KEY" -N ""

  echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile $SSH_KEY" | tee "$SSH_FOLDER/config"
  eval "$(ssh-agent -s)"
  echo "run 'pbcopy < $SSH_KEY.pub' and paste that into GitHub"
fi

echo "${PURPLE}Updating file links...${NC}"
./update.sh

# Set macOS settings
echo "${PURPLE}Updating mac settings...${NC}"
./macos-settings.sh

echo "${PURPLE}\nInstallation complete!${NC}\n\n"