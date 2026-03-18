FROM nginx:alpine
COPY app/ /var/www/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80