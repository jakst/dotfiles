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

if ! command -v proto > /dev/null; then
  echo "Installing Proto & Node"
  curl -fsSL https://moonrepo.dev/install/proto.sh | bash

  $HOME/.proto/bin/proto setup
  $HOME/.proto/bin/proto install node
  $HOME/.proto/bin/proto install bun
  $HOME/.proto/bin/proto install deno
  $HOME/.proto/bin/proto install yarn
  $HOME/.proto/bin/proto install pnpm
else
  echo "Proto already installed"
fi

echo "node --version: $($HOME/.proto/bin/node --version)"
echo "npm --version: $($HOME/.proto/bin/npm --version)"
echo "yarn --version: $($HOME/.proto/bin/yarn --version)"
echo "pnpm --version: $($HOME/.proto/bin/pnpm --version)"

echo "Installing a few global npm packages"
$HOME/.proto/bin/pnpm add --global \
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
  tsx \
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

# Install z quick jump tool
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Install fzf fuzzy finder (ctrl+r). Linked to the brew package.
$(brew --prefix)/opt/fzf/install

echo "${PURPLE}Updating file links...${NC}"
./update.sh

# Set macOS settings
echo "${PURPLE}Updating mac settings...${NC}"
./macos-settings.sh

echo "${PURPLE}\nInstallation complete!${NC}\n\n"
