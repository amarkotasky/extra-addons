#!/bin/bash

###################################################################################################
######                               Set enviornment variables
###################################################################################################
chmod -R 777 environment.sh

echo ". environment.sh" >> ~/.bashrc \
&& . ~/.bashrc
. environment.sh
echo $INT_CDN_URI

export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 
###################################################################################################
######                             Check Node & Npm Version
###################################################################################################
nvm install 8.4.0
nvm use 8.4.0
node -v
npm --version

###################################################################################################
######                                Starting Node Server
###################################################################################################
echo "Starting Server"
npm install -g nodemon
# npm install nodemon --save
# npm run startDev
nodemon --trace-warnings server.js
