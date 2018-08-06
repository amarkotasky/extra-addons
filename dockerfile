FROM ubuntu
ARG version
# ENV var=${var}

# Create app directory
WORKDIR /home/ubuntu/newstack

# Install app dependencies

COPY package*.json ./

EXPOSE 8000 8003

RUN apt-get update \
    && apt-get install -y wget

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 


# If you are building your code for production

RUN . ~/.bashrc \
    && nvm install ${version} 

# Bundle app source


RUN . ~/.bashrc \
    && nvm use ${version} \
    && npm update 
       
VOLUME ["/home/ubuntu/newstack/app/log", "/mnt/node-logs/log"]


RUN . ~/.bashrc \
    && nvm use ${version} \
    && npm install pm2 -g \
    && npm install -g nodemon

COPY . .

RUN chmod +x zivame_start.sh

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash","zivame_start.sh"]
