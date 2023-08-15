@echo off
REM 一键安装VS Code的批处理脚本

REM 设置变量
set "vscode_url=https://vscode.cdn.azure.cn/stable/2ccd690cbff1569e4a83d7c43d45101f817401dc/VSCodeUserSetup-x64-1.80.2.exe"

REM 切换到临时目录
cd %temp%

REM 下载VS Code安装程序
curl %vscode_url% --output VSCodeUserSetup.exe

REM 检查下载是否成功
if not exist VSCodeUserSetup.exe (
    echo 无法下载VS Code安装程序。
    exit /b 1
)

REM 静默安装VS Code
VSCodeUserSetup.exe /VERYSILENT /MERGETASKS=!runcode

REM 清理安装程序
del /s/q VSCodeUserSetup.exe

REM 弹出消息框，提示安装完成
mshta vbscript:CreateObject("Wscript.Shell").popup("安装完成，开始使用吧！", 7, "系统提示", 64)(window.close)
