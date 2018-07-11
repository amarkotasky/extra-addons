#!/bin/bash

###################################################################################################
######                               Set enviornment variables
###################################################################################################
chmod -R 777 environment.sh
. environment.sh

echo ". environment.sh" >> ~/.bashrc \
&& . ~/.bashrc

echo $INT_CDN_URI
###################################################################################################
######                                    Set .nvm
###################################################################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use $1

if [ $? == 0 ] ;then echo "Already Installed Node $1";else echo "Installing Node $1";nvm install $1 && nvm use $1;fi

# nvm use $1
node -v
npm --version

###################################################################################################
#####                                    Update NPM
###################################################################################################
npm update

if [ $? == 0 ] ;then echo "Npm Updated Successfully";else echo "Npm Update Failed !!!!";fi

###################################################################################################
######                                Starting Node Server
###################################################################################################
echo "Starting Server"
npm install nodemon --save
npm start
