---
title: Centos7下 Nginx 配置ssl证书自动续期
date: 2019-03-09
categories:
- tech
tags:
- centos7
- ssl
---
断断续续玩web已经一年了，一些之前从腾讯云申的TrustAsia证书已经陆陆续续开始过期，很方..于是开始尝试申请Let's Encrypt的免费证书，并实现自动续期|´・ω・)ノ


<!--more-->

## 前提条件
 - 必须是Centos7系统，其它未测试，不保证有效
 - 有自己的域名
 - 确认dns已将域名指向服务器
 - 防火墙放行80与443端口
 - 已配置好nginx代理，并``可以通过http访问域名``(一定确定能访问)

## 安装certbot
通过yum安装certbot
````
$ yum update #更新yum源
$ yum install -y epel-release #安装epel源
$ yum install -y certbot #安装certbot
````

## 初次申领证书
### 初次申领某域名证书
格式为
````
$ certbot certonly --webroot -w [Web站点目录] -d [站点域名] -m [联系人email地址] --agree-tos
````
例如
````
$ certbot certonly --webroot -w /opt/www/demo.yourdomain.com -d demo.yourdomain.com -m yourname@gmail.com --agree-tos
````
### 证书位置
证书存放在``/etc/letsencrypt/live/demo.yourdomain.com/``文件夹中。
一共有4个文件，你可能要用到的是`fullchain.pem`和`privkey.pem`。

### 配置nginx
在相应的``server{}``中加入以下内容：
````
        listen 443 ssl;

        ssl_certificate /etc/letsencrypt/live/demo.yourdomain.com/fullchain.pem; #2
        ssl_certificate_key /etc/letsencrypt/live/demo.yourdomain.com/privkey.pem; #3

        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout 5m;
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        error_page 404 = /404.php;
````

例如
````
    server {
        listen 443 ssl;
        listen 80;

        server_name demo.yourdomain.com; #1
        root /opt/www/demo.yourdomain.com;
        index index.html;
        client_max_body_size 1000M;

        ssl_certificate /etc/letsencrypt/live/demo.yourdomain.com/fullchain.pem; #2
        ssl_certificate_key /etc/letsencrypt/live/demo.yourdomain.com/privkey.pem; #3

        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout 5m;
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        error_page 404 = /404.html;

    }
````
配置成功后执行如下指令：
````
$ nginx -t #检查nginx conf语法
$ systemctl restart nginx #重启nginx
````

## 配置自动续期
编辑crontab规则：([初次配置crontab][1])
````
$ crontab -e
````
键入以下内容(每月1号5时刷新证书并重启nginx)保存并退出
````
00 05 01 * * /usr/bin/certbot renew --quiet && /bin/systemctl restart nginx
````
重启crontab
````
$ systemctl restart crond.service
````


-------------------
参考链接：
[https://blog.csdn.net/sheng119/article/details/72956717][2]


  [1]: https://www.cnblogs.com/p0st/p/9482167.html
  [2]: https://blog.csdn.net/sheng119/article/details/72956717