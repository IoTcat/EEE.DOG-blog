---
title: acg.watch-我的私人视频网站
titleEN: acg.watch - My Personal video Site
categories:
  - tech
tags:
  - website
  - video
date: 2021-01-24
---


{% raw %}<span class=".zh">{% endraw %}
此文将讨论acg.watch网站的定位，运营模式，以及潜在应用等。
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
This article will discuss the positioning, operating mode, and potential applications of the acg.watch website.
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

## 缘由

自从18年第一次尝试建站以来，追求流媒体播放服务一直是我所追求的目标。


## 历史
从2018年三月，我第一次通过腾讯云Win Server 2012实现了对摇曳露营第3集的发布，从而使其能够在网页上访问。到2018年9月，基于video.js，我第一次搭建了一个视频网站，使用华为云对象存储以及mysql数据库进行集中管理，并将其发布在video.yimian.xyz。2018年11月，配合树莓派3B以及一个红外摄像头，我通过推流实现了对宿舍的24小时监控。2019年2月，我购买了acg.watch这个域名，并将视频站转移至此。此后，我站视频被爬多次，由于华为云存储巨额的流量费用，我觉定暂时停止公开提供服务。2019年11月，在英国，我重构了视频站，不再使用华为云存储这个烧钱的服务，转而寻求onedrive存储方案。此外，新的视频站不再拥有后端，而是使用file-cache机制通过分析onedrive的视频目录自动生成数据集。2020年8月，随着ushio用户系统竣工，视频站开始支持为用户提供个性化服务，包括跨设备播放记录同步等。2021年1月，确定acg.watch的发展方向为**多功能在线播放器**，此外网站还将提供**番剧搜寻功能**。同时，考虑到版权问题，我之前私藏的所有视频全部转为私有，只有认证过的朋友们才有权限观看。


## 网站地址
 - [http://video.yimian.xyz](http://video.yimian.xyz/)
 - [https://acg.watch](https://acg.watch/)

## 定位
Acg.Watch视频站拥有三个发展定位：
 - 番剧资源辅助搜索
 - 多功能视频播放器
 - IoTcat的私藏视频站

## 发展状态
网站将持续开发，欢迎大家常来踩踩呀_(:з」∠)_



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}


## Reason

Since the first attempt to build a website in 18 years, the pursuit of streaming media playback services has always been my goal.


## History
From March 2018, I realized the release of the third episode of Sway Camp through Tencent Cloud Win Server 2012 for the first time, so that it can be accessed on the web. By September 2018, based on video.js, I built a video website for the first time, used Huawei Cloud object storage and mysql database for centralized management, and published it on video.yimian.xyz. In November 2018, with the Raspberry Pi 3B and an infrared camera, I realized 24-hour monitoring of the dormitory through push streaming. In February 2019, I purchased the domain name acg.watch and transferred the video site to it. Since then, my site’s video has been crawled many times. Due to the huge traffic cost of Huawei Cloud storage, I feel that I will temporarily stop publicly providing services. In November 2019, in the United Kingdom, I restructured the video site and stopped using Huawei Cloud Storage, a money-burning service, and turned to onedrive storage solutions. In addition, the new video station no longer has a backend, but uses the file-cache mechanism to automatically generate a data set by analyzing onedrive's video catalog. In August 2020, with the completion of the ushio user system, the video station began to provide users with personalized services, including cross-device playback and recording synchronization. In January 2021, the development direction of acg.watch is determined as a **multifunctional online player**, and the website will also provide a **fan drama search function**. At the same time, taking into account the copyright issue, all the videos that I have privately collected before are all turned into private ones, and only authenticated friends can watch them.


## Website address
 - [http://video.yimian.xyz](http://video.yimian.xyz/)
 - [https://acg.watch](https://acg.watch/)

## Positioning
Acg.Watch video station has three development positions:
 - Assisted search for fan drama resources
 - Multifunctional video player
 - IoTcat's private video station

## Development status
The website will continue to be developed, and you are welcome to step on it often_(:з」∠)_



{% raw %}</span>{% endraw %}