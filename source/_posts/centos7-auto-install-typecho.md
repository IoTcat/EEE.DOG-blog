---
title: Centos7脚本一键安装Typecho
date: 2019-02-25
categories:
- tech
tags:
- centos7
- php
- typecho
---

一时兴起，帮番茄同学（[@番茄树][1]）配置了博客，在此记录一下流程 ::aru:confuse:: 


<!--more-->

## 先觉条件
 - 只测试过阿里云腾讯云Centos7学生机
 - 系统很干净，最好刚重装过
 - 使用root权限

## 一键安装
无聊写了一个一键搭建脚本，使用如下指令运行（详见[github][2]）
````
$ wget https://yimian-setup.obs.myhwclouds.com/sh/auto.sh && sh auto.sh
````
如果不出意外安装将自动进行，安装最后需要你手动输入如下数据库配置指令。
````
use mysql
UPDATE user SET Password = '你的密码' WHERE User = 'root';
create database typecho;
quit
````
## 轻松开始
安装完成后，使用你的浏览器访问以下链接
````
http://你的服务器ip
````
根据页面提示安装typecho
大部分内容保持默认即可，只需填写：
 - 数据库密码(你刚才设置的)
 - 管理员用户名
 - 管理员登录密码
 - 管理员邮箱地址

## 自定义域名配置
首先在你的域名服务商(腾讯云，阿里云)将你的域名A解析到你的服务器ip
**打开服务器上nginx配置文件**
````
$ vi /etc/nginx/nginx.conf
````
将文件中第42，47，48行的 your_domain 替换成你自己的域名即可。
**重启nginx服务**
````
$ systemctl nginx -t # nginx.conf 语法检查
$ systemctl restart nginx # 重启nginx
````
然后大约经过10分钟，你就可以通过`https://你的域名`访问typecho了

## https配置
如果你任然无法访问，而是被引导到一个备案页面，那么你可能需要使用https

### 法一
配置自动续费ssl证书可参考我的另一篇文章([Centos7下 Nginx 配置ssl证书自动续期][3])

### 法二
 - 从腾讯云等申请并下载证书，然后上传nginx文件夹中的两个证书到服务器

 - 去掉前面提到nginx.conf中第39,47-54行注释
 - 将第47,48行后半部分分别换成你自己.crt和.key证书文件的地址
 - `systemctl restart nginx`重启nginx
 - 使用浏览器访问`https://你的域名`




----------
参考链接：
[https://www.cnblogs.com/blibli/p/7286786.html][4]
[https://blog.csdn.net/weixin_41919236/article/details/84878430][5]
[https://www.cnblogs.com/moxiaoan/p/5683743.html][6]
[https://www.cnblogs.com/lalalagq/p/9979068.html?tdsourcetag=s_pcqq_aiomsg][7]


  [1]: https://tomatotrees.xyz
  [2]: https://github.com/IoTcat/typecho-auto-install-centos7
  [3]: https://www.eee.dog/tech/ssl-auto-apply.html
  [4]: https://www.cnblogs.com/blibli/p/7286786.html
  [5]: https://blog.csdn.net/weixin_41919236/article/details/84878430
  [6]: https://www.cnblogs.com/moxiaoan/p/5683743.html
  [7]: https://www.cnblogs.com/lalalagq/p/9979068.html?tdsourcetag=s_pcqq_aiomsg