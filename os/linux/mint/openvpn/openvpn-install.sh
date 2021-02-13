#!/bin/bash
#
# https://github.com/vitovts/openvpn-install
# CentOS8
# Copyright (c) 2020 VitovtS.

#  EPEL (Enterprise Linux) to Fedora Project
dnf install epel-release -y
dnf update -y

#disable selinux
sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux
sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config

#firewalld
#firewall-cmd --permanent --add-port=13026/udp
#firewall-cmd --reload

#install OpenVPN
dnf install openvpn easy-rsa -y

mkdir /var/log/openvpn/

#/etc/sysctl.conf net.ipv4.ip_forward = 1

# vim /etc/openvpn/client/tap28.conf

# systemctl enable (start&status) openvpn-client@tap28
