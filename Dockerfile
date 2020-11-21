FROM node:alpine as builder
WORKDIR "/app"

COPY package*.json ./
RUN yarn install 
COPY . .
RUN yarn build 

FROM nginx:1.15.2-alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
