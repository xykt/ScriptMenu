<p align="center">
<img src="https://hits.xykt.de/menu.svg?action=view&count_bg=%2379C83D&title_bg=%23555555&title=Runs&edge_flat=false"/> 
<img src="https://hits.xykt.de/menu_github.svg?action=hit&count_bg=%233DC8C0&title_bg=%23555555&title=Visits&edge_flat=false"/> 
<a href="/LICENSE"><img src="https://img.shields.io/badge/License-AGPL%20v3-blue.svg" alt="license" /></a>  
</p>

## XY Series Script Interactive Menu - [XY系列脚本交互菜单（中文）](https://github.com/xykt/ScriptMenu/blob/main/README_CN.md)

**Supported OS/Platforms:** Ubuntu | Debian | Linux Mint | Fedora | Red Hat Enterprise Linux (RHEL) | CentOS | Arch Linux | Manjaro | Alpine Linux | AlmaLinux | Rocky Linux | macOS | Anolis OS | Alibaba Cloud Linux | SUSE Linux | openSUSE | Void Linux

````bash
bash <(curl -Ls Check.Place) -E
````

## Screenshots

|Main Menu|IP Quality Check Menu|Network Quality Check Menu|
| ---------------- | ---------------- | ---------------- |
|![Main](https://github.com/xykt/ScriptMenu/raw/main/res/Main_EN.png)|![IP](https://github.com/xykt/ScriptMenu/raw/main/res/IP_EN.png)|![Net](https://github.com/xykt/ScriptMenu/raw/main/res/Net_EN.png)|



## Usage Instructions

#### Default mode (choose either):
````bash
bash <(curl -Ls Check.Place) -E
bash <(curl -Ls Net.Check.Place) -l en
````

#### Chinese interface and reports:
````bash
bash <(curl -Ls Net.Check.Place)
````

#### IPv4-only:
````bash
bash <(curl -Ls Check.Place) -4
````

#### IPv6-only:
````bash
bash <(curl -Ls Check.Place) -6
````

#### Default to IP Quality Check menu:
````bash
bash <(curl -Ls Net.Check.Place) -I
````
#####  * The following command locks the interface to IP Quality Check
````bash
bash <(curl -Ls Net.Check.Place) -IL
````

#### Default to Network Quality Check menu:
````bash
bash <(curl -Ls Net.Check.Place) -N
````
#####  * The following command locks the interface to Network Quality Check
````bash
bash <(curl -Ls Net.Check.Place) -NL
````

#### Automatic dependency installation:
````bash
bash <(curl -Ls Check.Place) -y
````

## Script Updates

2025/04/13 21:00 Script released
