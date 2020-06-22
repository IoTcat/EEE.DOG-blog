---
title: 随机图片API
date: 2020-06-16 15:43:54
categories:
- tech
tags:
---

本API基于华为云对象存储，使用华为CDN云加速，全球平均下载速度达10MB/s。API中已收录1100+张二次元图片，20+张Bing壁纸(每日自动抓取)，150+张二次元头像，10+张图床上传图片。

<!--more-->

[scode type="red"]本API不承诺**永久**维护，使用前请务必斟酌**使用风险**！！[/scode]

## 1 API地址
 - `https://api.yimian.xyz/img`


## 2 快速入门

***随机二次元图片***
 - `GET/POST /img?type=moe`
 - 示例：[https://api.yimian.xyz/img?type=moe](https://api.yimian.xyz/img?type=moe)

***随机Bing壁纸***
 - `GET/POST /img?type=wallpaper`
 - 示例：[https://api.yimian.xyz/img?type=wallpaper](https://api.yimian.xyz/img?type=wallpaper)

***随机二次元头像***
 - `GET/POST /img?type=head`
 - 示例：[https://api.yimian.xyz/img?type=head](https://api.yimian.xyz/img?type=head)

***随机图床图片***
 - `GET/POST /img?type=imgbed`
 - 示例：[https://api.yimian.xyz/img?type=imgbed](https://api.yimian.xyz/img?type=imgbed)

***随机1920x1080尺寸二次元图片***
 - `GET/POST /img?type=moe&size=1920x1080`
 - 示例：[https://api.yimian.xyz/img?type=moe&size=1920x1080](https://api.yimian.xyz/img?type=moe&size=1920x1080)


## 3 参数列表


名称 | 描述 | 格式 | 示例 
:---:| :---: | :---: | :---:
**type** | 图片种类 | `moe`/`wallpaper`/`head`/`imgbed` | `type=moe`
**size** | 根据图片大小筛选 | `??x??`;<br>`*x??`;<br>`*x*`;<br>`??-??x??`;<br>`??-??x??-??`;<br>`??-??x*` | `display=1920x1080`;<br>`display=1920x*`;<br>`display=1920-1950x230-500`;<br>`display=1920-1950x*`;
**range** | 尺寸误差范围 | number | `range=100`
**id** | 根据图片id筛选| number | `id=15`
**path** | 根据路径提取图片| abs path | `path=wallpaper/img_··mal.jpg`
**display** | 是否以网页格式展示 | `true`/`false`(default) | `display=true`
**R18** | 是否显示18禁图片 | `true`/`false`(default) | `R18=true`

## 4 参数详解

### 4.1 type

***二次元(默认)***
 - `GET/POST /img?type=moe`
 - 图片来源: 呓喵酱的日常收藏(Pivix, Twitter)
 - 示例：[https://api.yimian.xyz/img?type=moe](https://api.yimian.xyz/img?type=moe)

***bing每日壁纸***
 - `GET/POST /img?type=wallpaper`
 - 图片来源: Bing每日壁纸
 - 示例：[https://api.yimian.xyz/img?type=moe](https://api.yimian.xyz/img?type=wallpaper)
[scode type="green"]每日自动更新中[/scode]

***二次元头像***
 - `GET/POST /img?type=head`
 - 图片来源: 从二次元图片中选择性截取
 - 示例：[https://api.yimian.xyz/img?type=head](https://api.yimian.xyz/img?type=head)

***呓喵酱图床***
 - `GET/POST /img?type=imgbed`
 - 图片来源: [呓喵酱图床](https://imgbed.yimian.xyz)
 - 示例：[https://api.yimian.xyz/img?type=imgbed](https://api.yimian.xyz/img?type=imgbed)

***こいぬちゃん***
 - `GET/POST /img?type=koino`
 - 图片来源: @九条だんぼ(Twitter, Pivix, Google)
 - 示例：[https://api.yimian.xyz/img?type=koino](https://api.yimian.xyz/img?type=koino)

***EasyVer人机验证***
 - `GET/POST /img?type=easyver`
 - 图片来源: 呓喵酱优化整理
 - 示例：[https://api.yimian.xyz/img?type=easyver](https://api.yimian.xyz/img?type=easyver)

### 4.2 display
如果本参数置为true，则会禁用302跳转，直接返回完整图片编码。本方法**效率极低**，速度很慢，请慎用。

**false(默认)**
 - `GET/POST /img?display=false`
 - 描述: 302跳转返回图片，建议使用
 - 示例：[https://api.yimian.xyz/img?display=false](https://api.yimian.xyz/img?display=false)

**true**
 - `GET/POST /img?display=true`
 - 描述: 直接返回图片，速度慢
 - 示例：[https://api.yimian.xyz/img?display=true](https://api.yimian.xyz/img?display=true)

### 4.3 size
使用本参数限制图片尺寸。本参数支持以下格式：

***??x??***
 - `GET/POST /img?size=??x??`
 - 描述: 宽度x高度
 - 示例：[https://api.yimian.xyz/img?size=1920x1080](https://api.yimian.xyz/img?size=1920x1080)

***??x\****
 - `GET/POST /img?size=??x*`
 - 描述: 宽度x任意高度
!!!
<li>示例：<a href="https://api.yimian.xyz/img?size=1920x*" target="_blank">https://api.yimian.xyz/img?size=1920x*</a></li>
!!!

***\*x??***
 - `GET/POST /img?size=*x??`
 - 描述: 任意宽度x高度
!!!
<li>示例：<a href="https://api.yimian.xyz/img?size=*x1080" target="_blank">https://api.yimian.xyz/img?size=*x1080</a></li>
!!!

***\*x\****
 - `GET/POST /img?size=*x*`
 - 描述: 任意宽度x任意高度(默认)
!!!
<li>示例：<a href="https://api.yimian.xyz/img?size=*x*" target="_blank">https://api.yimian.xyz/img?size=*x*</a></li>
!!!

***??-??x??***
 - `GET/POST /img?size=??-??x??`
 - 描述: 宽度范围x高度
 - 示例：[https://api.yimian.xyz/img?size=1910-1930x1080](https://api.yimian.xyz/img?size=1910-1930x1080)

***??x??-??***
 - `GET/POST /img?size=??x??-??`
 - 描述: 宽度x高度范围
 - 示例：[https://api.yimian.xyz/img?size=1920x1070-1090](https://api.yimian.xyz/img?size=1920x1070-1090)

***??-??x??-??***
 - `GET/POST /img?size=??-??x??-??`
 - 描述: 宽度范围x高度范围
 - 示例：[https://api.yimian.xyz/img?size=1910-1930x1070-1090](https://api.yimian.xyz/img?size=1910-1930x1070-1090)

***??-??x\****
 - `GET/POST /img?size=??-??x*`
 - 描述: 宽度范围x任意高度
!!!
<li>示例：<a href="https://api.yimian.xyz/img?size=1910-1930x*" target="_blank">https://api.yimian.xyz/img?size=1910-1930x*</a></li>
!!!

***\*x??-??***
 - `GET/POST /img?size=*x??-??`
 - 描述: 任意宽度x高度范围
!!!
<li>示例：<a href="https://api.yimian.xyz/img?size=*x1070-1090" target="_blank">https://api.yimian.xyz/img?size=*x1070-1090</a></li>
!!!

### 4.4 range
本参数规定允许的size的误差，需搭配size使用，默认为0。

***对于??型size参数***
 - `GET/POST /img?size=??x??&range=100`
 - 描述: 宽度±100 x 高度±100
 - 示例：[https://api.yimian.xyz/img?size=1920x1080&range=100](https://api.yimian.xyz/img?size=1920x1080&range=100)

***对于??-??型size参数***
 - `GET/POST /img?size=??-??x??-??&range=100`
 - 描述: 最小宽度-100|最大宽度+100 x 最小高度-100|最大高度+100
 - 示例：[https://api.yimian.xyz/img?size=1910-1930x1070-1090&range=100](https://api.yimian.xyz/img?size=1910-1930x1070-1090&range=100)

***对于*型size参数***
 - `GET/POST /img?size=*x*&range=100`
 - 描述: range无效

### 4.5 id
每一个种类都有自己的id系统，同一种类下不同图片id唯一。

***二次元***
 - `GET/POST /img?type=moe&id=15`
 - 描述：提取id为15的二次元图片
 - 示例：[https://api.yimian.xyz/img?type=moe&id=15](https://api.yimian.xyz/img?type=moe&id=15)

***bing每日壁纸***
 - `GET/POST /img?type=wallpaper&id=2019-07-28`
 - 描述：提取2019-07-28的壁纸图片
 - 示例：[https://api.yimian.xyz/img?type=wallpaper&id=2019-07-28](https://api.yimian.xyz/img?type=wallpaper&id=2019-07-28)

***二次元头像***
 - `GET/POST /img?type=head&id=15`
 - 描述：提取id为15的头像
 - 示例：[https://api.yimian.xyz/img?type=head&id=15](https://api.yimian.xyz/img?type=head&id=15)

***呓喵酱图床***
 - `GET/POST /img?type=imgbed&id=529745e0`
 - 描述：提取id为529745e0的图床图片
 - 示例：[https://api.yimian.xyz/img?type=imgbed&id=529745e0](https://api.yimian.xyz/img?type=imgbed&id=529745e0)

### 4.6 path
使用绝对路径直接提取图片，优先级高于type，**效率最高**。

 - `GET/POST /img?path=xx/xx.xx`
 - 路径格式：`种类/图片文件名`
 - 路径格式示例：`imgbed/img_529745e0_900x900_8_null_normal.jpeg`
 - 描述：提取在xx/xx.xx的图片
 - 示例：[https://api.yimian.xyz/img/?path=imgbed/img_529745e0_900x900_8_null_normal.jpeg](https://api.yimian.xyz/img/?path=imgbed/img_529745e0_900x900_8_null_normal.jpeg)

### 4.7 R18
是否显示18禁图片，默认为false。

- `GET/POST /img?type=xx&R18=true`
 - 描述：随机提取xx类别中包含R18内容在内的图片
 - 示例：[https://api.yimian.xyz/img/?type=koino&R18=true](https://api.yimian.xyz/img/?type=koino&R18=true)


## 5 报错格式

### 5.1 找不到指定type类型
若找不到指定的type类型，将会自动返回一个moe类型的图片。

### 5.2 找不到符合条件的图片
返回JSON

```js
{
  "err": "错误信息"
}
```

[scode type="yellow"]每台设备每天**全局**调用上限500次!！[/scode]


