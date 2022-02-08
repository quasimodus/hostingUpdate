#!/bin/bash

# variables
c=15  # connection time
p=15  # preparing time update
u=100 # update time

# Enter URL  ========================
echo -e "\033[36m"
read -p "Enter URL:  " ServerUrl
echo -en "\033[0m\n"

# ping ==========================

while ! ping -c1 $ServerUrl &>/dev/null
do    
    echo -en "\033[37;1;31m ---> Host not Found - `date` \033[0m\n\n\n"
    exit 1
done

echo -en "\033[37;32m ---> Host Found - `date` \033[0m\n"

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

echo -ne "\n\033[37;32m ---> Done \033[0m\n"
sleep 1

# Preparing Update ===================
echo -e "\n\033[36m"
echo 'Preparing Update:'
j=1
sp="/-\|"

while [ $j -lt $p ]
do
    printf "\b${sp:j++%${#sp}:1}"
    sleep .5
done

echo -ne '\n'
echo -ne "\033[37;32m ---> Done \033[0m\n\n\n"
sleep 1

# Update =============================
i=1
sp="▇"
echo -ne '\033[37;36m Update... \n'
echo -n '|'

for ((i=1; i < $u;i++))
do
    printf "${sp%${#sp}:1}"
    sleep .05
done
echo -en "\033[0m\n"
echo -ne "\n\033[37;1;5;31m ---> Ну нафик, лучше к Лёне!!! \033[0m\n\n\n"

# end