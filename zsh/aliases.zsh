# -----------------------------
# 🏷️ Aliases
# -----------------------------

# === Network & Proxy ===
export MY_PROXY="http://127.0.0.1:12334"
alias proxyon="export http_proxy='$MY_PROXY' https_proxy='$MY_PROXY'"
alias proxyoff="unset http_proxy https_proxy"

# === Development ===
alias python="python3"
alias py="python3"

# === Tools (TeX Live) ===
alias tlmi="sudo tlmgr install"
alias tlmr="sudo tlmgr remove"
alias tlml="tlmgr list --only-installed"

# === Apps ===
alias suhid="cd /Applications/Hiddify.app/Contents/MacOS && sudo ./Hiddify"

# === System & History ===
alias h='history'
alias hg='history | grep'
# "Please do it for me" - 重新以 sudo 执行上一条命令
alias please='sudo $(fc -ln -1)'

# === Navigation ===
alias gotoschool='cd ~/Documents/school/25Fall'