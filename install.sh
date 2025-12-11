#!/bin/bash

# 定义基础路径
DOTFILES_DIR="$HOME/dotfiles"

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[Info]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[Warn]${NC} $1"
}

# 用法: setup_folder_links "源文件夹名" "目标路径"
setup_folder_links() {
    src_folder="$DOTFILES_DIR/$1"
    target_dir="$2"

    echo -e "${BLUE}>> Processing Folder: $1${NC}"

    if [ ! -d "$src_folder" ]; then
        warn "Source folder $src_folder not found."
        return
    fi

    mkdir -p "$target_dir"

    # 遍历文件夹下所有文件 (包括隐藏文件)
    for src_file in "$src_folder"/* "$src_folder"/.*; do
        # 排除 . .. .DS_Store 以及未匹配的情况
        [ -e "$src_file" ] || continue
        filename=$(basename "$src_file")
        [[ "$filename" == "." || "$filename" == ".." || "$filename" == ".DS_Store" ]] && continue

        target_file="$target_dir/$filename"
        link_file "$src_file" "$target_file"
    done
}

# 用法: link_file "源文件绝对路径" "目标文件绝对路径"
link_file() {
    src_file="$1"
    target_file="$2"
    filename=$(basename "$src_file")

    # 检查是否已经是正确的软链接
    if [ -L "$target_file" ] && [ "$(readlink "$target_file")" == "$src_file" ]; then
        # log "Skipping $filename (Already linked)"
        return
    fi

    # 如果目标存在且不是软链接，备份它
    if [ -f "$target_file" ] && [ ! -L "$target_file" ]; then
        mv "$target_file" "$target_file.backup"
        warn "Backed up existing file: $filename -> $filename.backup"
    fi

    # 建立链接
    ln -sf "$src_file" "$target_file"
    log "Linked: $filename"
}

# Execution Start
log "Starting configuration setup..."

# 1. Rime 输入法
setup_folder_links "rime" "$HOME/Library/Rime"

# 2. VS Code
setup_folder_links "vscode" "$HOME/Library/Application Support/Code/User"

# 3. Zsh (特殊处理：只链接 .zshrc)
echo -e "${BLUE}>> Processing: Zsh${NC}"
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
# 注意：aliases.zsh, paths.zsh 等文件不需要链接到 Home

# 4. Git
# link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

log "All done! Please restart your terminal and VS Code."