---
title: 网易云音乐获取API
titleEN: Netease Music API
date: 2019-07-29
categories:
- tech
tags:
- api
- music
---


{% raw %}<span class=".zh">{% endraw %}
封装好的网易云音乐API，欢迎大家调用━(*｀∀´*)ノ亻!

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
The packaged NetEase Cloud Music API, welcome everyone to use ━(*｀∀´*)ノ亻!
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
 - `type`: (必填)模式类型 `type`=`single`单曲信息/`playlist`歌单歌曲信息/`url`获取歌曲/`cover`获取封面/`lrc`获取歌词
 - `id`: (必填，搭配type使用)歌单或歌曲id e.g. `id`=`198401123`
 - `random`: 仅对playlist有效，返回的歌曲是否打乱顺序，默认`false`. e.g. `random`=`true` 
 - `limit`: 返回歌单最大长度 e.g. `limit`=`10` 

> 歌单和歌曲的id可以从[云音乐网页版](https://music.163.com/#/my/)获取。点开歌单或歌曲，查看浏览器地址栏，如下图：
> ![Playlist Id](https://api.yimian.xyz/img/?path=imgbed/img_dfeddac_552x34_8_null_normal.jpeg)
> ![Single Song Id](https://api.yimian.xyz/img/?path=imgbed/img_527a5ea_491x37_8_null_normal.jpeg)


> 2021-6-23起"我喜欢的音乐"歌单不再受支持。如有需求，请创建一个公开的歌单，并将“我喜欢的音乐”中的歌曲移入。
## 请求地址
````
GET https://api.yimian.xyz/msc/
````

## 示例
### 获取id为36308263的歌曲信息
https://api.yimian.xyz/msc/?type=single&id=36308263
### 获取id为2675649523的歌单所有歌曲信息
https://api.yimian.xyz/msc/?type=playlist&id=2675649523
### 获取2675649523歌单前14首歌曲信息
https://api.yimian.xyz/msc/?type=playlist&id=2675649523&limit=14
### 随机从2675649523歌单获取14首歌曲信息
https://api.yimian.xyz/msc/?type=playlist&id=2675649523&limit=14&random=true
### 获取36308263的mp3音乐文件
https://api.yimian.xyz/msc/?type=url&id=36308263
### 获取id为3384296792803059的封面图片
https://api.yimian.xyz/msc/?type=cover&id=3384296792803059
### 获取36308263歌曲的lrc歌词文件
https://api.yimian.xyz/msc/?type=lrc&id=36308263

## 返回值(json格式)

 - single单曲模式: 
```js
{
	id: "歌曲id", 
	name: "歌曲名称", 
	artist: "第一作者", 
	album: "专辑名称", 
	url: "单曲地址", 
	cover: "封面地址", 
	lrc: "歌词地址"
}
```

 - playlist歌单模式: 
```js
 [
 	{
 		id: "歌曲id",
 		name: "歌曲名称", 
 		artist: "第一作者", 
 		album: "专辑名称", 
 		url: "单曲地址", 
 		cover: "封面地址", 
 		lrc: "歌词地址"
 	}, 
 	{歌曲2..}, 
 	{歌曲3..}
 ]

```

 - 错误: 
```js
{code: 500, err: "错误信息"}
```

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## Parameters
 - `type`: (Required) Mode type `type`=`single` single information/`playlist` song information/`url` get song/`cover` get cover/`lrc` get lyrics
 - `id`: (Required, used with type) Playlist or song id e.g. `id`=`198401123`
 - `random`: Only valid for playlist, whether the returned songs are out of order, the default is `false`. e.g. `random`=`true`
 - `limit`: return the maximum length of the playlist e.g. `limit`=`10`

> Playlist and song id can be obtained from [Cloud Music Web Version](https://music.163.com/#/my/). Click to open a playlist or song, and check the browser address bar, as shown below:
> ![Playlist Id](https://api.yimian.xyz/img/?path=imgbed/img_dfeddac_552x34_8_null_normal.jpeg)
> ![Single Song Id](https://api.yimian.xyz/img/?path=imgbed/img_527a5ea_491x37_8_null_normal.jpeg)

## Request address
````
GET https://api.yimian.xyz/msc/
````

## Example
````
//Get song information with id 36308263
https://api.yimian.xyz/msc/?type=single&id=36308263
//Get all song information of the playlist with id 2675649523
https://api.yimian.xyz/msc/?type=playlist&id=2675649523
//Get information about the first 14 songs of the 2675649523 playlist
https://api.yimian.xyz/msc/?type=playlist&id=2675649523&limit=14
//Get 14 song information randomly from 2675649523 playlist
https://api.yimian.xyz/msc/?type=playlist&id=2675649523&limit=14&random=true
//Get 36308263 mp3 music file
https://api.yimian.xyz/msc/?type=url&id=36308263
//Get the cover image with id 3384296792803059
https://api.yimian.xyz/msc/?type=cover&id=3384296792803059
//Get the lrc lyrics file of 36308263 song
https://api.yimian.xyz/msc/?type=lrc&id=36308263
````

## Return value (json format)

 - single mode:
```js
{
	id: "Song id",
	name: "Song name",
	artist: "First Author",
	album: "Album Name",
	url: "Single address",
	cover: "Cover Address",
	lrc: "Lyrics address"
}
```

 - Playlist playlist mode:
```js
 [
	 {
		 id: "Song id",
		 name: "Song name",
		 artist: "First Author",
		 album: "Album Name",
		 url: "Single address",
		 cover: "Cover Address",
		 lrc: "Lyrics address"
	 },
	 {Song 2..},
	 {Song 3..}
 ]

```

 - Error:
```js
{code: 500, err: "error message"}
```

{% raw %}</span>{% endraw %}
