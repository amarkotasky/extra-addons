FROM mhart/alpine-node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
RUN apk update && \
    apk add git
    
RUN   apk add ca-certificates wget \                                                                                                                                                                                                      
  &&   update-ca-certificates      
RUN git clone https://github.com/creationix/nvm.git ~/.nvm
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .
RUN chmod -R 777 zivame_start.sh
EXPOSE 8000 8003
ENTRYPOINT ["/bin/sh","zivame_start.sh"]
CMD []
