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
alias p="pnpm"
alias b="bun"
alias t="turbo"
alias lu="linkup"
alias up="brew upgrade && brew upgrade --cask; proto upgrade && bun update -gi --latest; proto outdated --update --latest --yes --config-mode=global; proto use --config-mode=global"
alias sz="source ~/.zshrc"
alias compose="docker-compose"
alias deluge="deluge-gtk"
alias oc="opencode"
alias lg="lazygit"
alias ai="opencode run --model=opencode/glm-5.2 \"How do I acthive the following in the terminal: <question>$*</question>. Do not answer the question. Generate a command that answers the question. Do not execute the command. Just reply with the command, so I can run it myself. Do not wrap the command in a code block when printing it. Also give me a short explanation of how the command works.\""

# Environment variables
export LANG=en_US.UTF-8
export ANDROID_HOME=~/Library/Android/sdk
export JAVA_HOME=$(/usr/libexec/java_home)

# Path variables
export PATH=$PATH:~/.deno/bin
export PATH=$PATH:~/Library/Python/3.8/bin
export PATH=~/.console-ninja/.bin:$PATH


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

# Syntax highlighting (should be the last thing to run)
if [[ $(uname -m) == 'arm64' ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Rust
source "$HOME/.cargo/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bun completions
[ -s "/Users/jakst/.bun/_bun" ] && source "/Users/jakst/.bun/_bun"
[ -s "/Users/jakst/.oh-my-zsh/completions/_bun" ] && source "/Users/jakst/.oh-my-zsh/completions/_bun"

# pnpm
export PNPM_HOME="/Users/jakst/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# proto
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

# timed commands
preexec() {
  timer=$(gdate +%s.%N)
}

precmd() {
  if [ -n "$timer" ]; then
    now=$(gdate +%s.%N)
    elapsed=$(echo "$now - $timer" | bc)
    timer_show=$(printf "%.2f" $elapsed)
    echo "\u001b[38;5;250m${timer_show}s"
    unset timer
  fi
}
# timed commands end

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

# Linkup
export LINKUP_CONFIG="/Users/jakst/code/endform/linkup.yaml"
CERT_FILE=~/.linkup/certs/linkup_ca.cert.pem
if [ -f $CERT_FILE ]; then
  export NODE_EXTRA_CA_CERTS=$CERT_FILE
fi

# For Pulumi
export AWS_PROFILE=endform

# OpenCode
export PATH=/Users/jakst/.opencode/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakst/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jakst/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakst/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jakst/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

. "$HOME/.local/bin/env"

# Connect to an Android device over wireless debugging, pairing first if needed.
# adb keys transports by the address used to connect, so a phone reached once by
# raw IP and once by mDNS hostname shows up twice. Connect by hostname only;
# that also survives the phone's IP changing.
_pixel_connect_service() { # prints "<mDNS name>\t<host:port>" for wireless debugging
  adb mdns services 2>/dev/null | awk '$2 == "_adb-tls-connect._tcp" { print $1 "\t" $NF; exit }'
}

_pixel_pairing_service() { # prints "<mDNS name>\t<host:port>" while the pairing dialog is open
  adb mdns services 2>/dev/null | awk '$2 == "_adb-tls-pairing._tcp" { print $1 "\t" $NF; exit }'
}

_pixel_attached() { # $1 = serial; true when adb already holds that transport
  adb devices 2>/dev/null | awk 'NR > 1 { print $1 }' | grep -qxF -- "$1"
}

pixel() {
  local svc_name connect_addr pairing_name pairing_addr code waited out name_serial

  adb mdns check >/dev/null 2>&1
  IFS=$'\t' read -r svc_name connect_addr <<<"$(_pixel_connect_service)"
  name_serial="$svc_name._adb-tls-connect._tcp"

  # An IP-keyed transport alongside a name-keyed one is the same phone listed
  # twice. Keep the name-keyed one; adb treats them as separate devices.
  if [ -n "$connect_addr" ] && _pixel_attached "$connect_addr"; then
    if [ -n "$svc_name" ] && _pixel_attached "$name_serial"; then
      echo "pixel: collapsing duplicate transport $connect_addr"
    else
      echo "pixel: switching $connect_addr to the mDNS hostname form"
    fi
    adb disconnect "$connect_addr" >/dev/null 2>&1
  fi

  if [ -n "$svc_name" ]; then
    if _pixel_attached "$name_serial"; then
      echo "pixel: already connected as $name_serial"
      return 0
    fi
    out=$(adb connect "$name_serial" 2>&1)
    if printf '%s\n' "$out" | grep -qE '^(already )?connected to '; then
      printf 'pixel: %s\n' "$out"
      return 0
    fi
  fi

  # Unreachable, so pair -- which needs the code dialog open on the phone.
  IFS=$'\t' read -r pairing_name pairing_addr <<<"$(_pixel_pairing_service)"
  if [ -z "$pairing_addr" ]; then
    if [ -n "$connect_addr" ]; then
      echo "pixel: found a device at $connect_addr but couldn't connect to it" >&2
      echo "pixel: on the phone, open Wireless debugging > 'Pair device with pairing code'," >&2
      echo "pixel: then run pixel again" >&2
    else
      echo "pixel: no wireless-debugging device found on the network" >&2
      echo "pixel: on the phone, check Developer options > Wireless debugging is on" >&2
      echo "pixel: and open 'Pair device with pairing code' the first time" >&2
    fi
    return 1
  fi

  printf 'pixel: pairing with %s\n' "$pairing_addr"
  printf 'Enter the 6-digit code from the phone: '
  read -r code
  if [ -z "$code" ]; then
    echo "pixel: no code entered" >&2
    return 1
  fi
  adb pair "$pairing_addr" "$code" || return 1

  # Pairing re-randomizes the port, so re-discover rather than reuse the old one.
  echo "pixel: waiting for the connect service..."
  waited=0
  svc_name=''
  while [ -z "$svc_name" ] && [ "$waited" -lt 15 ]; do
    sleep 1
    waited=$((waited + 1))
    IFS=$'\t' read -r svc_name connect_addr <<<"$(_pixel_connect_service)"
  done
  if [ -z "$svc_name" ]; then
    echo "pixel: paired, but its connect service never appeared" >&2
    echo "pixel: try toggling Wireless debugging off and on" >&2
    return 1
  fi

  adb connect "$svc_name._adb-tls-connect._tcp"
}
