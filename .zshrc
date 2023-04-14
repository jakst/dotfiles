# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="itchy"
#ZSH_THEME="random"
ZSH_THEME="jakst"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Load edgedb completions
fpath+=~/.zfunc

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-z
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
alias avd="~/Library/Android/sdk/tools/emulator -avd"
alias p="echo $PWD"
alias up="brew upgrade && brew upgrade --cask && curl https://get.volta.sh | bash && YARN_IGNORE_PATH=1 yarn global upgrade-interactive --latest"
alias sz="source ~/.zshrc"
alias d="dum run"

# Environment variables
export ANDROID_HOME=~/Library/Android/sdk
export VOLTA_HOME="$HOME/.volta"
export VOLTA_UNSAFE_GLOBAL=1 # Ensure volta doesn't sandbox global packages
export HEROKU_ORGANIZATION=mentimeter

# Path variables
export PATH=$PATH:~/.deno/bin
export PATH=$PATH:~/Library/Python/3.8/bin
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=~/workspace/dev-tools/bin:$PATH # menti cli
export PATH="/Users/jakst/.moon/tools/moon/latest:$PATH"

# JAVA STUFF
# Enable if needed.
  # If you need to have openjdk first in your PATH, run:
  #   echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc
  # For compilers to find openjdk you may need to set:
  #   export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"


# Functions
function git() {
  case $* in
    please* ) shift 1; command git push --force-with-lease "$@" ;;
    * ) command git "$@" ;;
  esac
}

function gitzip() {
	git archive -o $@.zip HEAD
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

reyarn() {
  yarn remove $@ && yarn add $@
}

reyarnd() {
  yarn remove $@ && yarn add --dev $@
}

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /Users/jakst/code/tests/racket-c/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/jakst/code/tests/racket-c/node_modules/tabtab/.completions/electron-forge.zsh

# UNCOMMENT IF UP/DOWN KEYS STOP WORKING!
# Bind up and down keys to search through history
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search # Up
# bindkey "^[[B" down-line-or-beginning-search # Down

# Syntax highlighting (shold be the last thing to run)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Rust
source "$HOME/.cargo/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bun completions
[ -s "/Users/jakst/.bun/_bun" ] && source "/Users/jakst/.bun/_bun"
[ -s "/Users/jakst/.oh-my-zsh/completions/_bun" ] && source "/Users/jakst/.oh-my-zsh/completions/_bun"
