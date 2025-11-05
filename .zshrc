# --- OPERATING SYSTEM-SPECIFIC CONFIGURATIONS ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.dot/.zshrc_macos
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source ~/.dot/.zshrc_linux
fi

# --- LANGUAGE ENVIRONMENTS ---
. "$HOME/.cargo/env"

# --- ALIASES ---
alias vim="nvim"
alias ..="cd .."

# --- TERMINAL AND DISPLAY SETTINGS ---
export PROMPT="[%*%f] %{%F{cyan}%}%n%{%F{reset_color}%}:%{%F{green}%}%~%{%F{reset_color}%} $ "
export COLORTERM=truecolor
export HISTSIZE=100000

# --- OTHER UTILITIES ---
eval "$(zoxide init zsh)"
