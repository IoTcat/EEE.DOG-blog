---
title: 公共开支结算系统
titleEN: Public expenditure settlement system
display: true
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


{% raw %}<span class=".zh">{% endraw %}
在英国留学与4个室友合租，为了更好的控制和监管公共支出，以及维持彼此之间的公共支出平衡，我利用迎新周三天时间设计并开发除了此ERP公共开支计划系统。希望此系统能够便捷接下来一年的生活，减少大家之间的矛盾，促使充满幸福感的公共支出项目持久化OωO
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
I studied in the UK and shared with 4 roommates. In order to better control and monitor public expenditures and maintain the balance of public expenditures between each other, I designed and developed this ERP public expenditure planning system during the welcome Wednesday. I hope that this system will make life easier for the next year, reduce conflicts between everyone, and promote the sustainability of public expenditure projects full of happiness OωO

{% raw %}</span>{% endraw %}



<!--more-->


{% raw %}
<script>
	session.onload(function(){
		if(page.tran.getLang() == 'en'){
			tips.warning({
				title: 'Caution',
				position: 'topRight',
				message: 'This page was translated by Machine!!',
				buttons: [['<button>Show Original Page</button>', function (instance, toast) {
					page.tran.setLang('zh');
             		instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
        		}, true]]
			});
		}
	});
</script>
{% endraw %}

{% raw %}<span class=".zh">{% endraw %}
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
前端基于一个网上找到的比特币网站平台模板，深度改造实现。值得一提的是，前端使用[Ushio-js项目](https://github.com/iotcat/ushio-js)作为安全及日志插件，并得到了[Ushio](https://ushio.cool)系统做背后支持。

### 2.2 后端
后端使用php语言编写。提供5个接口，分别提供获取账户事件，获取内部流通信息，获取公共支出信息，获取周报表，操作的功能。

mail系统使用[Yimian Mail API](https://www.eee.dog/tech/mail-api.html)快速构建。

### 2.3 数据库
数据库使用yimian-db/mysql。构建了三个表，分别用于存储流水，公共支出详情，内部流通。

### 2.4 图片上传
直接引用[呓喵酱の图床](https://imgbed.yimian.xyz)代码，少量改写。

### 2.5 用户系统
目前用额外网页简单实现，等待[ushio-auth项目](https://github.com/iotcat/ushio-auth)完成后统一整合。

## 3. 外观
没啥可说的，摆图，自己看
![imgbed_ed08c497](https://api.yimian.xyz/img/?path=imgbed/img_ed08c497_1080x6654_8_null_normal.jpeg)

![imgbed_ea04ad82](https://api.yimian.xyz/img/?path=imgbed/img_ea04ad82_1080x5082_8_null_normal.jpeg)

![imgbed_a8b3adb0](https://api.yimian.xyz/img/?path=imgbed/img_a8b3adb0_1080x2160_8_null_normal.jpeg)



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## 1. Function introduction
 - Calculate the daily average weekly flow rate to visualize public expenditure
 - The user declares a public expenditure and submits the invoice photo certificate
 - Monitor the disequilibrium of expenditure among members, calculate the variance, and display it visually
 - Compare spending this week and last week, and give the percentage increase or decrease
 - When there is one person whose expenditure exceeds the average threshold, and there is at least one person whose expenditure is less than the average threshold, the two people will be emailed to generate an internal transaction
 - When the recipient receives the money in the above example, he needs to go to the platform to confirm receipt
 - All historical public expenditures and invoices on the platform can be checked

## 2. System Architecture

### 2.1 Frontend
The front end is based on a Bitcoin website platform template found on the Internet, and a deep transformation is realized. It is worth mentioning that the front end uses [Ushio-js project](https://github.com/iotcat/ushio-js) as a security and logging plug-in, and got [Ushio](https://ushio.cool) The system does behind the scenes.

### 2.2 Backend
The backend is written in php language. Provides 5 interfaces, which respectively provide the functions of obtaining account events, obtaining internal circulation information, obtaining public expenditure information, obtaining weekly statements, and operating.

The mail system is quickly constructed using [Yimian Mail API](https://www.eee.dog/tech/mail-api.html).

### 2.3 Database
The database uses yimian-db/mysql. Three tables are constructed, which are used to store flow, public expenditure details, and internal circulation.

### 2.4 Image upload
Directly quote the code of [呓喵酱の图床](https://imgbed.yimian.xyz) with a small amount of rewriting.

### 2.5 User System
At present, it is simple to implement with additional web pages, waiting for the [ushio-auth project](https://github.com/iotcat/ushio-auth) to complete the unified integration.

## 3. Appearance
Nothing to say, show the picture, see for yourself
![imgbed_ed08c497](https://api.yimian.xyz/img/?path=imgbed/img_ed08c497_1080x6654_8_null_normal.jpeg)

![imgbed_ea04ad82](https://api.yimian.xyz/img/?path=imgbed/img_ea04ad82_1080x5082_8_null_normal.jpeg)

![imgbed_a8b3adb0](https://api.yimian.xyz/img/?path=imgbed/img_a8b3adb0_1080x2160_8_null_normal.jpeg)
{% raw %}</span>{% endraw %}