# 一键刷新网络 / One-Click Network Refresh（Windows · 免重启 / No Reboot）

> 单文件 `.bat` 脚本，双击即刷新 Windows 网络配置，**全程不需要重启电脑**。
> A single-file `.bat` script — double-click to refresh Windows network config, **no reboot required**.

## 目录 / Contents

- [功能 / Features](#features)
- [用法 / Usage](#usage)
- [说明 / Notes](#notes)
- [适用场景 / When to use](#when)
- [文件清单 / Files](#files)
- [许可证 / License](#license)

---

## <a id="features"></a>功能 / Features

脚本依次执行以下操作（均为「不需要重启」的项目）：
The script runs the following (all "no reboot" operations):

| 步骤 / Step | 命令 / Command | 说明 / Description |
|------|------|------|
| 1/3 | `ipconfig /flushdns` | 刷新 DNS 解析缓存 / Flush the DNS resolver cache |
| 2/3 | `ipconfig /renew` | 重新获取 IP 地址（DHCP 续租）/ Renew the IP address (DHCP lease) |
| 3/3 | `ipconfig /registerdns` | 重新注册 DNS 名称（**仅管理员**；非管理员自动跳过）/ Re-register DNS name (**admin only**; auto-skipped otherwise) |
| 自检 / Self-check | `ping 8.8.8.8` / `ping www.baidu.com` | 测试网络连通性 / Connectivity test |

每一步都会在弹出的黑窗口里显示**真实输出 + 中文标注**（成功 / 跳过均有提示），让你明确知道脚本确实跑过了。
Each step prints its **real output with annotations** in the console window so you can clearly see the script actually ran.

> **为什么「免重启」/ Why "no reboot":** Windows 还有 `netsh winsock reset` 与 `netsh int ip reset` 两种重置方式，但它们执行后**必须重启**才生效。本脚本按需求刻意排除这两步，只做即时生效的刷新。
> Windows also has `netsh winsock reset` and `netsh int ip reset`, but those **require a reboot**. Per the requirement, this script deliberately excludes them and only does the immediately-effective refresh.

---

## <a id="usage"></a>用法 / Usage

1. **双击 `refresh-network.bat`** 即可运行，黑窗口会一步步显示刷新过程，最后「按任意键退出」保持窗口方便查看结果。
   **Double-click `refresh-network.bat`** to run. A console window shows each step; press any key at the end to keep it open for review.
2. 想让第 3 步 `registerdns`（DNS 重新注册）也生效：**右键脚本 → 以管理员身份运行**。
   To also run step 3 (`registerdns`): **right-click the script → Run as administrator**.

---

## <a id="notes"></a>说明 / Notes

- 适用系统：Windows 10 / 11。/ Works on Windows 10 / 11.
- 脚本以 **UTF-8 带 BOM** 保存，并在首行执行 `chcp 65001`，中文能稳定显示，不会乱码或报 `'xxx' is not recognized`。
  The script is saved as **UTF-8 with BOM** and sets `chcp 65001` on the first line, so Chinese displays correctly without mojibake.
- 不依赖 Python 或任何外部程序，纯 Windows 原生命令。/ No Python or external dependencies — pure Windows commands.

---

## <a id="when"></a>适用场景 / When to use

- 网页打不开 / DNS 解析异常，想快速清缓存。/ Web pages won't open or DNS fails — quick cache flush.
- 换了网络环境（插拔网线、切换 Wi-Fi）后 IP 没更新。/ After switching networks and the IP didn't update.
- 日常维护、排查网络前的「先刷新一遍」。/ Routine maintenance / a first pass before troubleshooting.

---

## <a id="files"></a>文件清单 / Files

- `refresh-network.bat` —— 脚本本体 / the script
- `README.md` —— 本说明（中英混排）/ this documentation (bilingual)
- `LICENSE` —— MIT 许可证 / MIT License

---

## <a id="license"></a>许可证 / License

基于 [MIT License](LICENSE) 开源。/ Released under the [MIT License](LICENSE).
