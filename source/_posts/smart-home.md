---
title: 在家中部署智慧家庭系统
titleEN: Deploy a smart home system at home
display: true
date: 2019-07-28
categories:
- tech
tags:
- iot
- smart-home
- LoRa
- WiFi
- Arduino
- ESP8266
- MQTT
---



{% raw %}<span class=".zh">{% endraw %}
基于Home Assisstant搭建综合家庭照明系统，多媒体系统，水流系统的智慧家庭。技术点：天猫精灵交互，LoRa通信，MQTT协议，frp内网穿透，NAS存储，拨动开关电路改造。

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Based on Home Assisstant, build a smart home with integrated home lighting system, multimedia system and water flow system. Technical points: Tmall Genie interaction, LoRa communication, MQTT protocol, FRP intranet penetration, NAS storage, and toggle switch circuit transformation.
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

结合所学知识，运用前沿技术，造福生活，是我长期以来的不懈追求。为了让家人体验到更加稳定、舒适智能的生活方式，同时也为了巩固憨实先前在学校smartfarm项目和我自己的ushio系统中所积累的技术基础以及架构经验，我决定在出国前，使用20到23整天时间，重构家中老旧的物联网系统。采用分层架构和面向接口、面向测试、**面向文档**开发原则，以**稳定性(Available)**，**可靠性(Reliable)**为最优先指标，搭建一个运行目标3年以上的高度模块化的，易于远程操控的，开源的家庭软件硬件智能传感控制系统。

## 0 架构综述


## 1 硬件设计

### 1.1 单片机选材
使用Arduino UNO作为计算单元。一方面，Arduino Uno拥有高可靠性，我之前的智慧窗帘系统使用Arduino Uno作为主控板，平稳运行1年半未出现硬件问题。另一方面，Arduino Uno拥有较大的RAM，无需为了争夺RAM而在单片机编程上煞费苦心。

Arduino UNO的缺陷主要是价格高，但是为保障长期稳定运行，这个成本是必要的。

### 1.2 WiFi通信模块选材

使用ESP-01作为WiFi的通信模块。主要原因是之前学校课程使用过ESP-01搭建遥控小车，对其工作方式和性能比较了解，降低开发成本。

### 1.3 LoRa通信模块选材

使用**安信可 LORA RA-02 LORA**作为LoRa节点和LoRa网关通信模块。原因是surf项目使用的就是这个模块，比较了解它。

### 1.4 智能音箱选材

智能音箱作为此物联网系统人机交互的最主要界面，发挥着举足轻重的作用。经研究，我使用天猫精灵方糖R作为家用智能音箱。一方面，天猫精灵的性价比摆在那里，非常便宜。第二，与小米开发小爱同学不同，阿里开发天猫精灵的目的是提供平台，它允许开发者以各种形式接入其网络，这一点对我至关重要。

### 1.5 灯拨动开关

初期设想: 单向控制+复位器。
实际实现：将原有单开改造为双开，一路与继电器串联，另一路与两个pin口相连。


## 2 通信设计

![网络拓扑图](https://api.yimian.xyz/img/?path=imgbed/img_43b85bd4_1096x660_8_null_normal.png)

采用WiFi+LoRa两种通信模式。在需要高速高质量通信的场景，如天猫精灵，手机，笔记本，使用WiFi作为通信手段。在WiFi信号不稳定的地方，使用LoRa进行通信。使用MQTT为应用层协议。

## 3 主控系统设计

使用python3开源项目Home Assistant 为基础搭建本项目的主控系统。

## 4 多媒体系统设计

多媒体主要由天猫精灵提供。此外，通过小米盒子，家庭网盘中的视频，图片，音乐实现了电视与音响上的播放。

## 5 云端支持系统设计

dns.yimian.xyz提供dns解析服务。

## 6 NAS存储系统设计

通过挂载从老电脑上拆卸的闲置500G机械硬盘到老IBM服务器，实现存储系统的搭建。
对局域网内，由于家里都是win系统，使用smb作为共享协议实现文件传输，支持局域网内挂载。速度稳定，全网读写10MB/s左右。对外网访问，通过http，frp反代实现，但速度较慢。

------------------------
2020.6 更新

## RNN实现对灯控制

基于先前积累的人体传感器数据，通过LSTM模型，使用keras训练神经网络，实现对开灯状态的预测。




{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}


Combining the knowledge I have learned and using cutting-edge technology to benefit life has been my unremitting pursuit for a long time. In order to let my family experience a more stable, comfortable and intelligent lifestyle, and to consolidate the technical foundation and architecture experience accumulated in the school smartfarm project and my own ushio system, I decided to use 20 to 23 before going abroad. All day long, reconstruct the old IoT system at home. Adopt a layered architecture and interface-oriented, test-oriented, and **document-oriented** development principles, with **Available** and **Reliable** as the highest priority indicators to build an operational target 3. A highly modular, easy-to-remote control, open source home software and hardware intelligent sensor control system for more than years.

## 0 Architecture overview


## 1 Hardware Design

### 1.1 Single Chip Microcomputer Material Selection
Use Arduino UNO as the calculation unit. On the one hand, Arduino Uno has high reliability. My previous smart curtain system used Arduino Uno as the main control board, and it ran smoothly for one and a half years without hardware problems. On the other hand, Arduino Uno has a larger RAM, so there is no need to bother to program the microcontroller in order to compete for RAM.

The main disadvantage of Arduino UNO is its high price, but this cost is necessary to ensure long-term stable operation.

### 1.2 WiFi communication module selection

Use ESP-01 as the WiFi communication module. The main reason is that the ESP-01 has been used to build a remote control car in the previous school courses, and I have a better understanding of its working methods and performance to reduce development costs.

### 1.3 LoRa communication module selection

Use **Anxinke LORA RA-02 LORA** as the communication module between LoRa node and LoRa gateway. The reason is that this module is used in the surf project, so I understand it better.

### 1.4 Smart speaker selection

As the most important interface for human-computer interaction in this Internet of Things system, smart speakers play a pivotal role. After research, I use Tmall Elf Sugar R as a home smart speaker. On the one hand, the price/performance ratio of Tmall Genie is very cheap. Second, unlike Xiaomi’s development of Xiao Ai, the purpose of Ali’s development of Tmall Genie is to provide a platform that allows developers to access its network in various forms, which is very important to me.

### 1.5 Light toggle switch

Initial idea: one-way control + reset device.
Actual realization: The original single-opening is transformed into double-opening, one is connected in series with the relay, and the other is connected with two pin ports.


## 2 Communication Design

![Network Topology Diagram](https://api.yimian.xyz/img/?path=imgbed/img_43b85bd4_1096x660_8_null_normal.png)

Two communication modes of WiFi+LoRa are adopted. In scenarios that require high-speed and high-quality communication, such as Tmall Genie, mobile phones, and notebooks, use WiFi as a means of communication. In places where the WiFi signal is unstable, use LoRa for communication. Use MQTT as the application layer protocol.

## 3 Main control system design

Use the python3 open source project Home Assistant as the basis to build the main control system of this project.

## 4 Multimedia system design

Multimedia is mainly provided by Tmall Genie. In addition, through the Xiaomi box, the video, pictures, and music in the home network disk can be played on the TV and stereo.

## 5 Cloud support system design

dns.yimian.xyz provides dns resolution service.

## 6 NAS storage system design

By mounting the idle 500G mechanical hard disk removed from the old computer to the old IBM server, the storage system is built.
In the local area network, since the home is a win system, smb is used as a sharing protocol to realize file transfer and supports mounting in the local area network. The speed is stable, and the whole network reads and writes about 10MB/s. Access to the external network is realized through http and frp reverse generation, but the speed is slow.

------------------------
2020.6 update

## RNN realizes light control

Based on the previously accumulated human sensor data, the LSTM model is used to train the neural network using keras to realize the prediction of the light state.

{% raw %}</span>{% endraw %}
