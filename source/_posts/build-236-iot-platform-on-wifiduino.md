---
title: wifiduino搭建236宿舍物联网平台
titleEN: Use wifiduino to build 236 dormitory IoT platform
date: 2018-09-08
categories:
- tech
tags:
- iot
- Arduino
---


{% raw %}<span class=".zh">{% endraw %}
重新搭建236的IoT底层平台，并通过Blinker手机控制，实现操控监视。平台拥有很强的扩展性及可移植性，目前实现了夜间自动灯光，火灾烟雾报警，床帘内：上床小夜灯开，自动通风，LED自动感应阅读状态等设计。

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Re-build the 236 IoT underlying platform and control it through Blinker mobile phone to realize control and monitoring. The platform has strong scalability and portability. At present, it has realized the design of automatic lighting at night, fire and smoke alarm, and bed curtain: the night light on the bed, automatic ventilation, and LED automatic sensing reading status.

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
## 搭建缘由

早在大一上学期，意外接触Arduino，开始了解单片机。17年11到12月份，曾利用Arduino uno 3搭建了一台功能简易的自动控制平台，主要实现了由红外遥控器控制床帘Light以及小夜灯的功能。在运行一个半月后，由于一次上传代码时意外短路，导致单片机烧毁，自此系统报废，但线路依旧保留。

考虑到第一次搭建完全新手，代码缺少必要注释，更有通向床帘的数十根线路完全缠绕在一起，无法分清具体那几根控制什么传感器或设备，故设重建计划暂时搁置。

半年后的暑假，参加欧朗中国的IETE项目，课程中与公司研发组的软件和硬件工程师愉快得体验了一些单片机的应用研发，了解了单片机及物联网的基础组成及发展现状，在工作闲余，对原有线路进行了测试，分类，贴标签，使其得以正常使用。

8月份，项目结束，回到家中。考虑到家中原有太阳能需加水后需手动关闭，时常发生晚上洗澡后加水忘关情况，造成大量水资源浪费。于是结合欧朗所学，以及自己的实践经验，搭建了一套基于wifiduino和电磁阀的太阳能自动加水系统。为了照顾年老的姥姥方便夜间上厕所，在走廊过道利用原有废弃有线网络线路，搭建了与手动开关密切集合的自动感应开灯系统。由此收获了许多关于家用线路的架设经验。

回到苏州，考虑到一年来的相关经验，认为是时候尝试搭建一套可长期使用的商品级的强扩展性的IoT系统，于是…start搞事情

## 搭建经历

搭建初期，一切还算顺利。但是随着系统逐渐趋于完善，代码逐渐复杂，经典的Arduino式软硬件兼容问题又逐渐开始捣乱啦~

首先遇到的问题是（大概是由于esp8266与wifiduino的一些神奇的勾当）当把代码通过usb传给wifiduino的时候，代码运行是正常的，但是在断电重启或者Reset后，它就死掉了。。。而且，这个问题只在上传占用了大约十个左右Digital通信口的程序之后才出现，如果只是上传简单的示例程序则运行正常，，最后从淘宝钓了一只路由器用的USB-DC9V升压线，用其持续供电，才确保了板子的正常运行。

遇见的第二个问题也是很神奇。就是，wifiduino在连接tx与rx后竟然无法上传代码！！！当时我一直以为是板子坏掉了

本来是只有一块板子的，但是当他装载了太多控制端之后，大概是死掉了，wifi无法正常连接Blinker..于是我只用它作为控制器，然后将另一块板子连接wifi，将接受信息通过串口传递给主板子执行。于是，运行终于正常了，，，莫名想到了欧朗当时考试的译码器

## 主要功能

功能的话目前看来也不是很多，4只传感：2只超神波测距，1只光敏，1只烟雾，4个控制端：1只床外探照灯ledB, 1只小夜灯，1只床头灯，1个小风扇。实现的话，无非就是其相互配合，目前可以准确识别我的存在位置4个，室友的存在位置1个。然后配合行为习惯编程调整灯与风扇。

未来的话，还打算逐步实现–传感层：对室内是否有人的识别 智能层：对室友在宿舍时间规律的学习（神经网络） 控制层：空调红外控制，基于esp8266的微型继电器对宿舍大灯的控制，以及，快乐的话考虑自动养一株辣椒什么的…


## 最后

最后附上两个板子的代码，，还会更新的哦//祝生活愉快啦~ 
代码：https://github.com/IoTcat/archive/tree/b43dd5c01c3b38cde97bbdbb87bfc51847303e58/Arduino_project/236project

--------------------

## 2019.2.19更新：

板子运行超过150天，一切运行正常。
出现过几次分钟级别的控制失效事件，怀疑宿舍电网供压不稳导致，事后均自动修复。

-------------------

## 2019.2.28更新

上文代码链接已弃用，如有兴趣，可查看由其代码开发的[wIoT项目][1]！

------------

## 2019.6.12更新

稳定运行611天18小时32分钟，因我要搬离宿舍，正式退役！
![236-iot](https://api.yimian.xyz/img/?path=imgbed/img_39e7f50_3968x1984_8_null_normal.jpeg)

-------------
已完结


  [1]: https://github.com/iotcat/wIoT

{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}
## Build reason

As early as the first semester of my freshman year, I accidentally came into contact with Arduino and started to understand microcontrollers. From November to December 2017, I used Arduino uno 3 to build a simple automatic control platform, which mainly realized the function of controlling the bed curtain Light and night light by the infrared remote control. After running for a month and a half, due to an accidental short circuit when uploading the code once, the single-chip microcomputer was burned out. Since then, the system has been scrapped, but the circuit remains.

Considering that the code is completely new to the first time, the code lacks necessary comments, and dozens of lines leading to the bed curtain are completely entangled, and it is impossible to distinguish which sensors or devices are controlled by the specific ones. Therefore, the reconstruction plan is temporarily shelved.

In the summer vacation half a year later, I participated in the IETE project of Oulang China. During the course, I had a pleasant experience with the software and hardware engineers of the company’s R&D team in the application and development of some single-chip microcomputers, and learned about the basic composition and development status of single-chip microcomputers and the Internet of Things. In addition, the original circuit was tested, classified, and labeled to enable it to be used normally.

In August, the project ended and I returned home. Considering that the original solar energy in the home needs to be turned off manually after adding water, it often happens that the water is forgotten to turn off after taking a bath at night, resulting in a lot of water waste. So combined with what Oulang has learned and his own practical experience, he built a solar automatic water filling system based on wifiduino and solenoid valve. In order to take care of the elderly grandma and facilitate the use of the toilet at night, the original abandoned wired network lines were used in the corridors to build an automatic induction light-on system closely integrated with the manual switch. This has gained a lot of experience in the installation of home wiring.

Back in Suzhou, considering the relevant experience in the past year, I thought it was time to try to build a long-term commodity-level and highly scalable IoT system, so...start doing things

## Build experience

At the beginning of the construction, everything went smoothly. However, as the system gradually improves and the code becomes more complex, the classic Arduino-style software and hardware compatibility problems are gradually starting to mess up~

The first problem encountered is (probably due to some magical activities between esp8266 and wifiduino) when the code is transferred to wifiduino via usb, the code runs normally, but after a power failure or reset, it will die . . . Moreover, this problem only appeared after uploading a program that occupies about ten Digital communication ports. If you only upload a simple sample program, it runs normally. Finally, I fished a USB-DC9V boost cable for routers from Taobao. , Use its continuous power supply to ensure the normal operation of the board.

The second problem encountered is also very magical. That is, wifiduino can't upload code after connecting tx and rx! ! ! I always thought the board was broken

Originally there was only one board, but when he loaded too many consoles, it probably died and the wifi could not connect to Blinker.. So I only used it as a controller, and then connected another board to wifi, and it would accept The information is passed to the motherboard for execution through the serial port. As a result, the operation was finally normal,,, inexplicably thought of the decoder of Oulang at that time.

## The main function

In terms of functions, it seems that there are not many at present. 4 sensors: 2 Ultra Sure Wave Ranging, 1 photosensitive, 1 smoke, 4 control terminals: 1 outdoor searchlight ledB, 1 night light, 1 bed Headlight, 1 small fan. If it is realized, it is nothing more than their mutual cooperation. Currently, 4 locations of my existence and 1 location of my roommate can be accurately identified. Then program and adjust the lights and fans in accordance with behavior habits.

In the future, it is planned to be implemented gradually-Sensing layer: Recognition of whether there are people in the room. Intelligent layer: Learning the time rules of roommates in the dormitory (neural network). Control layer: Air-conditioning infrared control, based on esp8266 miniature relay for dormitory headlights Control, and, if you are happy, consider automatically raising a pepper plant...


## At last

Finally, the codes of the two boards are attached, and they will be updated.//Happy life~
Code: https://github.com/IoTcat/archive/tree/b43dd5c01c3b38cde97bbdbb87bfc51847303e58/Arduino_project/236project

--------------------

## 2019.2.19 update:

The board has been running for more than 150 days and everything is running normally.
There have been several minute-level control failure events. It is suspected that the dormitory's power grid is not stable, and they are automatically repaired afterwards.

-------------------

## 2019.2.28 update

The above code link has been deprecated, if you are interested, you can check the [wIoT project][1] developed by its code!

------------

## 2019.6.12 update

Stable operation for 611 days, 18 hours and 32 minutes, officially retired!
![236-iot](https://api.yimian.xyz/img/?path=imgbed/img_39e7f50_3968x1984_8_null_normal.jpeg)

-------------
The END.
{% raw %}</span>{% endraw %}