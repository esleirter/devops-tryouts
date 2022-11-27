FROM    node:19.1.0-alpine3.16
ARG     ENV
ENV     NODE_ENV $ENV
WORKDIR /app
COPY    ["app/package.json", "app/package-lock.json*", "./"]
RUN     npm install --production
COPY    ./app .
CMD     [ "npm", "start" ]