---
title: 咕咕机API
titleEN: Memobird Printer API
date: 2019-04-23
categories:
- tech
tags:
- api
- motto
---


{% raw %}<span class=".zh">{% endraw %}
这是一个简易的咕咕机API哦~

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
This is a simple Memobird Printer API~
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

> 本API仅为官方接口的二次封装，意在降低其使用门槛。本站承诺不会保存任何使用者信息。如果您对本站存有疑惑，请慎重使用本接口！！本接口[源码](https://github.yimian.xyz/iotcat/gugu-api)


## 参数 
 - `ak`: 咕咕机AccessKey(前往[咕咕机开放平台](https://open.memobird.cn/)申请)
 - `userID`: 用户的咕咕号(手机软件>>我的>>头像旁边的咕咕号)
 - `memobirdID`: 咕咕机ID(手机软件>>我的>>我的咕咕机>>咕咕机>>设备编号)
 - `body`: 内容

## 请求地址
````
GET https://api.yimian.xyz/gugu/
````

## 示例
````
https://api.yimian.xyz/gugu/?ak=9e55121803474371bfa25d20e554b31d&userID=832598&memobirdID=c3ee06a8bd9b49e1&body=你好呀世界
````

## 返回值(plaintext)

 - 成功: 

```js
{
	"showapi_res_code": 1, //1为发送成功，0为失败
	"showapi_res_error": "ok", //"ok"为发送成功，否则显示错误信息
	"result": 1, //1为打印成功
	"smartGuid": "149e2257412e532e", //会话标识符
	"printcontentid": 234784 //打印内容识别编码
}
```

 - 失败：

```js
{
	"showapi_res_code": 1, //1为发送成功，0为失败
	"showapi_res_error": "错误信息" //否则显示错误信息
}
```

> 更多用法见[官方文件](http://open.memobird.cn/upload/webapi.pdf)

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}
> This API is only a simplified package of the official interface, intending to lower the threshold for its use. This site promises not to save any user information. If you have any doubts about this site, please use this interface carefully! ! This interface [source code](https://github.yimian.xyz/iotcat/gugu-api).


## Parameters
 -`ak`: Memobird Printer AccessKey (Go to [Memobird Printer Open Platform](https://open.memobird.cn/) to apply)
 -`userID`: the user's id (the User id is next to the avatar in mobile Memobird software)
 -`memobirdID`: Memobird Printer ID (Find it in the mobile Memobird software)
 -`body`: content to print

## Request address
````
GET https://api.yimian.xyz/gugu/
````

## Example
````
https://api.yimian.xyz/gugu/?ak=9e55121803474371bfa25d20e554b31d&userID=832598&memobirdID=c3ee06a8bd9b49e1&body=Hello world
````

## Return value (plaintext)

 - Success:

```js
{
"showapi_res_code": 1, //1 means transmission is successful, 0 means failure
"showapi_res_error": "ok", //"ok" means the transmission is successful, otherwise an error message will be displayed
"result": 1, //1 means successful printing
"smartGuid": "149e2257412e532e", //session identifier
"printcontentid": 234784 //Print content identification code
}
```

 - Failure:

```js
{
"showapi_res_code": 1, //1 means sending successfully, 0 means failure
"showapi_res_error": "Error message" //Otherwise display error message
}
```

> For more usage, please refer to [Official Document](http://open.memobird.cn/upload/webapi.pdf)

{% raw %}</span>{% endraw %}