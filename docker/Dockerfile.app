from node:22-bookworm

run apt-get update && apt-get upgrade -y && \
    apt install -y net-tools sudo gosu && \
    npm install -g npm@latest

user node

env SITE=/home/node/site
run mkdir $SITE
workdir $SITE
volume $SITE

expose 8000/tcp
