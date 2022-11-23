

License Key : SakuraV3

Debian 10 Sahaja <br>
 
  ```html
apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
  ```
Install Full<br>

  ```html
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/razerhunters/Persinggahan-V3/main/INSTALL/install.sh && chmod +x install.sh && ./install.sh
  ```