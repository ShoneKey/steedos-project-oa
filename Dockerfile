FROM node:12.16.3

ADD . /app

WORKDIR /app

RUN npm config set registry http://registry.npm.taobao.org/ \
    && yarn config set registry https://registry.npm.taobao.org/ \
    && export NODE_TLS_REJECT_UNAUTHORIZED=0 \
    && yarn config set "strict-ssl" false \
    && yarn install --production 

ENV NODE_ENV=production

CMD ["yarn", "start"]
