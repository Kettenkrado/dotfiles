# -----------------------------
# ⚡️ Custom Functions
# -----------------------------

# Timer
countdown() {
  secs=$1
  while [ $secs -gt 0 ]; do
    echo -ne "倒计时: $secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  echo "时间到! 🔔"
  say "时间到了"
}

# Stream Log -> Obsidian
function log() {
    local VAULT_PATH="$HOME/Documents/knowledge-base"
    local TARGET_FILE="$VAULT_PATH/_Inbox/Stream_Log.md"
    local TIMESTAMP=$(date +'%H:%M')
    
    if [ ! -f "$TARGET_FILE" ]; then
        echo "# 🌊 Stream Log\n\n> Capture stream from CLI.\n" > "$TARGET_FILE"
    fi

    if [ -z "$1" ]; then
        code "$TARGET_FILE"
    else
        echo "- **$TIMESTAMP**: $*" >> "$TARGET_FILE"
        echo "✅ Captured."
    fi
}

# 检查代理状态
proxystatus() {
    local GREEN="\033[1;32m"
    local RED="\033[1;31m"
    local RESET="\033[0m"

    if [ -n "$http_proxy" ]; then
        echo "HTTP Proxy:  ${GREEN}$http_proxy${RESET}"
    else
        echo "HTTP Proxy:  ${RED}未设置${RESET}"
    fi

    if [ -n "$https_proxy" ]; then
        echo "HTTPS Proxy: ${GREEN}$https_proxy${RESET}"
    else
        echo "HTTPS Proxy: ${RED}未设置${RESET}"
    fi
}