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
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jakst/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Updating Homebrew"
  brew update
fi

echo "Installing stuff with Homebrew"
brew bundle

if ! command -v volta > /dev/null; then
  echo "Installing Volta & Node"
  curl https://get.volta.sh | bash

  $HOME/.volta/bin/volta setup
  $HOME/.volta/bin/volta install node
  $HOME/.volta/bin/volta install yarn
  $HOME/.volta/bin/volta install pnpm
else
  echo "Volta already installed"
fi
  
echo "node --version: $($HOME/.volta/bin/node --version)"
echo "npm --version: $($HOME/.volta/bin/npm --version)"
echo "yarn --version: $($HOME/.volta/bin/yarn --version)"

echo "Installing a few global npm packages"
$HOME/.volta/bin/yarn global add \
  create-next-app \
  create-react-native-app \
  create-tauri-app \
  depcheck \
  expo-cli \
  lerna \
  lerna-update-wizard \
  lighthouse \
  madge \
  ngrok \
  njt \
  npkill \
  prettier \
  prisma \
  prisma-dbml-generator \
  react-codemod \
  react-native \
  serve \
  serverless \
  tsm \
  ts-migrate \
  ts-node \
  ts-node-dev \
  ts-prune \
  ts-unused-exports \
  typesync \
  vercel \
  yarn-deduplicate \

# Link java
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Install fzf fuzzy finder (ctrl+r). Linked to the brew package.
$(brew --prefix)/opt/fzf/install

SSH_FOLDER="$HOME/.ssh"
SSH_KEY="$SSH_FOLDER/id_github"
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
