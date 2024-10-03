source .extra

# Automatically update tmux status-right with the current directory
precmd () {
    if [ -n "$TMUX" ]; then
        local shortened_path="${PWD/#$HOME/~}"
        tmux set -qg status-right "#[fg=#ebdbb2] $shortened_path #[fg=#3c3836,bg=#458588] %H:%M "
    fi
}
# Set the command prompt
export PROMPT="%B[%n@%m %b%~%B]%% %b"

# Set the DOCKER_HOST to point to Colima's Docker socket
export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock

# Override the Docker socket path for Testcontainers
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock

# Node.js configuration
[[ $NODE_OPTIONS != *"--dns-result-order=ipv4first"* ]] && export NODE_OPTIONS="${NODE_OPTIONS:+$NODE_OPTIONS }--dns-result-order=ipv4first"

# Haskell GHCup environment setup
[ -f "/Users/adrian/.ghcup/env" ] && source "/Users/adrian/.ghcup/env"

# Rust Cargo environment setup
. "$HOME/.cargo/env"

# Alias vim to nvim
alias vim='nvim'

# Set terminal to support true color
export COLORTERM=truecolor

# Add .local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add opt/local/lib to PATH
export LIBRARY_PATH="$LIBRARY_PATH:/opt/local/lib/"

# Add /usr/local/lib to LIBRARY_PATH for SDL2_gfx
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# Alias to start skhd
alias start-skhd="skhd -c ~/.config/skhd/skhdrc &"

# Set the JAVA_HOME environment variable to use Java version 22
export JAVA_HOME=$(/usr/libexec/java_home -v 22)

# Setting PATH for Python 3.8
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# Setting PATH for Python 3.12
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

# Initialize Homebrew environment
eval "$(/usr/local/bin/brew shellenv)"

# Initialize fnm environment for Node.js
eval "$(fnm env --use-on-cd --shell zsh)"
