FROM node:alpine as builder 

WORKDIR /app

COPY package.json /app

RUN yarn install && yarn cache clean

COPY . /app 
 
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html