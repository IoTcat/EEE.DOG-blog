---
title: 自动发邮件API
titleEN: Auto email API
date: 2019-03-22
categories:
- tech
tags:
- api
- mail
---


{% raw %}<span class=".zh">{% endraw %}
重整自己先前的mail模块，顺便封装了一个API出来，欢迎大家调用~


{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Reorganized my previous mail module and encapsulated an API by the way. Welcome everyone to call~

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



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## Method

### Parameters (accept GET and POST)
  - `to` recipient email address
  - `subject` mail subject
  - `body` email content (html format is recommended)
  - `from` sender name

### Request address
````
https://api.yimian.xyz/mail
````

### Example
````
https://api.yimian.xyz/mail/?to=receiving mailbox&subject=mail subject&body=mail content&from=sender name
````

[scode type="yellow"] If you encounter an error in GET delivery of the mail content, please try using POST[/scode]

### Return value (json format)
  - Parameter `state`::`true` (success) or `false` (failure)

[scode type="dangerous"] There are 50 requests per day per IP[/scode]

{% raw %}</span>{% endraw %}