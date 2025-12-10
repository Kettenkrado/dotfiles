#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[Info]${NC} $1"
}

setup_config() {
    src_folder="$DOTFILES_DIR/$1"
    target_dir="$2"

    echo -e "${BLUE}>> Configuring: $1${NC}"

    if [ ! -d "$src_folder" ]; then
        echo "Warning: Source folder $src_folder not found."
        return
    fi

    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
    fi

    for src_file in "$src_folder"/* "$src_folder"/.*; do
        [ -e "$src_file" ] || continue
        [[ "$(basename "$src_file")" == "." ]] && continue
        [[ "$(basename "$src_file")" == ".." ]] && continue
        [[ "$(basename "$src_file")" == ".DS_Store" ]] && continue

        filename=$(basename "$src_file")
        target_file="$target_dir/$filename"

        if [ -L "$target_file" ] && [ "$(readlink "$target_file")" == "$src_file" ]; then
            continue
        fi

        if [ -f "$target_file" ] && [ ! -L "$target_file" ]; then
            mv "$target_file" "$target_file.backup"
            log "Backed up existing file: $filename"
        fi

        ln -sf "$src_file" "$target_file"
        log "Linked: $filename"
    done
}

log "Starting setup..."

# --- Configuration List ---

# Rime Input Method
setup_config "rime" "$HOME/Library/Rime"

# setup_config "zsh" "$HOME"
# setup_config "git" "$HOME"

setup_config "vscode" "$HOME/Library/Application Support/Code/User"

log "All done! Please restart relevant applications."