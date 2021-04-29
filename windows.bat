@echo off

echo * Ensure that you are running this file as Administrator
echo;
pause

echo * Disabling proxies...
set HTTP_PROXY=
set HTTPS_PROXY=
echo;

echo * Installing Chocolatey...
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco feature enable -n=allowGlobalConfirmation
echo;

echo * Installing Browsers...
choco install googlechrome
choco install firefox
echo;

echo * Installing Common Work Tools...
choco install skype
choco install slack
choco install microsoft-teams
choco install zoom
echo;

echo * Installing Common Dev Tools...
choco install git --params "/GitAndUnixToolsOnPath /NoAutoCrlf /WindowsTerminal"
choco install vscode
choco install python
choco install 7zip
choco install nodejs
choco install docker-desktop
choco install postman
choco install mysql.workbench
choco install putty
choco install notepadplusplus
choco install firacode
choco install unikey
echo;

echo * Installing WSL2...
choco install wsl2
choco install wsl-ubuntu-2004 --params "/InstallRoot:true"
echo;

echo * Finished
pause
