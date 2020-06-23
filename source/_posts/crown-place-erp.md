---
title: 公共开支结算系统
date: 2019-09-22
categories:
- tech
tags:
- crown-place
- uk
- liverpool
- erp
- system
---
在英国留学与4个室友合租，为了更好的控制和监管公共支出，以及维持彼此之间的公共支出平衡，我利用迎新周三天时间设计并开发除了此ERP公共开支计划系统。希望此系统能够便捷接下来一年的生活，减少大家之间的矛盾，促使充满幸福感的公共支出项目持久化OωO


<!--more-->

## 1.功能介绍
 - 统计日均周均流水，让公共支出可视化
 - 用户申报一次公共支出，并提交发票照片留证
 - 监视各成员间支出不均衡程度，计算方差，并可视化显示
 - 对比本周与上周的开支，给出增减比例
 - 当存在一人支出超出均值阈值，并且存在至少一人支出少于均值阈值，则会邮件这两个人产生一次内部交易
 - 当上例中收款人收到款项后，需要到平台确认收到
 - 平台所有历史公共开支及发票可查

## 2.系统架构

### 2.1 前端
前端基于一个网上找到的比特币网站平台模板，深度改造实现。值得一提的是，前端使用[Ushio-js项目](https://github.com/iotcat/ushio-js)作为安全及日志插件，并得到了[Ushio](https://ushio.xyz)系统做背后支持。

### 2.2 后端
后端使用php语言编写。提供5个接口，分别提供获取账户事件，获取内部流通信息，获取公共支出信息，获取周报表，操作的功能。

mail系统使用[Yimian Mail API](https://www.eee.dog/tech/mail-api.html)快速构建。

### 2.3 数据库
数据库使用yimian-db/mysql。构建了三个表，分别用于存储流水，公共支出详情，内部流通。

### 2.4 图片上传
直接引用[呓喵酱の图床](https://imgbed.yimian.xyz)代码，少量改写。

### 2.5 用户系统
目前用额外网页简单实现，等待[ushio-auth项目](https://github.com/iotcat/auth)完成后统一整合。

## 3. 外观
没啥可说的，摆图，自己看
![imgbed_ed08c497](https://api.yimian.xyz/img/?path=imgbed/img_ed08c497_1080x6654_8_null_normal.jpeg)

![imgbed_ea04ad82](https://api.yimian.xyz/img/?path=imgbed/img_ea04ad82_1080x5082_8_null_normal.jpeg)

![imgbed_a8b3adb0](https://api.yimian.xyz/img/?path=imgbed/img_a8b3adb0_1080x2160_8_null_normal.jpeg)



