---
title: Build Nextcloud Server on Centos 7.5
date: 2020-06-16 15:43:54
categories:
- tech
tags:
- docker
- php
- nginx
---

Nextcloud is an open-source software project coded with PHP. It had provided a ideal private cloud-storage solution which was considered to be reliable and stable. This blog aims to present a Nextcloud Building instruction step by step for the purpose of helping freshman and future reviewing. Nextcloud is an open-source software project coded with PHP. It had provided a ideal private cloud-storage solution which was considered to be reliable and stable. This blog aims to present a Nextcloud Building instruction step by step for the purpose of helping freshman and future reviewing. Nextcloud is an open-source software project coded with PHP. It had provided a ideal private cloud-storage solution which was considered to be reliable and stable. This blog aims to present a Nextcloud Building instruction step by step for the purpose of helping freshman and future reviewing.


<!-- more -->

## Change linux core to BBR vision


If your server is a new one, it is strongly recommended to update it to an upper version supporting bbr mode, which is a senior centos system core provide by google and it could make your server more efficient.

Firstly download and install bbr core from github.
```bash
    $ wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh &&\
    $ chmod +x bbr.sh && \
    $ bash bbr.sh
```
Use the code to check the core version. If it’s large than 4.9.0 it’s OK.
```bash
    $ uname -r
```
Expected return:net.ipv4.tcp_available_congestion_control = bbr cubic reno
```bash
    $ sysctl net.ipv4.tcp_available_congestion_control
```
Expected return: net.ipv4.tcp_congestion_control = bbr
```bash
    $ sysctl net.ipv4.tcp_congestion_control
```
Expected return: net.core.default_qdisc = fq
```bash
    $ sysctl net.core.default_qdisc
```
Expected return: xxxxxxxx tcp_bbr
```bash
     $ lsmod | grep bbr
```

## Install Nginx Service


Pull nginx package from nginx orginzation website.
```bash
    rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
```
Install Nginx.
```bash
    $ yum install -y nginx
```
Start nginx service.
```bash
    $ systemctl start nginx.service
    $ systemctl enable nginx.service
```

Set preference file of nginx. Click here to get recommended nginx.conf file.
```bash
    $ cd /etc/nginx
    $ vi nginx.conf
```
Apply ssl certification. Rename it with your_domain.crt(key) and download it to your server: /etc/nginx/ssl/
```bash
    $ //Use scp -r (my ssl file route on my windows)/your_domain.crt \root@(your server ip): /etc/nginx/ssl
    $ //Use scp -r (my ssl file route on my windows)/your_domain.crt root@(your server ip): /etc/nginx/ssl
    $ //On WINDOWS BASH
```
Check and restart nginx service.
```bash
    $ nginx -t

    $ //If the return is successful it is ok, othervise there exists error in your nginx.conf file. 
    $ systemctl restart nginx
```
## Install docker


Pull and install docker service from official website.
```bash
    $ curl -sSL https://get.docker.com/ | sh
```
Start docker service.
```bash
    $ systemctl start docker
    $ systemctl enable docker.service
```
Pull nextcloud and mariadb(simplified mysql database on centos ) images from github.
```bash
    $ docker pull rootlogin/nextcloud && docker pull mariadb:10
```
Start image mariadb with docker.
```bash
    $ docker run -d --name nextcloud_db -v /data/mysql:/var/lib/mysql -e \
    $ MYSQL_ROOT_PASSWORD=YOUR_PASSWD -e MYSQL_DATABASE=nextcloud \
    $ -e MYSQL_USER=nextcloud -e MYSQL_PASSWORD=YOURPASSWD mariadb:10
```
Start image nextcloud with docker.
```bash
    $ docker run -d --name nextcloud --link nextcloud_db:nextcloud_db -p 127.0.0.1:9001:80 -v /data/nextcloud:/data rootlogin/nextcloud
```
That is the last step on server. Now let’s start http://YOUR_DOMAIN/ with your explorer.

Recommend to substitute the “localhost” to “nextcloud_db”.

-------------

Reference List:
[https://www.moerats.com/archives/420/][1]
[https://my.oschina.net/yule526751/blog/799004][2]
[https://www.moerats.com/archives/420/][3]


  [1]: https://www.moerats.com/archives/420/
  [2]: https://my.oschina.net/yule526751/blog/799004
  [3]: https://www.moerats.com/archives/420/