---
title: Hello Typecho
titleEN: Hello Typecho
date: 2018-12-22
categories:
- tech
tags:
- hexo
---




{% raw %}<span class=".zh">{% endraw %}

将blog从wordpress迁移到了Typecho。

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Migrated blog from wordpress to Typecho.

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




{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}



{% raw %}</span>{% endraw %}