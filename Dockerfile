FROM node:6.11.5

# Install app dependencies
RUN mkdir /build-dir
WORKDIR /build-dir
COPY package.json /build-dir
#RUN npm install -g babel babel-runtime babel-register mocha nodemon
RUN npm install

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN cp -r /build-dir/node_modules node_modules

# Bundle app source
COPY . /usr/src/app

EXPOSE 1234
CMD [ "npm", "start" ]
