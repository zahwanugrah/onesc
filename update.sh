#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
#EDIT IZIN
sleep 2
clear
echo -e "$green   =============================================$NC"
echo -e "$green                    $Blink UPDATE SCRIPT$NC               $NC"
echo -e "$green   =============================================$NC"
sleep 5
rm -rf menu
rm -rf m-sshovpn
rm -rf m-wg
rm -rf m-ssr
rm -rf v2ray-vmess
rm -rf v2ray-vless
rm -rf xray-vmess
rm -rf xray-vless
rm -rf xray-xtls
rm -rf m-trojan
rm -rf m-system

# download menu
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/nikstore/scnew/main/update/menu.sh"
wget -O m-sshovpn "https://raw.githubusercontent.com/nikstore/scnew/main/update/m-sshovpn.sh"
wget -O m-wg "https://raw.githubusercontent.com/nikstore/scnew/main/update/m-wg.sh"
wget -O m-ssr "https://raw.githubusercontent.com/nikstore/scnew/main/update/m-ssr.sh"
wget -O v2ray-vmess "https://raw.githubusercontent.com/nikstore/scnew/main/update/v2ray-vmess.sh"
wget -O v2ray-vless "https://raw.githubusercontent.com/nikstore/scnew/main/update/v2ray-vless.sh"
wget -O xray-vmess "https://raw.githubusercontent.com/nikstore/scnew/main/update/xray-vmess.sh"
wget -O xray-vless "https://raw.githubusercontent.com/nikstore/scnew/main/update/xray-vless.sh"
wget -O xray-xtls "https://raw.githubusercontent.com/nikstore/scnew/main/update/xray-xtls.sh"
wget -O m-trojan "https://raw.githubusercontent.com/nikstore/scnew/main/update/m-trojan.sh"
wget -O m-system "https://raw.githubusercontent.com/nikstore/scnew/main/update/m-system.sh"


chmod +x menu
chmod +x m-sshovpn
chmod +x m-wg
chmod +x m-ssr
chmod +x v2ray-vmess
chmod +x v2ray-vless
chmod +x xray-vmess
chmod +x xray-vless
chmod +x xray-xtls
chmod +x m-trojan
chmod +x m-system
sleep 2
clear
echo -e "$green   =============================================$NC"
echo -e "$green                    $Blink SETTLE UPDATE$NC               $NC"
echo -e "$green   =============================================$NC"
sleep 5
sl-download-info
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot

