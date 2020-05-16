# env-of-evan
Evan's Windows Development Environment

# Requirements
 - Windows 10

# Registry

## Explorer
```
HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer
```
|Key|Value|Desc|
|-|-|-|
|ShowRecent|0|일반 > 개인 정보 보호 > 즐겨찾기에서 최근에 사용된 파일 표시|
|ShowFrequent|0|일반 > 개인 정보 보호 > 즐겨찾기에서 최근에 사용된 폴더 표시|

```
HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
```
|Key|Value|Desc|
|-|-|-|
|LaunchTo|1|일반 > 파일 탐색기 열기|
|Hidden|1|보기 > 숨김 파일 및 폴더|
|HideFileExt|0|보기 > 알려진 파일 형식의 파일 확장명 숨기기|

## Taskbar
```
HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search
```
|Key|Value|Desc|
|-|-|-|
|SearchboxTaskbarMode|0|작업 표시줄 > 검색 > 숨김|

## Console
```
HKCU:Console
```
|Key|Value|Desc|
|-|-|-|
|FaceName|D2Coding ligature|Defualt Font|
|FontSize|0x00100000|Defualt FontSize (16)|

# Installation list
## PowerShell (PSGallery)
- [posh-git](https://www.powershellgallery.com/packages/posh-git)
- [oh-my-posh](https://www.powershellgallery.com/packages/oh-my-posh)

## Chocolatey

### PowerShell
- [ColorTool](https://chocolatey.org/packages/colortool)
- [D2Codingfont](https://chocolatey.org/packages/d2codingfont)

### Default tools
- [Google Chrome](https://chocolatey.org/packages/googlechrome)
- [BandiZip](https://chocolatey.org/packages/bandizip)

### Developer tools
- [git](https://chocolatey.org/packages/git)
- [GitKraken](https://chocolatey.org/packages/gitkraken)
- [.NET Core SDK](https://chocolatey.org/packages/dotnetcore-sdk)
- [Jetbrains Rider](https://chocolatey.org/packages/jetbrains-rider)
- [Jetbrains DataGrip](https://chocolatey.org/packages/datagrip)
- [Jetbrains DotPeek](https://chocolatey.org/packages/dotpeek)
- [VisualStudio Code](https://chocolatey.org/packages/vscode)
- [Docker Desktop](https://chocolatey.org/packages/docker)

### Other tools
- [GoodbyeDPI](https://chocolatey.org/packages/goodbyedpi)
- [Teamviewer](https://chocolatey.org/packages/teamviewer)
- [Everything](https://chocolatey.org/packages/everything)
- [PotPlayer](https://chocolatey.org/packages/potplayer)
- [ShareX](https://chocolatey.org/packages/sharex)
- [qBittorrent](https://chocolatey.org/packages/qbittorrent)
- [Steam](https://chocolatey.org/packages/steam)
- [Microsoft Teams](https://chocolatey.org/packages/microsoft)
- [Zoom](https://chocolatey.org/packages/zoom)

# Uninstallation list
- 3D Builder
- 3D Viewer
- Camera
- Get Office
- Get Skype
- Get Started
- Maps
- Microsoft Solitaire Collection
- Money
- Movies & TV
- News
- OneNote
- People
- Phone Companion
- Photos
- Sports
- Weather
- Xbox
