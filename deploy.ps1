# dsh-pet 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/MerZlin/dsh-pet-indesktop#readme
# 更新日期：2026-10-24
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

$exe = 'dsh-pet-standalone-webm-chat-setup.exe'
curl.exe -L --fail -o $exe "https://github.com/MerZlin/dsh-pet-indesktop/releases/download/v4.4.0/$exe"
if ((Get-FileHash $exe -Algorithm SHA256).Hash.ToLower() -ne '91d887482b9ef0dc9d93d1dfe01a042002040712afc28b06c6dfd3f1b805b576') { throw 'SHA256 校验失败' }
Start-Process -FilePath (Join-Path $PWD $exe) -ArgumentList '/VERYSILENT','/SUPPRESSMSGBOXES','/NORESTART' -Wait
$app = Join-Path $env:LOCALAPPDATA 'Programs\dsh-pet-standalone-webm-chat\dsh-pet-standalone-webm-chat.exe'
if (Test-Path $app) { Start-Process $app } else { Write-Host '安装完成，请从开始菜单启动' }

Write-Host ''

Write-Host '安装完成：Windows 从开始菜单或桌面启动；macOS 已放入「应用程序」；Linux 装好依赖后运行目录内的二进制'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/MerZlin/dsh-pet-indesktop#readme'
