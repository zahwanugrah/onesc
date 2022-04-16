#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e ""
echo -e "\e[1;33m=============================-Menu-=============================\e[0m'"
echo -e "\e[1;33m*               Senarai Menu yang Disediakan\e[0m"
echo -e ""
 [\033[1;36m01\033[0m] • SSH & OpenVPN MENU  $wh"
 [\033[2;36m01\033[0m] • L2TP MENU$wh"
 [\033[3;36m01\033[0m] • PPTP MENU$wh"
 [\033[4;36m01\033[0m] • SSTP MENU$wh"
 [\033[5;36m01\033[0m] • WIREGUARD MENU$wh"
 [\033[6;36m01\033[0m] • SHADOWSOCKS MENU$wh"
 [\033[7;36m01\033[0m] • SHADOWSOCKSR MENU$wh"
 [\033[8;36m01\033[0m] • XRAY VMESS MENU$wh"
 [\033[9;36m01\033[0m] • XRAY VLESS MENU$wh"
 [\033[10;36m01\033[0m] • XRAY TROJAN MENU$wh"
 [\033[11;36m01\033[0m] • TROJAN GO MENU$wh"
 [\033[12;36m01\033[0m] • XRAY GRPC MENU$wh"
 echo -e ""
echo -e "\e[1;33m=============================-Menu-=============================\e[0m'"
echo -e "\e[1;33m*                 OTHER MENU\e[0m"
echo -e ""
 [\033[13;36m01\033[0m] • SLOWDNS MENU (OFF)$wh"
 [\033[14;36m01\033[0m] • CEK SEMUA IP PORT$wh"
 [\033[15;36m01\033[0m] • CEK SEMUA SERVICE VPN$wh"
 [\033[16;36m01\033[0m] • UPDATE MENU (Update 2x)$wh"
 [\033[17;36m01\033[0m] • SL-FIX (Perbaiki Error SSLH+WS-TLS setelah reboot)$wh"
 [\033[18;36m01\033[0m] • Settings (Pengaturan)$wh"
 [\033[19;36m01\033[0m] • Exit (Keluar)$wh"
 [\033[20;36m01\033[0m] • copyrepo (Salin Repo Script onesc)$wh"
 [\033[21;36m01\033[0m] • menuinfo (Untuk Mendapatkan Informasi)$wh"
 [\033[22;36m01\033[0m] • Shadowsocks Plugin Menu (OFFLINE)$wh"
echo -e "$y-------------------------------------------------$wh"
read -p "Select From Options [ 1 - 22 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
l2tpmenu
;;
3)
clear
pptpmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
vmessmenu
;;
9)
clear
vlessmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
grpcmenu
;;
13)
clear
slowdnsmenu
;;
14)
clear
ipsaya
;;
15)
clear
running
;;
16)
clear
updatemenu
;;
17)
clear
sl-fix
;;
18)
clear
setmenu
;;
19)
clear
exit
;;
20)
clear
copyrepo
;;
21)
clear
menuinfo
;;
22)
clear
tungguaja
;;
*)
clear
menu
;;
esac
