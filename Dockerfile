FROM registry.cn-shenzhen.aliyuncs.com/zhouqi/nginx:1.4

ADD /bin/consul-template /usr/local/bin/consul-template

ADD /config/nginx.conf /etc/nginx/nginx.conf
ADD /config/nginx.conf.ctmpl /etc/nginx/nginx.conf.ctmpl

ADD startup.sh restart.sh /

RUN chmod u+x /startup.sh && \
    chmod u+x /restart.sh && \
    chmod u+x /usr/local/bin/consul-template

WORKDIR /

EXPOSE 80 443

CMD ["/startup.sh"]
