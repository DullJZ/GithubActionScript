#!/bin/bash
#测速
speed_test(){
	wget https://raw.github.com/sivel/speedtest-cli/master/speedtest.py
	chmod a+rx speedtest.py
	mv speedtest.py /usr/local/bin/speedtest
	chown root:root /usr/local/bin/speedtest
}
echo
echo && echo -e " Github Action 脚本 by DullJZ
 ———————————————————————
 ${Green_font_prefix} 0.${Font_color_suffix} 检测IP
 ${Green_font_prefix} 1.${Font_color_suffix} 测速
 ${Green_font_prefix} 2.${Font_color_suffix} 检测系统
 ———————————————————————" && echo
read -e -p " 请输入数字 [0-2]:" num
case "$num" in
0)
    curl cip.cc
    ;;
1)
    speed_test
    speedtest
    ;;
2)
    cat /etc/issue
    ;;
*)
    echo
    echo -e " ${Error} 请输入正确的数字"
    ;;
esac
