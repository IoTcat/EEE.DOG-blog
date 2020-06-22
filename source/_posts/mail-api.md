---
title: 自动发邮件API
date: 2020-06-16 15:43:54
categories:
- tech
tags:
---
重整自己先前的mail模块，顺便封装了一个API出来，欢迎大家调用~


<!--more-->

## 方法

### 参数(接受GET和POST)
 - `to`收信人邮箱地址
 - `subject`邮件主题
 - `body`邮件内容(建议使用html格式)
 - `from`发件人名称

### 请求地址
````
https://api.yimian.xyz/mail
````

### 示例
````
https://api.yimian.xyz/mail/?to=收信邮箱&subject=邮件主题&body=邮件内容&from=发件人名称
````

[scode type="yellow"]如遇到GET传递邮件内容错误，请尝试使用POST[/scode]

### 返回值(json格式)
 - 参数`state`::`true`(成功)或`false`(失败)

[scode type="dangerous"]每个IP每天请求上限50个[/scode]
