#!/bin/bash

echo "Termux Quick Setup"
echo "by Myon"
echo "Upgrading packages... please wait"
pkg update
pkg upgrade

read -p "Do you want to install recommended packages? (y/n): " choice

if [ "$choice" = "y" ]; then                      # commands
  echo "Installing... please wait"
  pkg install wget git vim proot
  echo "Please grant storage access"
  termux-setup-storage
  echo "Completed!"
else
  echo "Canceled."
fi
read -p "if you need access termux from PC, install ssh?" secureshellchoice

if [ "$secureshellchoice" = "y" ]; then
echo "Installing SSH... please wait"
pkg install openssh iproute2
echo "SSH installed."
else
echo "SSH not installed."
fi
read -p "Do you want to install Ubuntu?(y/n): " ubuntuchoice
if [ "$ubuntuchoice" = "y" ]; then
echo "Installing Ubuntu... please wait"
cd ~
git clone https://github.com/MFDGaming/ubuntu-in-termux.git
cd ubuntu-in-termux
chmod +x ubuntu.sh
./ubuntu.sh -y
echo "Ubuntu installed."
echo "cd ubuntu-in-termux and"
echo "./startubuntu.sh to start Ubuntu."
else
echo "Ubuntu not installed."
fi
echo "All set!"