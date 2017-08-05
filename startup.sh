#!/bin/bash
NGINX=/usr/sbin/nginx
NGINX_CONF=/etc/nginx/nginx.conf
NGINX_TEMPLATE=/etc/nginx/nginx.conf.ctmpl
RESTART_COMMAND=/restart.sh

# start nginx with default setting
${NGINX} -c ${NGINX_CONF} -t && \
	${NGINX} -c ${NGINX_CONF} -g "daemon on;"

# start consul-template
consul-template \
    -consul-addr ${CONSUL_ADDR} \
    -log-level ${LOG_LEVEL:warn} \
    -template "${NGINX_TEMPLATE}:${NGINX_CONF}:${RESTART_COMMAND} || true" \
