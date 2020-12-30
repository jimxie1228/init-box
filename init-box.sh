#!/bin/bash 
# This is a bash script. There should be a bash shell available on the box

# --------------Git Access--------------
# Description: configure ssh access to jimxie@umich.edu
# Dependencies: ssh-keygen
#               ssh-agent
#               
echo '================Configuring Git Aceess================'
if [ ! -d "~/.ssh" ] 
then
    mkdir ~/.ssh
fi
ssh-keygen -t rsa -b 4096 -C "jimxie@umich.edu" -f ~/.ssh/jimxie_ssh_id
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/jimxie_ssh_id

# add ssh-key to github account
echo
echo 'Downloading xclip'
sudo apt-get install xclip
xclip -selection clipboard < ~/.ssh/jimxie_ssh_id.pub
echo
echo 'SSH key copied onto the clipboard'
echo 'Add ssh public key to github account following steps:'
echo '1. Go to github account -> Settings'
echo '2. In sidebar -> SSH and GPG keys'
echo '3. Click New SSH key or Add SSH key'
echo '4. Add a descriptive label/title for the ssh key'
echo '5. Paste key into Key field'
echo '6. Click Add SSH key'
echo '7. If prompted, enter github password'

read -p "Please add the ssh key. Done? (y/n)" -n 1 -r
echo
while [[ ! $REPLY =~ ^[Yy]$ ]]
do
    read -p "Please add the ssh key. Done? (y/n)" -n 1 -r
    echo
done
