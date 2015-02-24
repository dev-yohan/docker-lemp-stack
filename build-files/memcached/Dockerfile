FROM centos:centos6
MAINTAINER Yohan Morales <yohmor@eltiempo.com>
# Setup Memcached
RUN rpm -Uvh http://mirror.metrocast.net/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum update -y
RUN yum install -y memcached
# Port to expose *outside* the container
EXPOSE 11211
# Service to run
CMD /usr/bin/memcached -m 64 -p 11211 -c 4096 -b 4096 -t 2 -R 200 -n 72 -f 1.25 -u memcached -o slab_reassign slab_automove

