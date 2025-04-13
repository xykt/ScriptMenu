#!/bin/bash
script_version="v2025-04-13"
Font_B="\033[1m"
Font_D="\033[2m"
Font_I="\033[3m"
Font_U="\033[4m"
Font_Black="\033[30m"
Font_Red="\033[31m"
Font_Green="\033[32m"
Font_Yellow="\033[33m"
Font_Blue="\033[34m"
Font_Purple="\033[35m"
Font_Cyan="\033[36m"
Font_White="\033[37m"
Back_Black="\033[40m"
Back_Red="\033[41m"
Back_Green="\033[42m"
Back_Yellow="\033[43m"
Back_Blue="\033[44m"
Back_Purple="\033[45m"
Back_Cyan="\033[46m"
Back_White="\033[47m"
Font_Suffix="\033[0m"
Font_LineClear="\033[2K"
Font_LineUp="\033[1A"
declare IP=""
declare IPhide
declare fullIP=0
declare YY="cn"
declare IPV4
declare IPV6
declare IPV4check=1
declare IPV6check=1
declare IPV4work=0
declare IPV6work=0
declare ERRORcode=0
declare mode_yes=0
declare mode_lock=0
declare mode_func=""
declare -A swarn
declare -A smenu
set_language(){
case "$YY" in
"en")swarn[1]="ERROR: Unsupported parameters!"
swarn[2]="ERROR: IP address format error!"
swarn[3]="ERROR: Dependent programs are missing. Please run as root or install sudo!"
swarn[4]="ERROR: Parameter -4 conflicts with -i or -6!"
swarn[6]="ERROR: Parameter -6 conflicts with -i or -4!"
swarn[7]="ERROR: The specified network interface is invalid or does not exist!"
swarn[8]="ERROR: The specified proxy parameter is invalid or not working!"
swarn[40]="ERROR: IPv4 is not available!"
swarn[60]="ERROR: IPv6 is not available!"
smenu[enable]=" (Enabled)"
smenu[disable]=" (Disabled)"
smenu[set]=" (Set)"
smenu[unset]=" (Unset)"
smenu[ok]="OK"
smenu[exit]="Exit"
smenu[cancel]="Cancel"
smenu[ttitle]="Welcome to XY Series Scripts"
smenu[tmenu]="Please select a script function:"
smenu[tip]="IP Quality Check"
smenu[tnet]="Network Quality Check"
smenu[thard]="Hardware Quality Check (Not Yet Developed)"
smenu[tmedia]="Streaming Media Unlock Detection (Modified)"
smenu[tnq]="NodeQuality All-in-One Test (by LloydAsp)"
smenu[texit]="Exit Script"
smenu[siptitle]="IP Quality Check Script"
smenu[sipmenu]="Please select a script function:"
smenu[sipstart]="Start Detection"
smenu[sipfuniface]="Parameter: Specify Network Interface"
smenu[sipfunproxy]="Parameter: Specify Proxy Server"
smenu[sipfunautodep]="Parameter: Auto-install Dependencies"
smenu[sipfunfullip]="Parameter: Show Full IP in Report"
smenu[sipreturn]="Return to Main Menu"
smenu[sipfunifacetitle]="Setting: Specify Network Interface"
smenu[sipfunifaceinput]="Please enter the network interface name: (e.g., eth0)"
smenu[sipfunproxytitle]="Setting: Specify Proxy Server"
smenu[sipfunproxyinput]="Please enter the proxy server: (e.g., socks5://username:password@socksproxy:port)"
smenu[snettitle]="Network Quality Check"
smenu[snetmenu]="Please select a script function:"
smenu[snetfull]="Start Detection"
smenu[snetlite]="Low-Data Mode (<100Mb)"
smenu[snetroute]="Full Routing Mode"
smenu[snetdelay]="Latency Mode"
smenu[snetcustom]="Custom Lite Mode"
smenu[snetfunautodep]="Parameter: Auto-install Dependencies"
smenu[snetfunfullip]="Parameter: Show Full IP in Report"
smenu[snetreturn]="Return to Main Menu"
smenu[snetroutetitle]="Setting: Specify Return Route Detection Region"
smenu[snetrouteinput]="Leave blank to detect Beijing, Shanghai, and Guangdong, or specify a region name/code/abbreviation:             (e.g., 广西壮族自治区, 广西, 桂, GX, gx)"
smenu[snetcustomtitle]="Setting: Specify Detection Content Sections"
smenu[snetcustominput]="Please select/deselect with space button:"
smenu[snetcustombgp]="BGP Information"
smenu[snetcustomlocal]="Local Policy"
smenu[snetcustomconn]="Connectivity"
smenu[snetcustomdelay]="China Mainland TCP Delay"
smenu[snetcustomroute]="Route to China Mainland"
smenu[snetcustomspeed]="NetSpeed to China"
smenu[snetcustomiperf]="Global Network"
smenu[shardtitle]="Hardware Quality Check"
smenu[shardmenu]="Sorry, this script is not yet developed. Please consider alternatives."
smenu[shardreplace]="Alternative - yabs Test"
smenu[shardreturn]="Return to Main Menu"
smenu[ipv46title]="Select IPv4/IPv6 Detection Type"
smenu[ipv46menu]="Please select the detection type:"
smenu[ipv46v4v6]="IPv4 and IPv6 Dual Stack"
smenu[ipv46v4]="IPv4 Only"
smenu[ipv46v6]="IPv6 Only"
;;
"cn")swarn[1]="错误：不支持的参数！"
swarn[2]="错误：IP地址格式错误！"
swarn[3]="错误：未安装依赖程序，请以root执行此脚本，或者安装sudo命令！"
swarn[4]="错误：参数-4与-i/-6冲突！"
swarn[6]="错误：参数-6与-i/-4冲突！"
swarn[7]="错误：指定的网卡不存在！"
swarn[8]="错误: 指定的代理服务器不可用！"
swarn[40]="错误：IPV4不可用！"
swarn[60]="错误：IPV6不可用！"
smenu[enable]="（已启用）"
smenu[disable]="（已禁用）"
smenu[set]="（已设定）"
smenu[unset]="（未设定）"
smenu[ok]="确定"
smenu[exit]="退出"
smenu[cancel]="取消"
smenu[ttitle]="欢迎使用XY系列脚本"
smenu[tmenu]="请选择脚本功能："
smenu[tip]="IP质量体检"
smenu[tnet]="网络质量体检"
smenu[thard]="硬件质量体检（暂未开发）"
smenu[tmedia]="改版流媒体解锁检测"
smenu[tnq]="NodeQuality全能测试（by酒神）"
smenu[texit]="退出脚本"
smenu[siptitle]="IP质量体检脚本"
smenu[sipmenu]="请选择脚本功能："
smenu[sipstart]="开始检测"
smenu[sipfuniface]="参数：指定网卡"
smenu[sipfunproxy]="参数：指定代理服务器"
smenu[sipfunautodep]="参数：自动安装依赖"
smenu[sipfunfullip]="参数：报告展示完整IP"
smenu[sipreturn]="返回主菜单"
smenu[sipfunifacetitle]="设定：指定网卡"
smenu[sipfunifaceinput]="请输入网卡名称：（如eth0）"
smenu[sipfunproxytitle]="设定：指定代理服务器"
smenu[sipfunproxyinput]="请输入代理服务器： （如socks5://username:password@socksproxy:port）"
smenu[snettitle]="网络质量体检"
smenu[snetmenu]="请选择脚本功能："
smenu[snetfull]="完整模式"
smenu[snetlite]="省流模式（<100Mb）"
smenu[snetroute]="三网完整路由"
smenu[snetdelay]="三网延迟模式"
smenu[snetcustom]="自定义精简模式"
smenu[snetfunautodep]="参数：自动安装依赖"
smenu[snetfunfullip]="参数：报告展示完整IP"
smenu[snetreturn]="返回主菜单"
smenu[snetroutetitle]="设定：指定三网回程检测地区"
smenu[snetrouteinput]="留空检测北京上海广东三地，或指定地区名称/代码/简称： （如广西壮族自治区、广西、桂、GX、gx）"
smenu[snetcustomtitle]="设定：指定需要检测的内容章节"
smenu[snetcustominput]="请按空格选择/反选："
smenu[snetcustombgp]="BGP信息"
smenu[snetcustomlocal]="本地策略"
smenu[snetcustomconn]="接入信息"
smenu[snetcustomdelay]="三网TCP延迟"
smenu[snetcustomroute]="三网回程路由"
smenu[snetcustomspeed]="国内测速"
smenu[snetcustomiperf]="国际互连"
smenu[shardtitle]="硬件质量体检"
smenu[shardmenu]="抱歉，脚本暂未开发，请考虑替代方案"
smenu[shardreplace]="替代方案 - yabs测试"
smenu[shardreturn]="返回主菜单"
smenu[ipv46title]="选择IPv4/IPv6检测类型"
smenu[ipv46menu]="请选择检测类型："
smenu[ipv46v4v6]="IPv4及IPv6双栈"
smenu[ipv46v4]="仅检测IPv4"
smenu[ipv46v6]="仅检测IPv6"
;;
*)echo -ne "ERROR: Language not supported!"
esac
}
countRunTimes(){
local RunTimes=$(curl $CurlARG -s --max-time 10 "https://hits.xykt.de/menu?action=hit" 2>&1)
}
install_dependencies(){
if ! whiptail -v >/dev/null 2>&1;then
echo "Detecting operating system..."
if [ "$(uname)" == "Darwin" ];then
install_packages "brew" "brew install" "no_sudo"
elif [ -f /etc/os-release ];then
. /etc/os-release
if [ $(id -u) -ne 0 ]&&! command -v sudo >/dev/null 2>&1;then
ERRORcode=3
fi
case $ID in
ubuntu|debian|linuxmint)install_packages "apt" "apt-get install -y"
;;
rhel|centos|almalinux|rocky|anolis)if
[ "$(echo $VERSION_ID|cut -d '.' -f1)" -ge 8 ]
then
install_packages "dnf" "dnf install -y"
else
install_packages "yum" "yum install -y"
fi
;;
arch|manjaro)install_packages "pacman" "pacman -S --noconfirm"
;;
alpine)install_packages "apk" "apk add"
;;
fedora)install_packages "dnf" "dnf install -y"
;;
alinux)install_packages "yum" "yum install -y"
;;
suse|opensuse*)install_packages "zypper" "zypper install -y"
;;
void)install_packages "xbps" "xbps-install -Sy"
;;
*)echo "Unsupported distribution: $ID"
exit 1
esac
elif [ -n "$PREFIX" ];then
install_packages "pkg" "pkg install"
else
echo "Cannot detect distribution because /etc/os-release is missing."
exit 1
fi
fi
}
install_packages(){
local package_manager=$1
local install_command=$2
local no_sudo=$3
echo -e "Lacking necessary dependencies, $Font_I${Font_Cyan}whiptail$Font_Suffix will be installed using $Font_I$Font_Cyan$package_manager$Font_Suffix."
if [[ $mode_yes -eq 0 ]];then
prompt=$(printf "Continue? (${Font_Green}y$Font_Suffix/${Font_Red}n$Font_Suffix): ")
read -p "$prompt" choice
case "$choice" in
y|Y|yes|Yes|YES)echo "Continue to execute script..."
;;
n|N|no|No|NO)echo "Script exited."
exit 0
;;
*)echo "Invalid input, script exited."
exit 1
esac
else
echo -e "Detected parameter $Font_Green-y$Font_Suffix. Continue installation..."
fi
if [ "$no_sudo" == "no_sudo" ]||[ $(id -u) -eq 0 ];then
local usesudo=""
else
local usesudo="sudo"
fi
case $package_manager in
apt)$usesudo apt update
$usesudo $install_command whiptail
;;
dnf|yum)$usesudo $install_command epel-release
$usesudo $package_manager makecache
$usesudo $install_command newt
;;
pacman)$usesudo pacman -Sy
$usesudo $install_command whiptail
;;
apk)$usesudo apk update
$usesudo $install_command newt
;;
pkg)$usesudo $package_manager update
$usesudo $package_manager $install_command whiptail
;;
brew)eval "$(/opt/homebrew/bin/brew shellenv)"
$install_command newt
;;
zypper)$usesudo zypper refresh
$usesudo $install_command whiptail
;;
xbps)$usesudo xbps-install -Sy
$usesudo $install_command newx
esac
}
adapt_locale(){
local ifunicode=$(printf '\u2800')
[[ ${#ifunicode} -gt 3 ]]&&export LC_CTYPE=en_US.UTF-8 2>/dev/null
}
is_valid_ipv4(){
local ip=$1
if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]];then
IFS='.' read -r -a octets <<<"$ip"
for octet in "${octets[@]}";do
if ((octet<0||octet>255));then
IPV4work=0
return 1
fi
done
IPV4work=1
return 0
else
IPV4work=0
return 1
fi
}
get_ipv4(){
local response
local API_NET=("myip.check.place" "ip.sb" "ping0.cc" "icanhazip.com" "api64.ipify.org" "ifconfig.co" "ident.me")
for p in "${API_NET[@]}";do
response=$(curl $CurlARG -s4 --max-time 8 "$p")
if [[ $? -eq 0 && ! $response =~ error ]];then
IPV4="$response"
break
fi
done
}
is_valid_ipv6(){
local ip=$1
if [[ $ip =~ ^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,7}:$ || $ip =~ ^:([0-9a-fA-F]{1,4}:){1,7}$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}$ || $ip =~ ^[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})$ || $ip =~ ^:((:[0-9a-fA-F]{1,4}){1,7}|:)$ || $ip =~ ^fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}$ || $ip =~ ^::(ffff(:0{1,4}){0,1}:){0,1}(([0-9]{1,3}\.){3}[0-9]{1,3})$ || $ip =~ ^([0-9a-fA-F]{1,4}:){1,4}:(([0-9]{1,3}\.){3}[0-9]{1,3})$ ]];then
IPV6work=1
return 0
else
IPV6work=0
return 1
fi
}
get_ipv6(){
local response
local API_NET=("myip.check.place" "ip.sb" "ping0.cc" "icanhazip.com" "api64.ipify.org" "ifconfig.co" "ident.me")
for p in "${API_NET[@]}";do
response=$(curl $CurlARG -s6k --max-time 8 "$p")
if [[ $? -eq 0 && ! $response =~ error ]];then
IPV6="$response"
break
fi
done
}
get_opts(){
while getopts "l:yEHILN46" opt;do
case $opt in
4)if
[[ IPV4check -ne 0 ]]
then
IPV6check=0
else
ERRORcode=4
fi
;;
6)if
[[ IPV6check -ne 0 ]]
then
IPV4check=0
else
ERRORcode=6
fi
;;
l)YY=$OPTARG
;;
y)mode_yes=1
;;
E)YY="en"
;;
H)mode_func="3"
;;
I)mode_func="1"
;;
L)mode_lock=1
;;
N)mode_func="2"
;;
\?)ERRORcode=1
esac
done
[[ $IPV4check -eq 1 && $IPV6check -eq 0 && $IPV4work -eq 0 ]]&&ERRORcode=40
[[ $IPV4check -eq 0 && $IPV6check -eq 1 && $IPV6work -eq 0 ]]&&ERRORcode=60
CurlARG="$useNIC$usePROXY"
}
show_menu(){
local opti1=""
local opti2=""
local opti3=1
local opti4=0
local optn1=""
local optn2=""
local optn3=1
local optn4=0
local msgi1
local msgi2
local msgi3="${smenu[enable]}"
local msgi4="${smenu[disable]}"
local msgn3="${smenu[enable]}"
local msgn4="${smenu[disable]}"
while true;do
cmd=""
choice=""
subchoice=""
ipv=""
export NEWT_COLORS='
          root=,green
          title=red,
          shadow=,yellow
          entry=,green
        '
if [[ -z $mode_func ]];then
choice=$(whiptail --title "${smenu[ttitle]}" --menu "${smenu[tmenu]}" \
--ok-button "${smenu[ok]}" \
--cancel-button "${smenu[exit]}" \
15 60 6 \
"1" "${smenu[tip]}" \
"2" "${smenu[tnet]}" \
"3" "${smenu[thard]}" \
"4" "${smenu[tmedia]}" \
"5" "${smenu[tnq]}" \
"0" "${smenu[texit]}" 3>&1 1>&2 2>&3)
else
choice="$mode_func"
[[ $mode_lock -eq 0 ]]&&mode_func=""
fi
case $choice in
1)export NEWT_COLORS='
              root=,yellow
              title=red,
              shadow=,green
              entry=,green
            '
cmd="bash <(curl -Ls IP.Check.Place)"
while true;do
if [[ -n $opti1 ]];then
msgi1="${smenu[set]}"
else
msgi1="${smenu[unset]}"
fi
if [[ -n $opti2 ]];then
msgi2="${smenu[set]}"
else
msgi2="${smenu[unset]}"
fi
subchoice=$(whiptail --title "${smenu[siptitle]}" --menu "${smenu[sipmenu]}" \
--ok-button "${smenu[ok]}" \
--cancel-button "${smenu[exit]}" \
15 60 6 \
"1" "${smenu[sipstart]}" \
"a" "${smenu[sipfuniface]}$msgi1" \
"b" "${smenu[sipfunproxy]}$msgi2" \
"c" "${smenu[sipfunautodep]}$msgi3" \
"d" "${smenu[sipfunfullip]}$msgi4" \
"0" "${smenu[sipreturn]}" 3>&1 1>&2 2>&3)
case $subchoice in
1)[[ -n $opti1 ]]&&cmd+=" -i $opti1"
[[ -n $opti2 ]]&&cmd+=" -x $opti2"
[[ $opti3 -eq 1 ]]&&cmd+=" -y"
[[ $opti4 -eq 1 ]]&&cmd+=" -f"
break
;;
a)opti1=$(whiptail --title "${smenu[sipfunifacetitle]}" --inputbox "${smenu[sipfunifaceinput]}" --ok-button "${smenu[ok]}" --cancel-button "${smenu[cancel]}" 10 60 "$opti1" 3>&1 1>&2 2>&3)
continue
;;
b)opti2=$(whiptail --title "${smenu[sipfunproxytitle]}" --inputbox "${smenu[sipfunproxyinput]}" --ok-button "${smenu[ok]}" --cancel-button "${smenu[cancel]}" 10 60 "$opti2" 3>&1 1>&2 2>&3)
continue
;;
c)if
[[ $opti3 -eq 0 ]]
then
opti3=1
msgi3="${smenu[enable]}"
else
opti3=0
msgi3="${smenu[disable]}"
fi
continue
;;
d)if
[[ $opti4 -eq 0 ]]
then
opti4=1
msgi4="${smenu[enable]}"
else
opti4=0
msgi4="${smenu[disable]}"
fi
continue
;;
0)break
;;
*)exit 1
esac
done
[[ $subchoice == "0" ]]&&continue
;;
2)export NEWT_COLORS='
              root=,cyan
              title=red,
              shadow=,green
              entry=,green
              checkbox=black,white
            '
cmd="bash <(curl -Ls Net.Check.Place)"
while true;do
subchoice=$(whiptail --title "${smenu[snettitle]}" --menu "${smenu[snetmenu]}" \
--ok-button "${smenu[ok]}" \
--cancel-button "${smenu[exit]}" \
15 60 8 \
"1" "${smenu[snetfull]}" \
"2" "${smenu[snetlite]}" \
"3" "${smenu[snetroute]}" \
"4" "${smenu[snetdelay]}" \
"5" "${smenu[snetcustom]}" \
"a" "${smenu[snetfunautodep]}$msgn3" \
"b" "${smenu[snetfunfullip]}$msgn4" \
"0" "${smenu[snetreturn]}" 3>&1 1>&2 2>&3)
case $subchoice in
1)[[ $optn3 -eq 1 ]]&&cmd+=" -y"
[[ $optn4 -eq 1 ]]&&cmd+=" -f"
break
;;
2)cmd+=" -L"
[[ $optn3 -eq 1 ]]&&cmd+=" -y"
[[ $optn4 -eq 1 ]]&&cmd+=" -f"
break
;;
3)optn1=$(whiptail --title "${smenu[snetroutetitle]}" --inputbox "${smenu[snetrouteinput]}" --ok-button "${smenu[ok]}" --cancel-button "${smenu[exit]}" 10 60 3>&1 1>&2 2>&3)
cmd+=" -R $optn1"
[[ $optn3 -eq 1 ]]&&cmd+=" -y"
[[ $optn4 -eq 1 ]]&&cmd+=" -f"
break
;;
4)cmd+=" -P"
[[ $optn3 -eq 1 ]]&&cmd+=" -y"
[[ $optn4 -eq 1 ]]&&cmd+=" -f"
break
;;
5)optn2=$(whiptail --title "${smenu[snetcustomtitle]}" --checklist "${smenu[snetcustominput]}" --ok-button "${smenu[ok]}" --cancel-button "${smenu[exit]}" 15 60 7 \
"1" "${smenu[snetcustombgp]}" ON \
"2" "${smenu[snetcustomlocal]}" ON \
"3" "${smenu[snetcustomconn]}" ON \
"4" "${smenu[snetcustomdelay]}" OFF \
"5" "${smenu[snetcustomroute]}" OFF \
"6" "${smenu[snetcustomspeed]}" OFF \
"7" "${smenu[snetcustomiperf]}" OFF 3>&1 1>&2 2>&3)
optn2="${optn2//[\" ]/}"
optn2=$(seq 1 7|grep -o "[^$optn2]"|tr -d '\n')
cmd+=" -S $optn2"
[[ $optn3 -eq 1 ]]&&cmd+=" -y"
[[ $optn4 -eq 1 ]]&&cmd+=" -f"
break
;;
a)if
[[ $optn3 -eq 0 ]]
then
optn3=1
msgn3="${smenu[enable]}"
else
optn3=0
msgn3="${smenu[disable]}"
fi
continue
;;
b)if
[[ $optn4 -eq 0 ]]
then
optn4=1
msgn4="${smenu[enable]}"
else
optn4=0
msgn4="${smenu[disable]}"
fi
continue
;;
0)break
;;
*)exit 1
esac
done
[[ $subchoice == "0" ]]&&continue
;;
3)export NEWT_COLORS='
              root=,red
              title=red,
              shadow=,magenta
              entry=,green
            '
cmd="bash <(curl -sL yabs.sh) -in5"
subchoice=$(whiptail --title "${smenu[shardtitle]}" --menu "${smenu[shardmenu]}" \
--ok-button "${smenu[ok]}" \
--cancel-button "${smenu[exit]}" \
15 60 2 \
"a" "${smenu[shardreplace]}" \
"0" "${smenu[shardreturn]}" 3>&1 1>&2 2>&3)
[[ $subchoice == "0" ]]&&continue
[[ $subchoice == "" ]]&&exit 1
;;
4)cmd="bash <(curl -sL Media.Check.Place)"
;;
5)cmd="bash <(curl -sL https://run.NodeQuality.com)"
;;
*)exit 1
esac
if [[ $IPV4check -eq 1 && $IPV6check -eq 1 && $IPV4work -eq 1 && $IPV6work -eq 1 ]]&&[[ $cmd == *"IP.Check.Place"* || $cmd == *"Net.Check.Place"* ]];then
subchoice=$(whiptail --title "${smenu[ipv46title]}" --menu "${smenu[ipv46menu]}" \
--ok-button "${smenu[ok]}" \
--cancel-button "${smenu[exit]}" \
15 60 3 \
"1" "${smenu[ipv46v4v6]}" \
"2" "${smenu[ipv46v4]}" \
"3" "${smenu[ipv46v6]}" 3>&1 1>&2 2>&3)
fi
if [[ $subchoice -eq 2 ]];then
cmd+=" -4"
elif [[ $subchoice -eq 3 ]];then
cmd+=" -6"
fi
[[ $YY == "en" ]]&&cmd+=" -l en"
break
done
}
adapt_locale
countRunTimes
get_ipv4
get_ipv6
is_valid_ipv4 $IPV4
is_valid_ipv6 $IPV6
get_opts "$@"
[[ mode_no -eq 0 ]]&&install_dependencies
set_language
if [[ $ERRORcode -ne 0 ]];then
echo -ne "\r$Font_B$Font_Red${swarn[$ERRORcode]}$Font_Suffix\n"
exit $ERRORcode
fi
clear
show_menu
eval "$cmd"
