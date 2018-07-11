
FROM node:8
ARG version
# ENV var=${var}

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./

# RUN apt-get update   
RUN git clone https://github.com/creationix/nvm.git ~/.nvm
RUN echo ". ~/.nvm/nvm.sh" >> ~/.bashrc \
           && .  ~/.bashrc
# If you are building your code for production

RUN . ~/.nvm/nvm.sh \
      && nvm --version \
      && nvm install ${version}

# Bundle app source
COPY . .

RUN . ~/.nvm/nvm.sh \
       && nvm use ${version} \
       && node -v \
       && npm update 
       
RUN chmod -R 777 zivame_start.sh
EXPOSE 8007 8003


# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash","zivame_start.sh"]
CMD []
