FROM nginx

COPY ./Fonix-Webapp/ /usr/share/nginx/html

RUN chown -R nginx:nginx /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
EXPOSE 443