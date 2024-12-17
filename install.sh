#!/bin/bash

# Script to install common hacking tools on Ubuntu
# Author: [Your Name]
# Description: Automates installation of popular hacking tools for penetration testing and security research.

# --- Functions ---
update_system() {
    echo -e "[+] Updating and upgrading system packages...\n"
    sudo apt update && sudo apt upgrade -y
}

install_package() {
    PACKAGE_NAME=$1
    COMMAND_CHECK=$2
    INSTALL_CMD=$3

    if ! command -v $COMMAND_CHECK &> /dev/null; then
        echo -e "[+] Installing $PACKAGE_NAME...\n"
        eval $INSTALL_CMD
    else
        echo -e "[-] $PACKAGE_NAME is already installed. Skipping...\n"
    fi
}

install_git_tool() {
    REPO_URL=$1
    TOOL_NAME=$2
    INSTALL_DIR=$3

    if [ ! -d "$INSTALL_DIR" ]; then
        echo -e "[+] Cloning and setting up $TOOL_NAME...\n"
        git clone $REPO_URL $INSTALL_DIR
        echo -e "[+] $TOOL_NAME installed successfully.\n"
    else
        echo -e "[-] $TOOL_NAME already exists. Skipping...\n"
    fi
}

# --- Installations ---
update_system

# Install Basic Tools
install_package "Git" "git" "sudo apt install git -y"
install_package "Curl" "curl" "sudo apt install curl -y"
install_package "Wget" "wget" "sudo apt install wget -y"
install_package "Build Essentials" "gcc" "sudo apt install build-essential -y"
install_package "Python3" "python3" "sudo apt install python3 python3-pip -y"

# Networking Tools
install_package "Nmap" "nmap" "sudo apt install nmap -y"
install_package "Netcat" "nc" "sudo apt install netcat -y"
install_package "Wireshark" "wireshark" "sudo apt install wireshark -y"
install_package "TCPDump" "tcpdump" "sudo apt install tcpdump -y"
install_package "Masscan" "masscan" "sudo apt install masscan -y"
install_package "Fping" "fping" "sudo apt install fping -y"

# Web Application Tools
install_package "SQLMap" "sqlmap" "sudo apt install sqlmap -y"
install_package "WhatWeb" "whatweb" "sudo apt install whatweb -y"
install_package "Gobuster" "gobuster" "sudo apt install gobuster -y"
install_package "Nikto" "nikto" "sudo apt install nikto -y"
install_package "Wafw00f" "wafw00f" "sudo apt install wafw00f -y"
install_package "Sublist3r" "sublist3r" "pip3 install sublist3r"
install_package "Dirb" "dirb" "sudo apt install dirb -y"
install_package "ffuf" "ffuf" "sudo apt install ffuf -y"

# Password Cracking Tools
install_package "John the Ripper" "john" "sudo apt install john -y"
install_package "Hydra" "hydra" "sudo apt install hydra -y"
install_package "Hashcat" "hashcat" "sudo apt install hashcat -y"

# Wireless Tools
install_package "Aircrack-ng" "aircrack-ng" "sudo apt install aircrack-ng -y"
install_package "Reaver" "reaver" "sudo apt install reaver -y"
install_package "Kismet" "kismet" "sudo apt install kismet -y"

# Reconnaissance Tools
install_git_tool "https://github.com/laramies/theHarvester.git" "theHarvester" "/opt/theHarvester"
install_git_tool "https://github.com/vulnersCom/nmap-vulners.git" "nmap-vulners" "/opt/nmap-vulners"
install_git_tool "https://github.com/s0md3v/Photon.git" "Photon" "/opt/Photon"
install_git_tool "https://github.com/maurosoria/dirsearch.git" "Dirsearch" "/opt/dirsearch"

# Exploitation Tools
install_git_tool "https://github.com/rapid7/metasploit-framework.git" "Metasploit" "/opt/metasploit-framework"
install_git_tool "https://github.com/rebootuser/LinEnum.git" "LinEnum" "/opt/LinEnum"
install_git_tool "https://github.com/carlospolop/PEASS-ng.git" "PEASS-ng" "/opt/PEASS-ng"

# Post Exploitation Tools
install_git_tool "https://github.com/AlessandroZ/LaZagne.git" "LaZagne" "/opt/LaZagne"
install_git_tool "https://github.com/PowerShellMafia/PowerSploit.git" "PowerSploit" "/opt/PowerSploit"

# Clean up and Finish
echo -e "\n[+] Cleaning up...\n"
sudo apt autoremove -y

echo -e "\n[+] All tools installed successfully! Happy Hacking!\n"
