#!/bin/bash
function menu()
{
echo "---------------MENU-----------------"
echo "1. Tat firewall ufw"
echo "2. Allow port "
echo "3. Allow IP"
echo "4. Deny Ip"
echo "5. Deny Port"
echo "6. Xoa Rule"
echo "7. Thoat"
echo -n "Moi ban nhap lua chon:"
}

#if [ $number -eq 1 ]
#then
#        disable=sudo systemctl stop ufw && sudo systemctl disable ufw
#        echo `$disable`	
#elif [ $number -eq 2 ]
#then
#        echo -n "Nhap port:"
#        read number
#        allowport= iptables -A INPUT -p tcp -m tcp --dport $number -j ACCEPT
#        echo `$allowport`
#fi

while (true)
do
	menu
	read number
	if [ $number == 7 ]
	then 
		break
	elif [ $number == 1 ]
	then 
		disable=sudo systemctl stop ufw && sudo systemctl disable ufw
	        echo `$disable`
	elif [ $number == 2 ]
	then
		echo -n "Nhap port:"
		read number
		allowport= iptables -A INPUT -p tcp -m tcp --dport $number -j ACCEPT
	        echo `$allowport`
	elif [ $number == 3 ]
	then
		echo -n "nhap ip:"
		read number
		allowip= iptables -A INPUT -s $number -j ACCEPT
		echo `$allowip`
	elif [ $number == 4 ]
	then
		echo -n "Nhap ip:"
		read number
		denyip= iptables -I INPUT -s $number -j DROP
		echo `$denyip`
	elif [ $number == 5 ]
	then
		echo -n "Nhap port"
		read number
		denyport= iptables -A INPUT -p tcp --dport $number -j DROP
		echo `$denyport`
	elif [ $number == 6 ]
	then
		rule= iptables -L -n --line-numbers
		echo -n "Nhap rule can xoa:"
		read number
		delrule= iptables -D INPUT $number
		echo `$delrule`
	fi
done

