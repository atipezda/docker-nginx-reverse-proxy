FROM nginx:latest
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD /usr/local/bin/docker-entrypoint.sh
CMD ["nginx", "-g", "daemon off;"]
