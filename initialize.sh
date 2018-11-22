#!/bin/bash

########### PREREQUISITES
# 1. on Windows the best is to use the W10 Linux subsystem (WSL)
#    you need to active W10 developer features and go to OS functionalities
# 2. you need to have Docker for Windows installed
###########

########### WARNING
# Run the script as root or with sudo
###########


# Install .NET tools for WSL
# see: https://www.microsoft.com/net/download/linux-package-manager/ubuntu18-04/runtime-2.1.1
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
add-apt-repository universe
apt-get install apt-transport-https
apt-get update
apt-get install aspnetcore-runtime-2.1
apt-get install dotnet-sdk-2.1

# Then to be able to execute Windows docker daemon from WSL
ln -s '/mnt/c/Program Files/Docker/Docker/resources/bin/docker.exe' /usr/local/bin/docker
