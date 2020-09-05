---
title: 你好，世界！
titleEN: Hello World!
date: 2018-09-04
categories:
- tech
tags:
- wordpress
- php
---


{% raw %}<span class=".zh">{% endraw %}

你好，世界！

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Hello World!

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


在我19周岁生日这一天，我的第一个通过wordpress自建的Blog网站正式上线啦~

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}
On my 19th birthday, my first blog site built by WordPress was officially launched~


{% raw %}</span>{% endraw %}