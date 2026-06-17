#!/bin/bash

# Renk Tanımlamaları
YESIL='\033[0;32m'
MAVI='\033[0;34m'
KIRMIZI='\033[0;31m'
BEYAZ='\033[0;37m'
NC='\033[0m'

clear
# Havalı QARO Açılış Banner'ı
echo -e "${YESIL}"
echo "  ██████╗  █████╗ ██████╗  ██████╗ "
echo " ██╔═══██╗██╔══██╗██╔══██╗██╔═══██╗"
echo " ██║   ██║███████║██████╔╝██║   ██║"
echo " ██║   ██║██╔══██║██╔══██╗██║   ██║"
echo " ╚██████╔╝██║  ██║██║  ██║╚██████╔╝"
echo "  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ "
echo "          xsec SECURITY TOOL v2     "
echo -e "${NC}"

echo -e "${BEYAZ}[1]${NC} Hedef Sistem Port Tara (Nmap + Firewall Bypass)"
echo -e "${BEYAZ}[2]${NC} Dış IP Detaylı Konum/ISP Sorgula"
echo -e "${BEYAZ}[3]${NC} Ağ İçi Aktif Cihazları Tara (Yerel Keşif)"
echo -e "${BEYAZ}[4]${NC} Kendi IP Adreslerini Gör (Yerel ve Dış)"
echo -e "${BEYAZ}[5]${NC} Hedef Web Sitesi WHOIS / Kayıt Bilgisi Topla"
echo -e "${BEYAZ}[6]${NC} Kullanıcı Adı Avcısı (Sosyal Medya OSINT)"
echo -e "${BEYAZ}[7]${NC} Web Admin Panel Sızma Keşfi (Hızlı Tarama)"
echo -e "${BEYAZ}[8]${NC} Çıkış"
echo ""
echo -n -e "${YESIL}Seçiminiz: ${NC}"
read secim

case $secim in
    1)
        echo -n -e "${MAVI}Hedef IP/Site girin: ${NC}"
        read hedef
        echo -e "${YESIL}Taranıyor...${NC}"
        nmap -F -Pn $hedef
        ;;
    2)
        echo -n -e "${MAVI}Sorgulanacak IP (Kendi IP'niz için boş bırakın): ${NC}"
        read ip_adresi
        curl -s "http://ip-api.com/json/$ip_adresi?lang=tr" | grep -E "country|city|isp|as|query"
        ;;
    3)
        echo -e "${YESIL}Ağ taranıyor...${NC}"
        local_net=$(ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d. -f1-3)
        if [ -z "$local_net" ]; then echo -e "${KIRMIZI}Bağlantı yok!${NC}"; else nmap -sn $local_net.0/24; fi
        ;;
    4)
        echo -e "${YESIL}IP Bilgileriniz:${NC}"
        echo -e "${MAVI}Dış IP: ${BEYAZ}$(curl -s https://ifconfig.me)${NC}"
        echo -e "${MAVI}İç IP:  ${BEYAZ}$(ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}')${NC}"
        ;;
    5)
        echo -n -e "${MAVI}Hedef Alan Adını Girin (Örn: google.com): ${NC}"
        read domain
        echo -e "${YESIL}Whois bilgileri çekiliyor...${NC}"
        curl -s "https://api.hackertarget.com/whois/?q=$domain" | head -n 25
        ;;
    6)
        echo -n -e "${MAVI}Aranacak Kullanıcı Adını Girin: ${NC}"
        read username
        echo -e "${YESIL}Platformlar taranıyor (Hesap var mı?)...${NC}"
        for platform in "instagram.com" "tiktok.com/@" "github.com" "twitter.com" "linktr.ee"
        do
            status=$(curl -s -o /dev/null -w "%{http_code}" "https://$platform$username")
            if [ "$status" == "200" ]; then
                echo -e "${YESIL}[+] BULUNDU:${NC} https://$platform$username"
            else
                echo -e "${BEYAZ}[-] Yok:${NC} $platform"
            fi
        done
        ;;
    7)
        echo -n -e "${MAVI}Hedef Siteyi Girin (Örn: http://hedef.com): ${NC}"
        read web_site
        echo -e "${KIRMIZI}Admin panelleri taranıyor...${NC}"
        for path in "/admin/" "/administrator/" "/login.php" "/wp-admin/" "/admin.php" "/user/"
        do
            status=$(curl -s -o /dev/null -w "%{http_code}" "$web_site$path")
            if [ "$status" == "200" ] || [ "$status" == "301" ]; then
                echo -e "${YESIL}[+] PANEL SIZINTISI REAKSİYON VERDİ ($status):${NC} $web_site$path"
            fi
        done
        ;;
    8)
        echo -e "${YESIL}Qaro xsec iyi günler diler!${NC}"
        exit 0
        ;;
    *)
        echo -e "${KIRMIZI}Geçersiz seçim!${NC}"
        ;;
esac
echo ""
echo -e "${MAVI}Menüye dönmek için Enter'a basın...${NC}"
read
./qaro.sh
