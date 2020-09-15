---
title: 公共开支结算系统
titleEN: Shared Expense Management System
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
 - 邮件通知内部交易的双方
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

-----------------------
**2020-03-22 更新**   

由于疫情原因，考虑到大家都已撤回中国。为节约服务器费用，停止提供服务。

结合过去半年运行状况，我做了一些分析总结：

## 主要收获
1.	分析客户真需求的经验
2.	快速搭建生产环境网站工具的能力
3.	室友对我能力的认可


## 开发方法论
1.	基于一系列自己过去的项目，3天时间快速立项并投入使用
2.	仔细研究需求，判断哪些是真需求，哪些是伪需求。

## 遇到的挑战

1.	快速开发，因为大家在抵达英国后已经开始大量花钱买公共用品，因此，急需使用这个系统
2.	算法一定要稳定可靠，因为是牵扯到大家钱的东西
3.	本系统的目的是为了更加方便，把会计的工作交给系统来自动化处理。以此一定要在保证公平的前提下，使得大家之间的内部交易的次数尽可能少，且指示明确。
4.	如何让大家对系统产生信任。


## 解决方法

1.	基于大量自己先前的项目。用1天开发成型，1天测试debug，1天优化前端，加入方差，百分比等功能。
2.	参考记账表，使用了表格模式。每次有新的上传，就会实时计算出新的状态。多次测试，充分验证后才投入使用。
3.	使用“平衡”的构想，关注差异，当差异过大时使支出最多者和支出最少者产生内部交易。且内部交易值为整数。比如我们生产场景应用的是20磅。
4.	在系统算法稳定的情况下，参考支付宝的设计。内部交易有两个步骤。首选支出者和收入者都收到邮件，告知给谁（从谁收），多少钱。然后在支出者把钱给收入者后，收入者需要登录网页或从邮件链接进行确认。截至此时，系统才认为一笔内部交易完成。


-------------------------------
**2020-9-8 更新**

基于Ushio用户系统，结合过去半年的运行情况和大家的需求变化，我重构并开发出了新一版的公共支出系统。


## 新功能

 - 实现了Ushio用户系统的接入
 - 用户能够随时注册并新建公共账单
 - 同一个用户能够同时在多个账单
 - 用户能够随时加入公共账单
 - 用户能够随时结算并退出某个公共账单
 - 更加智能的结算算法
 - 使用LocalStorage优化了二次访问的速度


## 体验

cp-acc现在已经对公众开放，您可以进入其[网站](https://cp-acc.yimian.xyz)进行体验。不过在体验前，您需要先通过ushio用户系统使用您的邮箱登录，以便接收账单消息。



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

![imgbed_ed08c497](https://api.yimian.xyz/img/?path=imgbed/img_ed08c497_1080x6654_8_null_normal.jpeg)

![imgbed_ea04ad82](https://api.yimian.xyz/img/?path=imgbed/img_ea04ad82_1080x5082_8_null_normal.jpeg)

![imgbed_a8b3adb0](https://api.yimian.xyz/img/?path=imgbed/img_a8b3adb0_1080x2160_8_null_normal.jpeg)

-----------------------
**2020-03-22 update**

Due to the epidemic, considering that everyone has withdrawn to China. To save server costs, stop providing services.

Combining the operation status of the past six months, I have made some analysis and summary:

## Main gains
1. Experience in analyzing the real needs of customers
2. Ability to quickly build production environment website tools
3. My roommate's recognition of my ability


## Development Methodology
1. Based on a series of past projects, quickly set up and put into use in 3 days
2. Carefully study the requirements and determine which are true and which are false.

## Challenges encountered

1. Rapid development, because everyone has started to spend a lot of money on public goods after arriving in the UK, so there is an urgent need to use this system
2. The algorithm must be stable and reliable, because it involves everyone's money
3. The purpose of this system is to make it more convenient to delegate the accounting work to the system for automated processing. In this way, the number of internal transactions between everyone must be as few as possible and the instructions must be clear under the premise of ensuring fairness.
4. How to make everyone trust the system.


## Solution

1. Based on a large number of own previous projects. It takes 1 day to develop and form, 1 day to test debug, 1 day to optimize the front-end, add variance, percentage and other functions.
2. Refer to the accounting table and use the table mode. Every time there is a new upload, the new status will be calculated in real time. Tested many times and put into use after full verification.
3. Use the concept of "balance" and pay attention to differences. When the differences are too large, make internal transactions between those who spend the most and those who spend the least. And the internal transaction value is an integer. For example, our production scenario uses 20 pounds.
4. When the system algorithm is stable, refer to the design of Alipay. There are two steps to internal transactions. Both the first-choice payer and the earner receive emails telling to whom (from whom) and how much money. Then after the payer gives the money to the earner, the earner needs to log in to the web page or confirm it from the email link. As of this time, the system considers that an internal transaction is complete.


-------------------------------
**2020-9-8 update**

Based on the Ushio user system, combined with the operation of the past six months and the changes in everyone's needs, I reconstructed and developed a new version of the public expenditure system.


## New features

 - Achieved access to Ushio user system
 - Users can register and create new public bills at any time
 - The same user can be in multiple bills at the same time
 - Users can join the public bill at any time
 - Users can settle and exit a public bill at any time
 - Smarter settlement algorithm
 - Use LocalStorage to optimize the speed of secondary access


## Experience

cp-acc is now open to the public, you can go to its [website](https://cp-acc.yimian.xyz) to experience it. But before the experience, you need to log in with your email address through the ushio user system in order to receive bill messages.

{% raw %}</span>{% endraw %}