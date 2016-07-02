FROM node:4
MAINTAINER patdohere

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY quakejs /usr/src/app
RUN npm install


# Web
# EXPOSE 8080
# ENV QJS_WEB_CONFIG="./web.json"
# CMD node bin/web.js --config $QJS_WEB_CONFIG

# Server
EXPOSE 27960
ENV QJS_FS_GAME="baseq3"
ENV QJS_DEDICATED="1"
ENV QJS_SERVER_CONFIG="server.cfg"

CMD node build/ioq3ded.js +set $QJS_FS_GAME +set $QJS_DEDICATED +exec $QJS_SERVER_CONFIG

# Content
# ENV QJS_ASSETS=""

# http://192.168.99.100:8080/play?connect%20192.168.99.100:27960
