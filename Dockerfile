FROM node:10.18.0 AS builder 
WORKDIR /opt/front 
COPY . . 
RUN npm install
# RUN npm install react-scripts@latest --legacy-peer-deps
RUN npm run build:prod

FROM nginx 
WORKDIR /var/www/front 
COPY --from=builder /opt/front/dist/ . 
COPY nginx.conf /etc/nginx/
