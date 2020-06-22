title: 部署新型冠状病毒API
date: 2020-06-16 15:43:54
categories:
- tech
tags:
---
一分钟快速部署你自己的新型冠状病毒API ୧(๑•̀⌄•́๑)૭
<!--more-->

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
