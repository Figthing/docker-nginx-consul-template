# docker-nginx-consul-template

服务器内部Docker

采用 consul 可进行自动实现，Docker的发现与注册

使用 consul-template 可以发现服务上的IP，并自动结合Nginx制作成为反向代理模式。

部署不需要任何操作，自动完成。

### 运行实例
```
    
    nginx-proxy：  
      image:  
        registry.cn-shenzhen.aliyuncs.com/zhouqi/consul-template:1.2 
      volumes: 
        - /htdocs/nginx-proxy/:/etc/nginx/conf.d/ 
      ports:
        - "80:80"
      environment:
        - SERVICE_NAME=nginx-proxy
        - 'CONSUL_ADDR=20.0.0.60:8500'
        - LOG_LEVEL=DEBUG
      depends_on:
        - "consul-server-node1"
      container_name:
        nginx-proxy
    www_cqappwb_com:
      image:
        registry-vpc.cn-shenzhen.aliyuncs.com/zhouqi/nginx:1.4
      volumes_from:
        - container:wwwroot
      volumes:
        - /dev/shm/wwwroot/cqappwb/www_cqappwb_com/nginx/nginx.conf:/etc/nginx/conf.d/default.conf
      external_links:
        - php7:php
      container_name:
        www_cqappwb_com
      environment:
        - 'SERVICE_NAME=www_cqappwb_com'
        - 'SERVICE_TAGS="domain":"www.cqappwb.com"'
    
```
