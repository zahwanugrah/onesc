#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/rajakapur/userip/main/bossip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS one AKTIF...\e[0m"
    else
    echo -e "\e[31mone ANDA EXPIRED!\e[0m";
    echo -e "\e[31mRenew IP letak tempoh banyak kit okay? hehe syg ktk #\e[0m"
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/rajakapur/userip/main/bossip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mDaftar IP dalam github lok sayang okay? mun dah daftar tapi masih juak permission denied refresh dolok website ya hehe. Love you #\e[0m"
exit 0
fi
clear
echo > /etc/wireguard/clients.txt
data=( `cat /etc/wireguard/wg0.conf | grep "### Client" | awk '{ print $3 }'`);
hr(){
    numfmt --to=iec-i --suffix=B "$1"
}
x=1
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m";
echo -e "\E[0;100;33m    • WIREGUARD USER LOGIN •       \E[0m";
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m";
echo ""
echo "Name  Remote IP Virtual IP Bytes Received Bytes Sent Last Seen "
echo ""
for akun in "${data[@]}"
do
pub=$(cat /etc/wireguard/wg0.conf | grep PublicKey | awk '{ print $3 }' | tr '\n' ' ' | awk '{print $'"$x"'}')
echo "$akun $pub" >> /etc/wireguard/clients.txt
x=$(( "$x" + 1 ))
done
CLIENTS_FILE="/etc/wireguard/clients.txt"
if [ ! -s "$CLIENTS_FILE" ]; then
    echo "::: There are no clients to list"
    exit 0
fi
listClients(){
    if DUMP="$(wg show wg0 dump)"; then
        DUMP="$(tail -n +2 <<< "$DUMP")"
    else
        exit 1
    fi

    printf "\e[1m::: Connected Clients List :::\e[0m\n"

    {
    printf "\e[4mName\e[0m  \t  \e[4mRemote IP\e[0m  \t  \e[4mVirtual IP\e[0m  \t  \e[4mBytes Received\e[0m  \t  \e[4mBytes Sent\e[0m  \t  \e[4mLast Seen\e[0m\n"

    while IFS= read -r LINE; do
        if [ -n "${LINE}" ]; then
            PUBLIC_KEY="$(awk '{ print $1 }' <<< "$LINE")"
            REMOTE_IP="$(awk '{ print $3 }' <<< "$LINE")"
            VIRTUAL_IP="$(awk '{ print $4 }' <<< "$LINE")"
            BYTES_RECEIVED="$(awk '{ print $6 }' <<< "$LINE")"
            BYTES_SENT="$(awk '{ print $7 }' <<< "$LINE")"
            LAST_SEEN="$(awk '{ print $5 }' <<< "$LINE")"
            CLIENT_NAME="$(grep "$PUBLIC_KEY" "$CLIENTS_FILE" | awk '{ print $1 }')"
            if [ "$HR" = 1 ]; then
                if [ "$LAST_SEEN" -ne 0 ]; then
                    printf "%s  \t  %s  \t  %s  \t  %s  \t  %s  \t  %s\n" "$CLIENT_NAME" "$REMOTE_IP" "${VIRTUAL_IP/\/32/}" "$(hr "$BYTES_RECEIVED")" "$(hr "$BYTES_SENT")" "$(date -d @"$LAST_SEEN" '+%b %d %Y - %T')"
                else
                    printf "%s  \t  %s  \t  %s  \t  %s  \t  %s  \t  %s\n" "$CLIENT_NAME" "$REMOTE_IP" "${VIRTUAL_IP/\/32/}" "$(hr "$BYTES_RECEIVED")" "$(hr "$BYTES_SENT")" "(not yet)"
                fi
            else
                if [ "$LAST_SEEN" -ne 0 ]; then
                    printf "%s  \t  %s  \t  %s  \t  %'d  \t  %'d  \t  %s\n" "$CLIENT_NAME" "$REMOTE_IP" "${VIRTUAL_IP/\/32/}" "$BYTES_RECEIVED" "$BYTES_SENT" "$(date -d @"$LAST_SEEN" '+%b %d %Y - %T')"
                else
                    printf "%s  \t  %s  \t  %s  \t  %'d  \t  %'d  \t  %s\n" "$CLIENT_NAME" "$REMOTE_IP" "${VIRTUAL_IP/\/32/}" "$BYTES_RECEIVED" "$BYTES_SENT" "(not yet)"
                fi
            fi
        fi
    done <<< "$DUMP"

    printf "\n"
    } | column -t -s $'\t'
}
listClients
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-wg

