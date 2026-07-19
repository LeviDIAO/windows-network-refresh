@echo off
chcp 65001 >nul
title 网络刷新工具
cls
echo ============================================
echo            网络刷新工具  (免重启)
echo ============================================
echo.
:: 检测管理员权限
net session >nul 2>&1
if "%errorlevel%"=="0" (set ADMIN=Y) else (set ADMIN=N)
if "%ADMIN%"=="Y" (echo 管理员权限: 是) else (echo 管理员权限: 否)
echo.
echo [1/3] 刷新 DNS 解析缓存  (ipconfig /flushdns)
echo --------------------------------------------
ipconfig /flushdns
echo.
echo [2/3] 重新获取 IP 地址  (ipconfig /renew)
echo --------------------------------------------
ipconfig /renew
echo.
if "%ADMIN%"=="Y" (
    echo [3/3] 重新注册 DNS 名称  (ipconfig /registerdns)
    echo --------------------------------------------
    ipconfig /registerdns
    echo.
) else (
    echo [3/3] 重新注册 DNS 需要管理员权限，已跳过。
    echo        右键本文件选择“以管理员身份运行”可执行此步。
    echo.
)
echo [自检] 测试网络连通性 ...
echo --------------------------------------------
ping -n 3 8.8.8.8
ping -n 3 www.baidu.com
echo.
echo ============================================
echo              刷 新 完 成
echo ============================================
echo.
echo 按任意键退出 ...
pause >nul