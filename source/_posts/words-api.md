---
title: 呓喵酱的一言API
titleEN: IoTcat's Motto API
date: 2019-07-30
categories:
- tech
tags:
- api
- motto
---


{% raw %}<span class=".zh">{% endraw %}
这里是呓喵酱的语录API哦~

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Hi~ This is the API of IoTcat's Motto..
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

## 参数 
 - `lang`: (可选)语言 e.g. `lang`=`en`(英语)/`zh`(中文)


## 请求地址
````
GET https://api.yimian.xyz/words/
````

## 示例
````
//随机获取一句中文语录
https://api.yimian.xyz/words/
//随机获取一句英文语录
https://api.yimian.xyz/words/?lang=en
````

## 返回值(plaintext)

```
随机一句话
```

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## Parameters
 - `lang`: (optional) Language setting. e.g. `lang`=`en`(English)/`zh`(Chinese)


## Request address
````
GET https://api.yimian.xyz/words/
````

## Example
````
//Get a random Chinese quotation
https://api.yimian.xyz/words/
//Get a random English quotation
https://api.yimian.xyz/words/?lang=en
````

## Return value (plaintext)

```
Random sentence..
```

{% raw %}</span>{% endraw %}