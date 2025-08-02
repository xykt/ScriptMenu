<p align="center">
<img src="https://hits.xykt.de/menu.svg?action=view&count_bg=%2379C83D&title_bg=%23555555&title=Runs&edge_flat=false"/> 
<img src="https://hits.xykt.de/menu_github.svg?action=hit&count_bg=%233DC8C0&title_bg=%23555555&title=Visits&edge_flat=false"/> 
<a href="/LICENSE"><img src="https://img.shields.io/badge/License-AGPL%20v3-blue.svg" alt="license" /></a>  
</p>

## XY系列脚本交互菜单  -  [Menu for XY Scripts (EN)](https://github.com/xykt/ScriptMenu/blob/main/README_EN.md)

**支持OS/Platform：Ubuntu | Debian | Linux Mint | Fedora | Red Hat Enterprise Linux (RHEL) | CentOS | Arch Linux | Manjaro | Alpine Linux | AlmaLinux | Rocky Linux | macOS | Anolis OS | Alibaba Cloud Linux | SUSE Linux | openSUSE | Void Linux**

#### Bash:
````bash
bash <(curl -Ls Check.Place)
````

#### Docker:
````bash
docker run --rm --net=host -it xykt/check
````

## 屏幕截图

|界面|截图|
| ---------------- | ---------------- |
|主菜单|![Main](https://github.com/xykt/ScriptMenu/raw/main/res/Main_CN.png)|
|IP质量体检菜单|![IP](https://github.com/xykt/ScriptMenu/raw/main/res/IP_CN.png)|
|网络质量体检菜单|![Net](https://github.com/xykt/ScriptMenu/raw/main/res/Net_CN.png)|



## 使用方法

#### 默认模式：
````bash
bash <(curl -Ls Check.Place)
````

#### 英文界面及报告（任选其一）：
````bash
bash <(curl -Ls Check.Place) -E
bash <(curl -Ls Check.Place) -l en
````

#### 只检测IPv4结果：
````bash
bash <(curl -Ls Check.Place) -4
````

#### 只检测IPv6结果：
````bash
bash <(curl -Ls Check.Place) -6
````

#### 默认进入IP质量体检界面：
````bash
bash <(curl -Ls Check.Place) -I
````
#####  * 以下命令可将界面锁定于IP质量体检
````bash
bash <(curl -Ls Check.Place) -IL
````

#### 默认进入网络质量体检界面：
````bash
bash <(curl -Ls Check.Place) -N
````
#####  * 以下命令可将界面锁定于网络质量体检
````bash
bash <(curl -Ls Check.Place) -NL
````

#### 自动安装依赖：
````bash
bash <(curl -Ls Check.Place) -y
````

## 脚本更新

2025/04/21 21:30 修复IPv4单栈机器运行三网回程报错bug

2025/04/13 21:00 脚本发布
