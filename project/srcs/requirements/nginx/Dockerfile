FROM alpine:3.17
RUN	apk update && apk upgrade && apk add --no-cache nginx openssl 
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/caquinta.42.fr.key \
    -out /etc/nginx/ssl/caquinta.42.fr.crt -subj "/C=ES/L=URDULIZ/O=42/OU=caquinta/CN=caquinta.42.fr" -days 365
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
