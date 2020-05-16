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
- [colortool](https://chocolatey.org/packages/colortool)
- [d2codingfont](https://chocolatey.org/packages/d2codingfont)

### Default tools
- [googlechrome](https://chocolatey.org/packages/googlechrome)
- [bandizip](https://chocolatey.org/packages/bandizip)

### Developer tools
- [git](https://chocolatey.org/packages/git)
- [gitkraken](https://chocolatey.org/packages/gitkraken)
- [dotnetcore-sdk](https://chocolatey.org/packages/dotnetcore-sdk) 3.1
- [jetbrains-rider](https://chocolatey.org/packages/jetbrains-rider/2020.1.2) 2020.1.2
- [datagrip](https://chocolatey.org/packages/datagrip)
- [dotpeek](https://chocolatey.org/packages/dotpeek)
- [vscode](https://chocolatey.org/packages/vscode)
- [docker-desktop](https://chocolatey.org/packages/docker)

### Other tools
- [goodbyedpi](https://chocolatey.org/packages/goodbyedpi)
- [teamviewer](https://chocolatey.org/packages/teamviewer)
- [potplayer](https://chocolatey.org/packages/potplayer)
- [sharex](https://chocolatey.org/packages/sharex)
- [qbittorrent](https://chocolatey.org/packages/qbittorrent)
- [steam](https://chocolatey.org/packages/steam)
- [microsoft-teams](https://chocolatey.org/packages/microsoft)
- [zoom](https://chocolatey.org/packages/zoom)

# Uninstallation list
- 3D Builder
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
