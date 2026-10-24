# dsh-pet 一键安装指南

> 第三方部署指南 · 非 dsh-pet 官方仓库。官方项目：[MerZlin/dsh-pet-indesktop](https://github.com/MerZlin/dsh-pet-indesktop)
> 内容来自官方文档（2026-10-24）。项目迭代快，请以[官方文档](https://github.com/MerZlin/dsh-pet-indesktop#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用自己找安装包，让百度搭子按你的系统下载、校验并装好。

⚠️ 安装包 300–550 MB。Windows 全自动；macOS 仅 Apple Silicon；Linux 仅 x86_64 且需装系统库。安装包未签名，首次运行可能需手动放行。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/dsh-pet-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按你的系统下载对应的官方安装包、校验 SHA256，并完成安装或解压，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## dsh-pet 是什么？

dsh-pet 是开源的基于 Python + PySide6 的跨平台桌面宠物，支持 AI 对话（协议：MIT，<img src="https://img.shields.io/github/stars/MerZlin/dsh-pet-indesktop?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

独立运行的透明无边框桌宠：置顶、可拖动、角色切换、WebM 动画、系统托盘、多只宠物与全局快捷键；Chat 版还支持 OpenAI 兼容协议的 AI 对话、语音与屏幕识别。

- 跨平台：Windows / macOS（arm64）/ Linux（x86_64），另有 Android 测试版
- Chat 版可接入 DeepSeek 等 OpenAI 兼容接口，支持语音与识屏
- 透明置顶、多宠、托盘、开机自启、全局快捷键
- MIT 协议，发布包为 onedir 目录形态，配置与日志写入独立数据目录

（来源：[官方仓库](https://github.com/MerZlin/dsh-pet-indesktop)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 更新活跃 | 最新 v4.4.0（2026-10-22），仓库当天仍有提交 |
| Windows 安装免管理员 | 默认装到 %LOCALAPPDATA%\Programs，不需要 UAC 提权 |
| 功能完整 | 透明置顶、多宠、托盘、开机自启、全局快捷键、AI 对话 |
| 三平台覆盖 | Windows、macOS arm64、Linux x86_64，另有 Android 测试版 |

| 需要注意 | 说明 |
|---|---|
| 包体很大 | 安装包 296 MB，Linux / macOS 压缩包 376–544 MB |
| 未签名 | Windows 可能触发 SmartScreen，macOS 会被 Gatekeeper 拦截 |
| 平台限制 | macOS 只有 arm64；Linux 只有 x86_64 |
| AI 对话要额外付费 | 需要自备 DeepSeek API Key，按量计费 |
| macOS / Linux 为预览 | 官方说明这两个平台的 GUI 未做实机验收 |

> 以上基于官方文档与社区反馈整理（2026-10-24），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
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
```

安装包来源：[https://github.com/MerZlin/dsh-pet-indesktop/releases/tag/v4.4.0](https://github.com/MerZlin/dsh-pet-indesktop/releases/tag/v4.4.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| Windows 安装包下载 + SHA256 校验 | 已验证 2026-10-24 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供各平台安装包选择、安装步骤与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-24）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\dsh-pet-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后：让它说话

Chat 版自带 AI 对话，默认已经填好 DeepSeek 的接口地址和模型，只需要一个 API Key：

1. 右键桌宠 →「桌宠设置」→ 左侧「AI 与对话」→「模型与连接」
2. 把 DeepSeek 开放平台创建的 `sk-` 密钥粘到 API Key
3. 点侧栏底部「保存并退出」，再点「测试连接」

没有 Key 也能用桌宠本体：动画、拖拽、托盘、多宠都不受影响。

> API Key 按量计费，余额不足时返回 402；Key 错误返回 401/403。

## 常见坑

- Windows 若弹出 SmartScreen：点「更多信息 → 仍要运行」，安装包尚未购买代码签名
- 安装目录默认在 `%LOCALAPPDATA%\Programs\dsh-pet-standalone-webm-chat`，不需要管理员权限
- 找不到桌宠时先看系统托盘（可能被折叠），双击托盘图标可显示/隐藏
- macOS 未签名，首次打开需右键 →「打开」，或执行 `xattr -dr com.apple.quarantine`
- Linux 缺库时执行 `sudo apt install libxcb-cursor0 libxkbcommon-x11-0 libegl1 libgl1 libfontconfig1 libdbus-1-3 fonts-noto-cjk`；Wayland 下透明异常可试 `QT_QPA_PLATFORM=xcb`
- AI 对话返回 401/403 是 Key 错误，402 是余额不足，429 是限流
- 数据和配置按变体存放在独立目录，升级前建议整目录备份；旧版本不读新的 config-slot-0.json
- 全屏应用会暂时盖住桌宠，退出全屏后自动恢复，这是系统级置顶行为

## 免责声明

本仓库为第三方指南，与 dsh-pet 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-24），项目迭代快，请以[官方文档](https://github.com/MerZlin/dsh-pet-indesktop#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
