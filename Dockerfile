FROM    centos:centos6
 
MAINTAINER Yohan Morales yohmor@eltiempo.com

#Installing nginx

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum install -y nginx

RUN ldconfig

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

#CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf

#Installing php-fpm
RUN yum -y install php  php-fpm php-mbstring php-mysql php-gd && yum clean all
RUN sed -e 's/127.0.0.1:9000/9000/' \
        -e '/allowed_clients/d' \
        -e '/catch_workers_output/s/^;//' \
        -e '/error_log/d' \
        -i /etc/php-fpm.d/www.conf

EXPOSE 9000
CMD /usr/sbin/php-fpm --nodaemonize

ENTRYPOINT /usr/sbin/nginx -c /etc/nginx/nginx.conf
