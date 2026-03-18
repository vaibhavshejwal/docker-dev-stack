FROM nginx:alpine
COPY app/ /var/www/html/
EXPOSE 80