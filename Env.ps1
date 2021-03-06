#Requires -RunAsAdministrator

Function AppxPackage-Uninstall {
    Param (
        [Parameter(Mandatory=$true)][string] $Package
    )

    $AppxPackage = Get-AppxPackage $Package

    if ($AppxPackage -eq $null) {
        Write-Host "[Appx] $Package is not installed." -f DarkGray
    } else {
        Write-Host "[Appx] Uninstall $Package.." -f Cyan
        Remove-AppxPackage $AppxPackage
    }
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
        Write-Host "[PS] $Package is already installed." -f DarkGray
    } else {
        Write-Host "[PS] Install $Package.." -f Cyan
        Install-Module $Package -Scope CurrentUser -Repository PSGallery
    }
}

# ---- Remove Built-in applications ----
$Apps = @(
    "Microsoft.MixedReality.Portal",
    "Microsoft.ScreenSketch",
    "Microsoft.MSPaint",
    "Microsoft.Print3D",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.OneConnect",
    "Microsoft.Wallet",
    "Microsoft.3DBuilder",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.WindowsCamera"
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.SkypeApp",
    "Microsoft.Getstarted",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.ZuneVideo",
    "Microsoft.Office.OneNote",
    "Microsoft.People",
    "Microsoft.Windows.Photos",
    "Microsoft.BingWeather",
    "Microsoft.BingNews",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.XboxGameCallableUI"
)

ForEach ($App in $Apps) {
    AppxPackage-Uninstall $App
}

# ---- Explorer ----
$Key = "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer"
Set-ItemProperty $Key ShowRecent   0 # 일반 > 개인 정보 보호 > 즐겨찾기에서 최근에 사용된 파일 표시
Set-ItemProperty $Key ShowFrequent 0 # 일반 > 개인 정보 보호 > 즐겨찾기에서 최근에 사용된 폴더 표시

$Key = "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty $Key LaunchTo 1    # 일반 > 파일 탐색기 열기
Set-ItemProperty $Key Hidden 1      # 보기 > 숨김 파일 및 폴더
Set-ItemProperty $Key HideFileExt 0 # 보기 > 알려진 파일 형식의 파일 확장명 숨기기

# ---- Taskar ----
$Key = "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
Set-ItemProperty $Key SearchboxTaskbarMode 0 # 작업 표시줄 > 검색 > 숨김

# ---- Restart Explorer ----
Stop-Process -processName: Explorer

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
Choco-Install bandizip

# ---- Developer tools ----

## Git
Choco-Install git

## GitKraken
Choco-Install gitkraken

## .NET Core SDK
Choco-Install dotnetcore-sdk

## Jetbrains
Choco-Install jetbrains-rider
Choco-Install datagrip
Choco-Install dotpeek

## Visual Studio Code
Choco-Install vscode

## Docker Desktop
Choco-Install docker-desktop

# ---- Other tools ----

## GoodbyeDPI
Choco-Install goodbyedpi

## Teamviewer
Choco-Install teamviewer

## Everything
Choco-Install everything

## PotPlayer
Choco-Install potplayer

## ShareX
Choco-Install sharex

## qBittorrent
Choco-Install qbittorrent

## Steam
Choco-Install steam

## Discord
Choco-Install discord

## Microsoft Teams
Choco-Install microsoft-teams

## Zoom
Choco-Install zoom
