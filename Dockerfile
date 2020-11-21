FROM node:alpine as builder 

WORKDIR /app

COPY package.json /app

RUN yarn install && yarn cache clean

COPY . /app 
 
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html