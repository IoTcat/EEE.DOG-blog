---
title: 部署新型冠状病毒API
titleEN: Deploy new coronavirus API
date: 2020-02-04
categories:
- tech
tags:
- Covid-19
- API
---



{% raw %}<span class=".zh">{% endraw %}
一分钟快速部署你自己的新型冠状病毒API ୧(๑•̀⌄•́๑)૭
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Deploy your own new coronavirus API in one minute ୧(๑•̀⌄•́๑)૭

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


# coro-api
新型冠状病毒 实时数据 api   
项目Git地址: [iotcat/coro-api](https://github.com/iotcat/coro-api)    
项目npm地址: [iotcat/coro-api](https://www.npmjs.com/package/coro-api)   

## API示例

### 获取全部

[https://api.yimian.xyz/coro](https://api.yimian.xyz/coro)

### 根据省份

[https://api.yimian.xyz/coro?province=山东](https://api.yimian.xyz/coro?province=%E5%B1%B1%E4%B8%9C)  

### 根据城市

[https://api.yimian.xyz/coro?city=泰安](https://api.yimian.xyz/coro?city=%E6%B3%B0%E5%AE%89)

### 根据省和城(推荐)

[https://api.yimian.xyz/coro?province=山东&city=泰安](https://api.yimian.xyz/coro?province=%E5%B1%B1%E4%B8%9C&city=%E6%B3%B0%E5%AE%89) 



## 快速部署

### 环境要求
 - `nodeJS`支持`express`任意版本
 - `git`任意版本

### 下载文件
```
$ git clone https://github.com/iotcat/coro-api.git & cd coro-api
```

### 安装依赖
```shell
$ npm install
```

### 启动
```shell
$ node index.js
```

### 访问
```
http://localhost:17676
```


## 进阶

### GET参数
 参数 | 描述 | 示例 
 :--: | :--: | :--:
 province | 省份(国家) | 山东
 city | 城市 | 泰安


### 修改端口

从`index.js`第9行修改默认端口。

### 禁止跨域

注释掉`index.js`第13行。

### 使用pm2守护进程

```shell
$ npm i -g pm2
$ pm2 start index.js --name coro-api -o /var/log/coro/api.out -e /var/log/coro/api.err --watch
```

### Nginx配置

将以下内容加入`server{}`中  
```nginx
location / {
    proxy_pass   http://127.0.0.1:17676;
}

```
如果你不是从根目录映射，记得去`index.js`中第11行`app.get('/', f)`修改成你的路径。

### 爬虫配置

爬虫使用[coro-py](https://github.com/iotcat/coro-py), 请参考其文档。

## 开源协议

本项目使用MIT协议，允许非署名商业非商业使用。武汉加油！中国加油！！❤


{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}
# coro-api
Novel coronavirus real-time data api
Project Git address: [iotcat/coro-api](https://github.com/iotcat/coro-api)
Project npm address: [iotcat/coro-api](https://www.npmjs.com/package/coro-api)

## API example

### Get all

[https://api.yimian.xyz/coro](https://api.yimian.xyz/coro)

### According to province

[https://api.yimian.xyz/coro?province=Shandong](https://api.yimian.xyz/coro?province=%E5%B1%B1%E4%B8%9C)

### According to the city

[https://api.yimian.xyz/coro?city=泰安](https://api.yimian.xyz/coro?city=%E6%B3%B0%E5%AE%89)

### According to the province and city (recommended)

[https://api.yimian.xyz/coro?province=Shandong&city=Taian](https://api.yimian.xyz/coro?province=%E5%B1%B1%E4%B8%9C&city=%E6%B3%B0%E5%AE%89)



## Quick deployment

### Environmental requirements
 - `nodeJS` supports any version of `express`
 - Any version of `git`

### download file
```
$ git clone https://github.com/iotcat/coro-api.git & cd coro-api
```

### Installation dependencies
```shell
$ npm install
```

### start up
```shell
$ node index.js
```

### Access
```
http://localhost:17676
```


## Advanced

### GET parameters
 Parameters | Description | Example
 :--: | :--: | :--:
 province | Province (Country) | Shandong
 city ​​| city | Tai'an


### Modify port

Modify the default port from line 9 of `index.js`.

### Cross-domain prohibited

Comment out line 13 of `index.js`.

### Use pm2 daemon

```shell
$ npm i -g pm2
$ pm2 start index.js --name coro-api -o /var/log/coro/api.out -e /var/log/coro/api.err --watch
```

### Nginx configuration

Add the following content to `server{}`
```nginx
location / {
    proxy_pass http://127.0.0.1:17676;
}

```
If you are not mapping from the root directory, remember to go to the 11th line of `index.js` and change `app.get('/', f)` to your path.

### Crawler configuration

The crawler uses [coro-py](https://github.com/iotcat/coro-py), please refer to its documentation.

## Open Source Agreement

This project uses the MIT protocol, allowing non-signed commercial and non-commercial use. Go Wuhan! Go China! ! ❤


{% raw %}</span>{% endraw %}