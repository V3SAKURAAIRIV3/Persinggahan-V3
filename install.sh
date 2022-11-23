#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
MYIP=$(wget -qO- icanhazip.com/ip);
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
echo -e ""
echo -e "\e[33mBACA BISMILLAHIRRAHMANIRRAHIM SEBELUM INSTALL,"
echo -e "\e[33m       JANGAN ISLAM PADA IC JE, OKAY!"
echo -e "\e[0m"
echo ""
sleep 1
# Insert Password
Password=SakuraV3
# Execute
read -p "Please Insert The License Key : " Passwordnya
if [ $Password = $Passwordnya ]; then
clear
echo -e ""
echo -e "${green}Permission Accepted...${NC}"
echo ""
echo "Thanks For Using This Autoscript Free By SakuraV3"
echo ""
sleep 3
else
clear
echo -e "${red}Permission Denied!${NC}";
echo -e "${red}Please Insert The Correct License Key !${NC}"
echo ""
echo -e "Please Contact ${green}Admin${NC}"
echo -e "Telegram : t.me/SakuraV3"
rm -f install.sh
exit 0
fi
if [ -f "/usr/local/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo -e ""
echo -e " ${green}Please Insert Your Name${NC}"
echo -e ""
read -p " Client Name : " user
echo -e ""
echo -e " This Autoscript Is Free [ ${green}Established By SakuraV3 2022${NC} ] "
echo -e ""
echo "$user" >> /root/user
clear
echo -e ""
echo -e " ${green}Please Insert Domain${NC}"
echo -e ""
read -p " Hostname / Domain: " host
echo -e ""
echo -e " This Autoscript Is Free [ ${green}Established By SakuraV3 2022${NC} ] "
echo -e ""
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /root/domain
clear
echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
echo -e ""
sleep 1
#Install SSH-VPN
echo -e "\e[0;32mINSTALLING SSH-VPN...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/razerhunters/Persinggahan-V3/main/INSTALL/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
echo -e "\e[0;32mDONE INSTALLING SSH-VPN\e[0m"
echo -e ""
sleep 1
#Install Xray
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/razerhunters/Persinggahan-V3/main/INSTALL/ins-xray.sh && chmod +x ins-xray.sh && screen -S ins-xray ./ins-xray.sh
echo -e "\e[0;32mDONE INSTALLING XRAY CORE\e[0m"
echo -e ""
sleep 1
clear
#Install SET-BR
echo -e "\e[0;32mINSTALLING SET-BR...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/razerhunters/Persinggahan-V3/main/INSTALL/set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo -e "\e[0;32mDONE INSTALLING SET-BR...\e[0m"
echo -e ""
sleep 1
clear
# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
# install clouflare JQ
apt install jq curl -y

#finish
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/ssh-vpn.sh

# move client name to xray folder
mv /root/user /usr/local/etc/xray/

# Version
echo "1.2" > /home/ver
clear
echo ""
echo ""
echo -e "${green}SELESAI INSTALL AUTOSCRIPT PERCUMA SEUMUR HIDUPMU${NC}"
echo ""
echo ""
echo -e "${green}═══════════════${NC}[-Autoscript Persinggahan V3-]${green}═══════════════${NC}" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    >>> Service Details <<<"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ XRAY INFORMATION ]" | tee -a log-install.txt
echo -e "${green}   ════════════════════${NC}" | tee -a log-install.txt
echo "   - XRAY VMESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN WS TLS      : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS TCP XTLS     : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN TCP TLS     : 443"  | tee -a log-install.txt
echo "   - XRAY VMESS WS None TLS  : 80"  | tee -a log-install.txt
echo "   - XRAY VLESS WS None TLS  : 80"  | tee -a log-install.txt
echo "   - XRAY TROJAN WS None TLS : 80"  | tee -a log-install.txt
echo "   - TROJAN GO WS            : 8443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ SERVER INFORMATION ]"  | tee -a log-install.txt
echo -e "${green}   ════════════════════${NC}" | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (GMT+8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPV6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 06.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ DEV INFORMATION ]" | tee -a log-install.txt
echo -e "${green}   ════════════════════${NC}" | tee -a log-install.txt
echo "   - Autoscript Free By      : SakuraV3"  | tee -a log-install.txt
echo "   - Telegram                : t.me/SakuraV3"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "${green}════════════════${NC}Autoscript By SakuraV3${green}════════════════${NC}" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo ""
echo -e "Autoscript Free :)"
echo -e "Automatic Reboot . . ."
sleep 3
rm -r install.sh
reboot
