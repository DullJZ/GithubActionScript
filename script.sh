#!/bin/bash
sudo su
#检查系统
check_sys() {
    if [[ -f /etc/redhat-release ]]; then
        release="centos"
    elif cat /etc/issue | grep -q -E -i "debian"; then
        release="debian"
    elif cat /etc/issue | grep -q -E -i "ubuntu"; then
        release="ubuntu"
    elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
        release="centos"
    elif cat /proc/version | grep -q -E -i "debian"; then
        release="debian"
    elif cat /proc/version | grep -q -E -i "ubuntu"; then
        release="ubuntu"
    elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
        release="centos"
    fi
    ARCH=$(uname -m)
    [ $(command -v dpkg) ] && dpkgARCH=$(dpkg --print-architecture | awk -F- '{ print $NF }')
}
#测速
speedtest(){
	wget https://raw.github.com/sivel/speedtest-cli/master/speedtest.py
	chmod a+rx speedtest.py
	mv speedtest.py /usr/local/bin/speedtest
	chown root:root /usr/local/bin/speedtest
}
echo
echo && echo -e " Github Action 脚本 by DullJZ
 
 ${Green_font_prefix} 0.${Font_color_suffix} 检测IP
 ———————————————————————
 ${Green_font_prefix} 1.${Font_color_suffix} 测速
 ${Green_font_prefix} 2.${Font_color_suffix} 检测系统
 ———————————————————————" && echo
read -e -p " 请输入数字 [0-2]:" num
case "$num" in
0)
    curl cip.cc
    ;;
1)
    speedtest
    ;;
2)
    check_sys
    ;;
*)
    echo
    echo -e " ${Error} 请输入正确的数字"
    ;;
esac
