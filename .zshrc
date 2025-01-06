# --- PERSONAL CONFIGURATION FILES ---
source ~/.extra
source ~/.supermuc
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- PATH CONFIGURATION ---
export PATH="$HOME/.local/bin:$PATH"

# Add Google Cloud SDK to PATH for gcloud command line tools
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:$PATH

# Add paths for libraries (needed for compiling/linking certain applications)
export LIBRARY_PATH="$LIBRARY_PATH:/opt/local/lib:/usr/local/lib:/opt/homebrew/lib"

# Setting PATH for specific Python frameworks
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

# Set the JAVA_HOME and add Java to Path 
# export JAVA_HOME=$(/usr/libexec/java_home -v 22)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.0.1.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# --- DOCKER AND COLIMA CONFIGURATION ---
# Set the DOCKER_HOST to point to Colima's Docker socket
export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock

# Override the Docker socket path for Testcontainers
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock

# --- NODE.JS AND RELATED TOOLS ---
# Node.js configuration regarding IPv6 resolution
[[ $NODE_OPTIONS != *"--dns-result-order=ipv4first"* ]] && export NODE_OPTIONS="${NODE_OPTIONS:+$NODE_OPTIONS }--dns-result-order=ipv4first"

# Initialize fnm environment for Node.js version management
eval "$(fnm env --use-on-cd --shell zsh)"

# Allow fnm to manage pnpm transparently and automatically install Node.js with Corepack
export FNM_COREPACK_ENABLED=true

# --- ENVIRONMENT INITIALIZATION FOR LANGUAGES AND TOOLS ---
# Haskell GHCup environment setup
# [ -f "/Users/adrian/.ghcup/env" ] && source "/Users/adrian/.ghcup/env"

# Rust Cargo environment setup
. "$HOME/.cargo/env"

# Initialize Homebrew environment
# eval "$(/usr/local/bin/brew shellenv)"

# --- ALIASES ---
alias vim='nvim'
alias ..='cd ..'
alias nx="pnpm exec nx"
alias ghcs="gh copilot suggest"
alias ghce="gh copilot explain"
alias start-skhd="skhd -c ~/.config/skhd/skhdrc &"

# --- TERMINAL AND DISPLAY SETTINGS ---
export PROMPT="[%*%f] %{%F{cyan}%}%n%{%F{reset_color}%}:%{%F{green}%}%~%{%F{reset_color}%} $ "
export COLORTERM=truecolor

# --- FUNCTIONS ---
pdf () {
  if [ -z "$1" ]; then
    ls *.pdf | head -n 1 | xargs open;
  else
    ls *.pdf | grep "$1" | head -n 1 | xargs open;
  fi
}

scp_supermuc() {
    local source="$1"
    local dest="$2"

    scp -r -P "${SUPERMUC_PORT}" -o "ProxyJump=${SUPERMUC_PROXY}" \
        "$source" "${SUPERMUC_USER}@${SUPERMUC_HOST}:${SUPERMUC_BASE_DIR}/$dest"
}

scp_from_supermuc() {
    local source="$1"

    scp -r -P "${SUPERMUC_PORT}" -o "ProxyJump=${SUPERMUC_PROXY}" \
        "${SUPERMUC_USER}@${SUPERMUC_HOST}:${SUPERMUC_BASE_DIR}/$source" .
}

# --- OTHER UTILITIES ---
eval "$(zoxide init zsh)"

