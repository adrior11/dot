# --- OPERATING SYSTEM-SPECIFIC CONFIGURATIONS ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.zshrc_macos
    source ~/.supermuc
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source ~/.zshrc_linux
fi

# --- LANGUAGE ENVIRONMENTS ---
. "$HOME/.cargo/env"

# --- ALIASES ---
alias vim="nvim"
alias ..="cd .."

# --- TERMINAL AND DISPLAY SETTINGS ---
export PROMPT="[%*%f] %{%F{cyan}%}%n%{%F{reset_color}%}:%{%F{green}%}%~%{%F{reset_color}%} $ "
export COLORTERM=truecolor

# --- OTHER UTILITIES ---
eval "$(zoxide init zsh)"
