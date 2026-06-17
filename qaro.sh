#!/bin/bash
clear

echo -e "\033[0;32m ██████╗  █████╗ ██████╗  ██████╗ "
echo -e "██╔═══██╗██╔══██╗██╔══██╗██╔═══██╗"
echo -e "██║   ██║███████║██████╔╝██║   ██║"
echo -e "██║   ██║██╔══██║██╔══██╗██║   ██║"
echo -e "╚██████╔╝██║  ██║██║  ██║╚██████╔╝"
echo -e " ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ \033[0m"
echo -e " ─────────────────────────────────────────────────────────────"
echo -e "  \033[0;34m[+] Geliştirici: \033[1;37milhamXqaro\033[0m          \033[0;32m[ Sürüm: v2.6 ]\033[0m"
echo -e " ─────────────────────────────────────────────────────────────"

echo -e "\033[1;37m[1]\033[0m Hedef Sistem Port Tara"
echo -e "\033[1;37m[2]\033[0m Dış IP Detaylı Konum/ISP"
echo -e "\033[1;37m[3]\033[0m Ağ İçi Aktif Cihazlar"
echo -e "\033[1;37m[4]\033[0m Kendi IP Bilgisi"
echo -e "\033[1;37m[5]\033[0m Hedef WHOIS"
echo -e "\033[1;37m[6]\033[0m Kullanıcı Adı Avcısı"
echo -e "\033[1;37m[7]\033[0m Web Admin Panel Sızma"
echo -e "\033[1;37m[8]\033[0m Metni Hash Koduna Dönüştür (MD5/SHA256)"
echo -e "\033[1;37m[9]\033[0m Alt Alan Adı (Subdomain) Keşfi"
echo -e "\033[1;37m[10]\033[0m Sistem Bilgisi Raporlayıcı"
echo -e "\033[1;37m[11]\033[0m Sevgiliye Özel Sürpriz (Animasyonlu & Dev Kalp)"
echo -e "\033[1;37m[12]\033[0m Çıkış"
echo ""
echo -n -e "\033[0;32mSeçiminiz: \033[0m"
read secim

case $secim in
    1) 
        read -p "Hedef IP: " hedef
        nmap -F -Pn $hedef
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    2) 
        read -p "Dış IP: " ip
        curl -s https://ipapi.co/$ip/json/
        echo ""
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    3) 
        arp -a
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    4) 
        echo "Yerel IP:"; ifconfig | grep "inet "
        echo "Dış IP:"; curl -s https://ifconfig.me; echo ""
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    5) 
        read -p "Domain: " domain
        whois $domain
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    6) 
        read -p "Kullanıcı Adı: " username
        curl -s -o /dev/null -w "Instagram: %{http_code}\n" https://www.instagram.com/$username
        curl -s -o /dev/null -w "GitHub: %{http_code}\n" https://github.com/$username
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    7) 
        read -p "Hedef URL (http://...): " site
        for admin in /admin /login; do 
            curl -s -o /dev/null -w "$site$admin : %{http_code}\n" $site$admin
        done
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    8)
        echo -n "Dönüştürülecek metni girin: "
        read metin
        echo -e "\033[0;34m--- Kriptografi Sonuçları ---\033[0m"
        echo -n "MD5    : " && echo -n "$metin" | md5sum | awk '{print $1}'
        echo -n "SHA1   : " && echo -n "$metin" | sha1sum | awk '{print $1}'
        echo -n "SHA256 : " && echo -n "$metin" | sha256sum | awk '{print $1}'
        echo ""
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh
        ;;
    9)
        read -p "Hedef Domain girin (örn: target.com): " subdom
        echo -e "\033[0;32mYaygın alt alan adları test ediliyor...\033[0m"
        for sub in www mail blog dev api ftp secure ns; do
            host $sub.$subdom > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                echo -e "\033[1;32m[+] Bulundu:\033[0m $sub.$subdom"
            fi
        done
        echo ""
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh
        ;;
    10)
        echo -e "\033[0;34m--- Sistem Analiz Raporu ---\033[0m"
        echo "İşletim Sistemi: $(uname -o)"
        echo "Çekirdek Sürümü: $(uname -r)"
        echo "Mimari         : $(uname -m)"
        echo "Çalışma Süresi : $(uptime -p)"
        echo ""
        read -p "Devam etmek için Enter'a bas..."
        bash qaro.sh
        ;;
    11) 
        clear
        echo -e "\033

