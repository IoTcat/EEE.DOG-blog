---
titleEN: Build Nextcloud Server on Centos 7.5
title: 在Centos 7.5上构建Nextcloud服务器
date: 2018-12-08
categories:
- tech
tags:
- docker
- php
- nginx
---


{% raw %}<span class=".zh">{% endraw %}
Nextcloud是一个用PHP编码的开源软件项目。 它提供了理想的私有云存储解决方案，该解决方案被认为是可靠且稳定的。 该博客旨在逐步介绍Nextcloud Building指导，以帮助新生和将来的复习。 Nextcloud是一个用PHP编码的开源软件项目。 它提供了理想的私有云存储解决方案，该解决方案被认为是可靠且稳定的。 该博客旨在逐步介绍Nextcloud Building指导，以帮助新生和将来的复习。 Nextcloud是一个用PHP编码的开源软件项目。 它提供了理想的私有云存储解决方案，该解决方案被认为是可靠且稳定的。 该博客旨在逐步介绍Nextcloud Building指导，以帮助新生和将来的复习。
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Nextcloud is an open-source software project coded with PHP. It had provided a ideal private cloud-storage solution which was considered to be reliable and stable. This blog aims to present a Nextcloud Building instruction step by step for the purpose of helping freshman and future reviewing. Nextcloud is an open-source software project coded with PHP. It had provided a ideal private cloud-storage solution which was considered to be reliable and stable. This blog aims to present a Nextcloud Building instruction step by step for the purpose of helping freshman and future reviewing. Nextcloud is an open-source software project coded with PHP. It had provided a ideal private cloud-storage solution which was considered to be reliable and stable. This blog aims to present a Nextcloud Building instruction step by step for the purpose of helping freshman and future reviewing.


{% raw %}</span>{% endraw %}


<!-- more -->

{% raw %}
<script>
    session.onload(function(){
        if(page.tran.getLang() == 'zh'){
            tips.warning({
                title: '注意',
                position: 'topRight',
                message: '此页面由机器翻译为中文!!',
                buttons: [['<button>查看原文</button>', function (instance, toast) {
                    page.tran.setLang('en');
                    instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
                }, true]]
            });
        }
    });
</script>
{% endraw %}


{% raw %}<span class=".zh">{% endraw %}

## 将linux核心更改为BBR愿景


如果您的服务器是新服务器，强烈建议将其更新到支持bbr模式的较高版本，这是google提供的高级centos系统核心，它可以使您的服务器更高效。

首先从github下载并安装bbr core。
```bash
    $ wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh &&\
    $ chmod +x bbr.sh && \
    $ bash bbr.sh
```
使用代码检查核心版本。 如果大于4.9.0，则可以。
```bash
    $ uname -r
```
预期显示:net.ipv4.tcp_available_congestion_control = bbr cubic reno
```bash
    $ sysctl net.ipv4.tcp_available_congestion_control
```
预期显示: net.ipv4.tcp_congestion_control = bbr
```bash
    $ sysctl net.ipv4.tcp_congestion_control
```
预期显示: net.core.default_qdisc = fq
```bash
    $ sysctl net.core.default_qdisc
```
预期显示: xxxxxxxx tcp_bbr
```bash
     $ lsmod | grep bbr
```

##安装Nginx服务


从nginx组织网站上提取nginx软件包。
```bash
    rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
```
安装 Nginx.
```bash
    $ yum install -y nginx
```
启动 nginx .
```bash
    $ systemctl start nginx.service
    $ systemctl enable nginx.service
```

设置nginx的首选项文件。 单击此处以获取推荐的nginx.conf文件。
```bash
    $ cd /etc/nginx
    $ vi nginx.conf
```
申请ssl认证。 用your_domain.crt（key）重命名并将其下载到服务器：/ etc / nginx / ssl /
```bash
    $ //Use scp -r (my ssl file route on my windows)/your_domain.crt \root@(your server ip): /etc/nginx/ssl
    $ //Use scp -r (my ssl file route on my windows)/your_domain.crt root@(your server ip): /etc/nginx/ssl
    $ //On WINDOWS BASH
```
检查并重新启动Nginx服务。
```bash
    $ nginx -t

    $ //If the return is successful it is ok, othervise there exists error in your nginx.conf file. 
    $ systemctl restart nginx
```
##安装docker


从官方网站拉并安装docker服务。
```bash
    $ curl -sSL https://get.docker.com/ | sh
```
启动docker服务
```bash
    $ systemctl start docker
    $ systemctl enable docker.service
```
从github提取nextcloud和mariadb（centos上的简化mysql数据库）图像。
```bash
    $ docker pull rootlogin/nextcloud && docker pull mariadb:10
```
使用Docker启动映像mariadb。
```bash
    $ docker run -d --name nextcloud_db -v /data/mysql:/var/lib/mysql -e \
    $ MYSQL_ROOT_PASSWORD=YOUR_PASSWD -e MYSQL_DATABASE=nextcloud \
    $ -e MYSQL_USER=nextcloud -e MYSQL_PASSWORD=YOURPASSWD mariadb:10
```
使用docker启动映像nextcloud。
```bash
    $ docker run -d --name nextcloud --link nextcloud_db:nextcloud_db -p 127.0.0.1:9001:80 -v /data/nextcloud:/data rootlogin/nextcloud
```
那是服务器上的最后一步。 现在，从浏览器开始http：// YOUR_DOMAIN /。

建议将“ localhost”替换为“ nextcloud_db”。

-------------

参考文献列表：
[https://www.moerats.com/archives/420/][1]
[https://my.oschina.net/yule526751/blog/799004][2]
[https://www.moerats.com/archives/420/][3]


  [1]: https://www.moerats.com/archives/420/
  [2]: https://my.oschina.net/yule526751/blog/799004
  [3]: https://www.moerats.com/archives/420/

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

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

{% raw %}</span>{% endraw %}