#Requires -RunAsAdministrator

Function AppxPackage-Uninstall {
    Param (
        [Parameter(Mandatory=$true)][string] $Package
    )

    Write-Host "[Appx] Uninstall $Package.." -f Yellow
    Get-AppxPackage $Package | Remove-AppxPackage
}

Function Choco-Install {
    Param (
        [Parameter(Mandatory=$true)][string] $Package,
        [Parameter(Mandatory=$false)][string] $Version
    )

    Write-Host "[Choco] Install $Package.." -f Cyan

    if ($Version -eq $null) {
        choco install $Package -y
    } else {
        choco install $Package --version=$Version -y
    }
}

Function PSGallery-Install {
    Param (
        [Parameter(Mandatory=$true)][string] $Package
    )

    if ((Get-PSRepository).InstallationPolicy -ne 'Trusted') {
        Set-PSRepository PSGallery -InstallationPolicy Trusted
    }

    if (Get-Module -ListAvailable -Name $Package) {
        Write-Host "[PS] $Package is already installed." -f DarkCyan
    } else {
        Write-Host "[PS] Install $Package.." -f Cyan
        Install-Module $Package -Scope CurrentUser -Repository PSGallery
    }
}

# ---- Remove Built-in applications ----
$Apps = @(
    "*3dbuilder*",           # 3D Builder
    "*windowscamera*"        # Camera
    "*officehub*",           # Get Office
    "*skypeapp*",            # Get Skype
    "*getstarted*",          # Get Started
    "*windowsmaps*",         # Maps
    "*solitairecollection*", # Microsoft Solitaire Collection
    "*bingfinance*",         # Money
    "*zunevideo*",           # Movies & TV
    "*bingnews*",            # News
    "*onenote*",             # OneNote
    "*people*",              # People
    "*windowsphone*",        # Phone Companion
    "*photos*",              # Photos
    "*bingsports*",          # Sports
    "*bingweather*",         # Weather
    "*xboxapp*"              # Xbox
)

ForEach ($App in $Apps) {
    AppxPackage-Uninstall $App
}

# ---- Explorer ----
$Key = "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty $Key LaunchTo 1    # 일반 > 파일 탐색기 열기
Set-ItemProperty $Key Hidden 1      # 보기 > 숨김 파일 및 폴더
Set-ItemProperty $Key HideFileExt 0 # 보기 > 알려진 파일 형식의 파일 확장명 숨기기

# ---- Taskar ----
$Key = "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
Set-ItemProperty $Key SearchboxTaskbarMode 0 # 작업 표시줄 > 검색 > 숨김

# ---- Install Chocolatey ----
if ($choco = Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "Chocolatey is already installed."
} else {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

# ---- PowerShell Customize ----

Choco-Install colortool
Choco-Install d2codingfont

PSGallery-Install posh-git
PSGallery-Install oh-my-posh

Set-ItemProperty "HKCU:Console" FaceName "D2Coding ligature" # FontName
Set-ItemProperty "HKCU:Console" FontSize 0x00100000          # FontSize 16

$PsProfile = "$PsHome\Microsoft.PowerShell_profile.ps1"
New-Item -Path $PsProfile -Type File -Force | Out-Null
Add-Content -Path $PsProfile -Value "Clear-Host"
Add-Content -Path $PsProfile -Value "colortool -q OneHalfDark.itermcolors"
Add-Content -Path $PsProfile -Value "Import-Module posh-git"
Add-Content -Path $PsProfile -Value "Import-Module oh-my-posh"
Add-Content -Path $PsProfile -Value "Set-Theme Agnoster"

# ---- Default tools ----

## Google Chrome
Choco-Install googlechrome

## Bandizip
Choco-Install bandizip 7.03

# ---- Developer tools ----

## Git
Choco-Install git

## GitKraken
Choco-Install gitkraken

## .NET Core 3.1 SDK
Choco-Install dotnetcore-sdk 3.1

## Jetbrains
Choco-Install jetbrains-rider 2020.1.2
Choco-Install datagrip
Choco-Install dotpeek

## Visual Studio Code
Choco-Install vscode

## Docker Desktop
Choco-Install docker-desktop

# ---- Other tools ----

## PotPlayer
Choco-Install potplayer

## ShareX
Choco-Install sharex

## qBittorrent
Choco-Install qbittorrent

## Steam
Choco-Install steam

## Microsoft Teams
Choco-Install microsoft-teams

## Zoom
Choco-Install zoom