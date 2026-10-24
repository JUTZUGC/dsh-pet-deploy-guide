#!/usr/bin/env bash
set -euo pipefail
# dsh-pet 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/MerZlin/dsh-pet-indesktop#readme
# 更新日期：2026-10-24
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

case "$(uname -s)" in
  Darwin)
    curl -fL -o chat-macos.zip "https://github.com/MerZlin/dsh-pet-indesktop/releases/download/v4.4.0/dsh-pet-standalone-webm-chat-macos-arm64.zip"
    echo "ed18a63938bae5c26be7badb19851f52787090039c8b32474fd50509934ce4e8  chat-macos.zip" | shasum -a 256 -c -
    mkdir -p "$HOME/Applications"
    unzip -q -o chat-macos.zip -d "$HOME/Applications"
    xattr -dr com.apple.quarantine "$HOME/Applications/dsh-pet-standalone-webm-chat.app" 2>/dev/null || true
    open "$HOME/Applications/dsh-pet-standalone-webm-chat.app"
    ;;
  Linux)
    curl -fL -o chat-linux.zip "https://github.com/MerZlin/dsh-pet-indesktop/releases/download/v4.4.0/dsh-pet-standalone-webm-chat-linux-x86_64.zip"
    echo "9439b15be3efa032e47eff55bb03d852f0c8ee0824db2c49d2bb6c21d018eb39  chat-linux.zip" | sha256sum -c -
    unzip -q -o chat-linux.zip
    echo "如启动报缺库：sudo apt install libxcb-cursor0 libxkbcommon-x11-0 libegl1 libgl1 libfontconfig1 libdbus-1-3 fonts-noto-cjk"
    ./dsh-pet-standalone-webm-chat/dsh-pet-standalone-webm-chat >/dev/null 2>&1 &
    ;;
  *)
    echo "此脚本用于 Linux / macOS；Windows 请运行 deploy.ps1"; exit 1
    ;;
esac

echo ""

echo "安装完成：Windows 从开始菜单或桌面启动；macOS 已放入「应用程序」；Linux 装好依赖后运行目录内的二进制"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/MerZlin/dsh-pet-indesktop#readme"
