#!/bin/bash

# Make sure root

if [ $(id -u) != 0 ]; then
  printf "\e[1;41mHi! Please run as root!\e[0m\n"
  exit 1
fi

if [ $# != 2 ]; then
  printf "\n\t\e[1;41mUsage: ./get_fingerprint.sh <server_username> <server_ip_address>\e[0m\n"
  printf "\t\e[1;41mExample: ./get_fingerprint.sh admin 192.168.1.1\e[0m\n\n"
  exit 1
fi

# Make sure paramemters are there

finger_file=fingerprint.txt
inventory_file=/etc/ansible/hosts
payload_temp=fingerpaint.sh
payload="finger_file=fingerprint.txt\napi fingerprint | grep SHA1 | cut -c 7- > \$finger_file\necho -e \"fingerprint=\$(cat \$finger_file)\" > \$finger_file"

echo -e $payload > $payload_temp

# Run payload on mgmt server

cat $payload_temp | ssh $1@$2 "bash -"

# get fingerprint 

scp $1@$2:$finger_file .
rm $payload_temp
ssh -t $1@$2 "rm $finger_file"

# move contents to inventory file
cat -v $finger_file >> $inventory_file

# Inform that fingerprint.txt exists and has been copied to inventory
printf "\e[1;28m$finger_file has been made!\e[0m\n"
printf "\e[1;28mContents of $finger_file has been appended to $inventory_file\e[0m\n"
echo "Have a great day!"

