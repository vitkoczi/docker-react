#
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80 #need for aws elasticbeanstalk only
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx start the serve


