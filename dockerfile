FROM ubuntu
ARG version
# ENV var=${var}

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies

COPY package*.json ./

EXPOSE 8007 8003

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
       
VOLUME ["/usr/src/app/app/log"]

COPY . .

RUN chmod +x zivame_start.sh

RUN . ~/.bashrc \
    && nvm use ${version} \
    && npm install pm2 -g

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash","zivame_start.sh"]
