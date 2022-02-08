#!/bin/bash

# variables
c=15  # connection time
p=15  # preparing time update
u=100 # update time

# Enter URL  ========================
echo -e "\033[32m\033[1m"
echo "Enter URL: "
echo -e "\033[0m"


read -p "Enter URL: " ServerUrl


# check url ==========================

# ping ==========================
while ! ping -c1 $ServerUrl &>/dev/null
do    
    echo -e "\033[31m\033[1m"
    echo "  Host not Found - `date`"
    echo -e "\033[0m"
    exit 1
done
echo -e "\033[36m\033[1m"
echo "Host Found - `date`"
echo -e "\033[0m"


# Connection ========================
echo -e "\n\033[36m"
echo "Connection to:   ${ServerUrl}"

# Connection progress bar
j=1
sp="/-\|"
echo -n ' '
while [ $j -lt $c ]
do
    printf "\b${sp:j++%${#sp}:1}"
    sleep .5
done
echo -e "\033[32m\033[1m"
echo "...Done"
echo -e "\033[0m"
sleep 1

# Preparing Update ===================
echo -e "\n\033[36m"
echo 'Preparing Update...'
j=1
sp="/-\|"

while [ $j -lt $p ]
do
    printf "\b${sp:j++%${#sp}:1}"
    sleep .5
done
echo -e "\033[32m\033[1m"
echo "...Done"
echo -e "\033[0m"

sleep 1

# Update =============================
i=1
sp="▇"
echo -e "\n\033[36m"
echo 'Update...'
echo -n '|'

for ((i=1; i < $u;i++))
do
    printf "${sp%${#sp}:1}"
    sleep .05
done

echo -ne '\n'
echo -e "\033[31m\033[1m\033[5m"
echo " -Ну нафик, лучше к Лёне!!!"
echo -e "\033[0m"
#echo -ne '***************************'
echo -ne '\n'