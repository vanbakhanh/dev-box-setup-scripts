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
choco install vscode
choco install python
choco install 7zip
choco install nodejs
choco install docker-desktop
choco install postman
choco install dbeaver
choco install putty
choco install notepadplusplus
choco install firacode
choco install microsoft-windows-terminal
choco install fiddler
choco install git --params "/GitAndUnixToolsOnPath /NoAutoCrlf /WindowsTerminal"
choco install git-fork
echo;

echo * Installing WSL2...
choco install wsl2 --params "/Version:2 /Retry:true"
choco install wsl-ubuntu-2004 --params "/InstallRoot:true"
echo;

echo * Installing Entertaiment Stuff...
choco install utorrent --ignore-checksums
choco install splash

echo * Finished
pause
