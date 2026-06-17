#!/bin/bash
clear

echo -e "\033[0;32m ██████╗  █████╗ ██████╗  ██████╗ "
echo -e "██╔═══██╗██╔══██╗██╔══██╗██╔═══██╗"
echo -e "██║   ██║███████║██████╔╝██║   ██║"
echo -e "██║   ██║██╔══██║██╔══██╗██║   ██║"
echo -e "╚██████╔╝██║  ██║██║  ██║╚██████╔╝"
echo -e " ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ \033[0m"
echo -e " ─────────────────────────────────────────────────────────────"
echo -e "  \033[0;34m[+] Geliştirici: \033[1;37milhamXqaro\033[0m          \033[0;32m[ Sürüm: v2.5 ]\033[0m"
echo -e " ─────────────────────────────────────────────────────────────"

echo -e "\033[1;37m[1]\033[0m Hedef Sistem Port Tara"
echo -e "\033[1;37m[2]\033[0m Dış IP Detaylı Konum/ISP"
echo -e "\033[1;37m[3]\033[0m Ağ İçi Aktif Cihazlar"
echo -e "\033[1;37m[4]\033[0m Kendi IP Bilgisi"
echo -e "\033[1;37m[5]\033[0m Hedef WHOIS"
echo -e "\033[1;37m[6]\033[0m Kullanıcı Adı Avcısı"
echo -e "\033[1;37m[7]\033[0m Web Admin Panel Sızma"
echo -e "\033[1;37m[8]\033[0m Sevgiliye Özel Sürpriz (Animasyonlu & Dev Kalp)"
echo -e "\033[1;37m[9]\033[0m Çıkış"
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
        clear
        echo -e "\033[1;31m" # Parlak kırmızı kalp rengi
        
        # İstediğin o satır satır süreli inen devasa kalp efekti
        echo "         ****** ****** "; sleep 0.4
        echo "       ********** ********** "; sleep 0.4
        echo "     ************* ************* "; sleep 0.4
        echo "     *************************** "; sleep 0.4
        echo "      ************************* "; sleep 0.4
        echo "        ********************* "; sleep 0.4
        echo "          ***************** "; sleep 0.4
        echo "            ************* "; sleep 0.4
        echo "              ********* "; sleep 0.4
        echo "                ***** "; sleep 0.4
        echo "                  * "; sleep 0.4
        
        echo -e "\033[0m"
        echo ""
        
        # Harf harf akan turkuaz renkli yazı
        echo -e -n "\033[1;36m"
        mesaj="  >> Kodların arasında siber dünyayı tararken bile sadece sen varsın... <3 <<"
        for ((i=0; i<${#mesaj}; i++)); do 
            echo -n "${mesaj:$i:1}"
            sleep 0.05
        done
        echo -e "\033[0m"
        echo ""
        echo ""
        read -p "Menüye dönmek için Enter'a bas..."
        bash qaro.sh 
        ;;
    9) 
        # İstediğin o şık veda ve iyi günler mesajı
        echo -e "\033[0;33m"
        echo " ─────────────────────────────────────────────────────────────"
        echo "  Görüşürüz ortak, siber dünyada kendine iyi bak! "
        echo "  İyi günler dilerim. "
        echo " ─────────────────────────────────────────────────────────────"
        echo -e "\033[0m"
        exit 0 
        ;;
    *) 
        bash qaro.sh 
        ;;
esac
