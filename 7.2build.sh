#!/bin/bash
rm -fr /etc/udev/rules.d/*
service network  restart

hostnamectl set-hostname server7.2.example.com
#sed -i 's|11|11|' /etc/sysconfig/network
#echo -e 'HOSTNAME=server0.example.com' >/etc/sysconfig/network

#echo -e 'DEVICE=eth0\nONBOOT=yes\nBOOTPROTO=static\nIPADDR=192.168.122.100\nPREFIX=24\nGATEWAY=192.168.122.1' > /etc/sysconfig/network-scripts/ifcfg-eth0

#service network  restart

#rm -fr /etc/yum.repos.d/rhel-source.repo
#mkdir /etc/yum.repos.d && echo -e '[dvd]\nname=dvd\nbaseurl=http://192.168.122.1/rhel7.2\ngpgcheck=0' > /etc/yum.repos.d/dvd.repo

echo -e '[dvd]\nname=dvd\nbaseurl=http://192.168.122.1/rhel6.5\ngpgcheck=0' > /etc/yum.repos.d/dvd.repo

echo -e '127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4\n::1         localhost localhost.localdomain\nlocalhost6 localhost6.localdomain6\n192.168.122.101 server1.example.com\n192.168.122.102 server2.example.com\n192.168.122.103 server3.example.com\n192.168.122.104 server4.example.com\n192.168.122.105 server5.example.com\n192.168.122.106 server6.example.com\n192.168.122.107 server7.example.com\n192.168.122.108 server8.example.com\n192.168.122.109 server9.example.com\n192.168.122.110 server10.example.com\n192.168.122.111 server11.example.com\n192.168.122.112 server12.example.com\n192.168.122.1  foundation149.example.com'   > /etc/hosts


systemctl disable firewalld
systemctl stop firewalld
#/etc/init.d/iptables stop
#chkconfig iptables off

setenforce 0
sed -i  's|SELINUX=enforcing|SELINUX=disabled|' /etc/selinux/config 
#sed -i  's|timeout=5|timeout=1|' /boot/grub2/grub.cfg

yum install lftp openssh-clients expect rpm-build vim -y


#scp 192.168.122.1:~/.ssh/id_rsa.pub ~

#cat id_rsa_server >>~/.ssh/authorized_keys
#chmod 600 ~/.ssh/authorized_keys

