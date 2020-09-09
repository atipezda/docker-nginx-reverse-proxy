FROM nginx:latest
RUN apt-get update && apt-get install -y \
    iputils-ping \
    iproute2 \
    curl
COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN /usr/local/bin/docker-entrypoint.sh
CMD ["nginx", "-g", "daemon off;"]
