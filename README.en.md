<p align="center">
  <a href="README.md" style="padding:8px 18px; background:#007ec6; color:#fff; border-radius:5px; text-decoration:none; font-weight:bold;">中文</a>
  &nbsp;&nbsp;
  <a href="README.en.md" style="padding:8px 18px; background:#2ea44f; color:#fff; border-radius:5px; text-decoration:none; font-weight:bold;">English</a>
</p>

# One-Click Network Refresh (Windows, No Reboot)

A single-file `.bat` script that refreshes Windows network configuration with a double-click — **no reboot required**.

## What it does

The script runs the following (all "no reboot" operations):

| Step | Command | Description |
|------|---------|-------------|
| 1/3 | `ipconfig /flushdns` | Flush the DNS resolver cache |
| 2/3 | `ipconfig /renew` | Renew the IP address (DHCP lease) |
| 3/3 | `ipconfig /registerdns` | Re-register DNS name (**admin only**; auto-skipped otherwise) |
| Self-check | `ping 8.8.8.8` / `ping www.baidu.com` | Connectivity test |

Each step prints its real output with annotations in the console window so you can clearly see the script actually ran.

> **Why "no reboot":** Windows also has `netsh winsock reset` and `netsh int ip reset`, but those **require a reboot** to take effect. Per the requirement, this script deliberately excludes them and only does the immediately-effective refresh.

## Usage

1. **Double-click `refresh-network.bat`** to run. A console window shows each step; press any key at the end to keep it open for review.
2. To also run step 3 (`registerdns`), **right-click the script → Run as administrator**.

## Notes

- Works on Windows 10 / 11.
- The script is saved as **UTF-8 with BOM** and sets `chcp 65001` on the first line, so Chinese displays correctly without mojibake.
- No Python or external dependencies — pure Windows commands.

## When to use

- Web pages won't open / DNS resolution fails — quick cache flush.
- After switching networks (unplug/replug cable, switch Wi-Fi) and the IP didn't update.
- Routine maintenance / a first pass before network troubleshooting.

---

Files:

- `refresh-network.bat` — the script
- `README.md` — Chinese documentation
- `README.en.md` — English documentation (this page)
- `LICENSE` — MIT License
