#!/bin/bash

interface="Wi-Fi"
ip_address="<Your_IP_Address>"
subnet_mask="<Your_Mask>"
gateway_address="<Your_Gateway_Address>"
dns_server_manual="<Your_DNS_Address>"

if networksetup -getinfo "$interface" | grep "DHCP" > /dev/null; then
    echo "Switching $interface to manual configuration..."
    sudo networksetup -setmanual "$interface" $ip_address $subnet_mask $gateway_address
    sudo networksetup -setdnsservers "$interface" $dns_server_manual
    echo "Manual configuration set with DNS server $dns_server_manual."
else
    echo "Switching $interface to DHCP configuration..."
    sudo networksetup -setdhcp "$interface"
    sudo networksetup -setdnsservers Wi-Fi empty
    echo "DHCP configuration set."
fi

exit