#!/bin/bash

echo "Termux Quick Setup"
echo "by Myon"
echo "Upgrading packages... please wait"
pkg update
pkg upgrade

read -p "Do you want to install recommended packages? (y/n): " choice

if [ "$choice" = "y" ]; then
  # commands
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
echo "All set!"
