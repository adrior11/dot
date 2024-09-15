# Load GHCup environment
[ -f "/Users/adrian/.ghcup/env" ] && source "/Users/adrian/.ghcup/env"

# Load Cargo environment
. "$HOME/.cargo/env"

# Alias vim to nvim
alias vim='nvim'

# Set true color support
export COLORTERM=truecolor

# Add .local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add opt/local/lib to PATH
export LIBRARY_PATH="$LIBRARY_PATH:/opt/local/lib/"

# Add /usr/local/lib to LIBRARY_PATH for SDL2_gfx
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# Add Node.js version 20 as the default to PATH
export PATH="/usr/local/opt/node@20/bin:$PATH"

# Custom color schemme for the terminal PATH
# export PS1="\[\033[38;2;251;73;52m\][\u@\h \[\033[00m\]\w\[\033[38;2;251;73;52m\]]\$ \[\033[00m\]"
export PS1="\[\033[1m\][\u@\h \[\033[00m\]\w\[\033[1m\]]\$ \[\033[00m\]"

# Alias to start skhd
alias start-skhd="skhd -c ~/.config/skhd/skhdrc &"
