#KEIZINAN SETUP
IZIN=$( curl https://raw.githubusercontent.com/rajakapur/ipppp/main/ipsaja  | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo -e "${red}Daftar IP dalam terlebih dahulu. #${NC}"
rm -f setup.sh
exit 0
fi


#KEIZINAN one
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/rajakapur/ipppp/main/ipsaja  | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS one AKTIF...\e[0m"
    else
    echo -e "\e[31mone ANDA EXPIRED!\e[0m";
    echo -e "\e[31mRenew IP terlebih dahulu #\e[0m"
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/rajakapur/ipppp/main/ipsaja  | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mDaftar IP terlebih dahulu.#\e[0m"
exit 0
fi