# My Dotfiles

这是我的 macOS 个人配置文件仓库。

## 首次安装

在新的 Mac 上，运行以下命令恢复所有配置：

```bash
git clone git@github.com:Kettenkrado/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## 如何添加新配置

备忘录...比如想添加 Zsh 配置：

1.  **准备目录**：在仓库里建个文件夹 `mkdir ~/dotfiles/zsh`
2.  **移动文件**：把本地配置移进去 `mv ~/.zshrc ~/dotfiles/zsh/`
3.  **修改脚本**：打开 `install.sh`，在最后一行加上：
    ```bash
    setup_config "zsh" "$HOME"
    ```
4.  **提交更改**：
    ```bash
    git add .
    git commit -m "Add zsh config"
    git push
    ```

## 📂 目录结构

  - `rime/`: 小狼毫输入法配置
  - `install.sh`: 自动化部署脚本
