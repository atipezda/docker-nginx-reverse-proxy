#!/bin/bash
#while true; do
echo "ENTRYPOINT HOSTS"
HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN >/dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo "needs to be manually resolved"
  sed -i "s/localhost/$HOST_IP/g"  /etc/nginx/templates/default.conf.template
  else
  sed -i "s/localhost/$HOST_DOMAIN/g"  /etc/nginx/templates/default.conf.template
fi
#done
