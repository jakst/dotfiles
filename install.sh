## Make sure to execute with "zsh ./install.sh"

# Set up terminal colors
PURPLE='\033[0;35m'
NC='\033[0m' # No color

# Save our username for later reference
I_AM=$(whoami)

echo "Hello $I_AM! Let's get you set up."

CODE_FOLDER="$HOME/code"
echo "Creating home folder at $CODE_FOLDER"
mkdir -p $CODE_FOLDER

# Install oh-my-zsh
echo "${PURPLE}Installing oh-my-zsh...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Install z quick jump tool
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

echo "${PURPLE}Updating file links...${NC}"
./update.sh

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

source $HOME/.zshrc

echo "Installing rustup"
rustup --version 2> /dev/null ||
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

if ! command -v proto > /dev/null; then
  echo "Installing Proto & Node"
  curl -fsSL https://moonrepo.dev/install/proto.sh | bash

  $HOME/.proto/bin/proto setup
  $HOME/.proto/bin/proto install node
  $HOME/.proto/bin/proto install npm
  $HOME/.proto/bin/proto install bun
  $HOME/.proto/bin/proto install deno
  $HOME/.proto/bin/proto install yarn
  $HOME/.proto/bin/proto install pnpm
  $HOME/.proto/bin/proto install rust
else
  echo "Proto already installed"
fi

echo "node --version: $($HOME/.proto/bin/node --version)"
echo "npm --version: $($HOME/.proto/bin/npm --version)"
echo "yarn --version: $($HOME/.proto/bin/yarn --version)"
echo "pnpm --version: $($HOME/.proto/bin/pnpm --version)"

pnpm setup

echo "Installing a few global npm packages"
$HOME/.proto/bin/pnpm add --global \
  create-next-app \
  create-react-native-app \
  create-tauri-app \
  depcheck \
  expo-cli \
  lighthouse \
  madge \
  ngrok \
  njt \
  npkill \
  npm-check-updates \
  prettier \
  react-codemod \
  react-native \
  serve \
  serverless \
  tsx \
  ts-migrate \
  ts-prune \
  ts-unused-exports \
  typesync \
  vercel \

# Link java
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# Install fzf fuzzy finder (ctrl+r). Linked to the brew package.
$(brew --prefix)/opt/fzf/install

# Set macOS settings
echo "${PURPLE}Updating mac settings...${NC}"
./macos-settings.sh

echo "${PURPLE}\nInstallation complete!${NC}\n\n"
