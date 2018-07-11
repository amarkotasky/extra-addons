
FROM node:8
ARG version
# ENV var=${var}

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN apt-get update   
RUN git clone https://github.com/creationix/nvm.git ~/.nvm
RUN echo ". ~/.nvm/nvm.sh" >> ~/.bashrc \
           && .  ~/.bashrc
# If you are building your code for production

RUN . ~/.nvm/nvm.sh \
      && nvm --version \
      && nvm install ${version}

RUN . ~/.nvm/nvm.sh \
       && nvm use ${version} \
       && node -v \
       && npm install

# Bundle app source
COPY . .
RUN chmod -R 777 zivame_start.sh
EXPOSE 8000 8003


ENTRYPOINT ["tail", "-f", "/dev/null"]
# ENTRYPOINT ["/bin/sh","zivame_start.sh"]
CMD []
