# --- PERSONAL CONFIGURATION FILES ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.zshrc_macos
    source ~/.extra
    source ~/.supermuc
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source ~/.zshrc_linux
fi

# --- DOCKER AND COLIMA CONFIGURATION ---
# Set the DOCKER_HOST to point to Colima's Docker socket
# export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock

# Override the Docker socket path for Testcontainers
# export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock

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

# --- ALIASES ---
# alias vim='nvim'
alias ..='cd ..'
alias nx="pnpm exec nx"
alias ghcs="gh copilot suggest"
alias ghce="gh copilot explain"

# --- TERMINAL AND DISPLAY SETTINGS ---
export PROMPT="[%*%f] %{%F{cyan}%}%n%{%F{reset_color}%}:%{%F{green}%}%~%{%F{reset_color}%} $ "
export COLORTERM=truecolor

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

