#!/bin/bash

###################################################################################################
######                               Set enviornment variables
###################################################################################################
chmod -R 777 environment.sh
chmod -R 777 stageEnv.sh


if [ "$1" == "Devel"  ]; then
   echo ". environment.sh" >> ~/.bashrc \
   && . ~/.bashrc
   . environment.sh
   echo $INT_APP_Env
else
   echo ". stageEnv.sh" >> ~/.bashrc \
   && . ~/.bashrc
   . stageEnv.sh
   echo $INT_APP_Env
fi


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
# npm install -g nodemon
# npm install nodemon --save
# npm run startDev
# nodemon --trace-warnings server.js
# pm2 start server.js
pm2_home=$(which pm2);
cwd=$(pwd)

if [ "$INT_APP_Env" == "Devel"  ]; then
   start-stop-daemon --start --chuid root -n zivapp --start --exec /root/.nvm/versions/node/v8.4.0/bin/pm2 -- start $cwd/process.json --only Devel --update-env
else
   start-stop-daemon --start --chuid root -n zivapp --start --exec /root/.nvm/versions/node/v8.4.0/bin/pm2 -- start $cwd/process.json --only Stage --update-env
fi
sleep infinity
