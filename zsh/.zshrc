# ==========================================
# 🐚 Zsh Main Configuration (Modularized)
# ==========================================

# 定义 dotfiles 路径
export DOTFILES="$HOME/dotfiles"

# Paths
if [ -f "$DOTFILES/zsh/paths.zsh" ]; then
    source "$DOTFILES/zsh/paths.zsh"
fi

# Functions
if [ -f "$DOTFILES/zsh/functions.zsh" ]; then
    source "$DOTFILES/zsh/functions.zsh"
fi

# Aliases
if [ -f "$DOTFILES/zsh/aliases.zsh" ]; then
    source "$DOTFILES/zsh/aliases.zsh"
fi

# Secrets
if [ -f "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi

# ==========================================
# End of Config
# ==========================================