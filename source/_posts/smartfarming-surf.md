---
title: 2019 SURF SmartFarming Proj 架构说明
titleEN: 2019 SURF SmartFarming Proj Architecture Description
date: 2019-07-26
display: true
categories:
- tech
tags:
- LoRa
- smart-farming
- iot
- Arduino
- MQTT
---


{% raw %}<span class=".zh">{% endraw %}
本文详细介绍了XJTLU大学2019暑期科研SmartFarming Proj物联网架构的设计思路，实施情况以及缺陷反思。

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
This article introduces in detail the design ideas, implementation status and defect reflections of the SmartFarming Proj IoT architecture of XJTLU University's 2019 summer scientific research.
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

## 1 背景

### 1.1 需求
为了探究农业物联网技术的可行性，Alam Mohammed导师希望我们能够提供一个**稳定(Available)**并**可靠(Reliable)**的物联网系统，以实现对农田的智能监控和管理。这个系统将能够适时地探测土壤以及空气中与植物健康相关的参数，处理并存储这些数据(由Alam提出)。同时，自动化控制的灌溉功能(由Caleb提出)以及一些数据展示方法(由Alam提出的可选需求)也被期待由本系统提供。

### 1.2 定位
由于是针对农业物联网设计的小型科研项目，项目的目标是对农业物联网的可行性进行探究，愿景是模拟最普遍的小型农业物联网应用场景。因此本架构的定位是**适用于大部分具备感知，控制和展示功能的小型农业物联网工程**。



## 2 名词解释

> + `MQTT`: MQTT消息队列遥测传输(Message Queuing Telemetry Transport)是ISO 标准(ISO/IEC PRF 20922)下基于发布/订阅范式的消息协议。它工作在 TCP/IP协议族上，是为硬件性能低下的远程设备以及网络状况糟糕的情况下而设计的发布/订阅型消息协议[1]。

> + `LoRa`: LoRa是当前市场上的一种新兴技术，其在1 GHz以下的公共频段中运行，用于远距离低功耗通信[2]。

## 3 设计目标

### 3.1 实现功能

本架构功能性需求主要包括土地数据采集，气象数据采集，灌溉系统控制，与无人机小组系统进行交互，网页控制台(可查看实时和历史传感数据，指标数据；能够控制系统)。

### 3.2 性能指标
+ `通信范围(测试)`：半径不低于1km
+ `通信范围(生产)`：半径不低于3km
+ `延时`：平均小于1s
+ `超时率`：不超过5%
+ `资源占用`：节点RAM不超过2k
+ `运行周期`：1分 (测试) | 15分 (生产)

## 4 系统环境

### 4.1 相关软件及硬件

{% raw %}

<div style="overflow:scroll;">
<table >
<tr>
    <td style="vertical-align: middle;text-align: center;"><strong>节点名称</strong></td>
    <td style="vertical-align: middle;text-align: center;"><strong>硬件设施</strong></td>
    <td style="vertical-align: middle;text-align: center;"><strong>软件集群</strong></td>
</tr>


<tr>
    <td rowspan="6" style="vertical-align: middle;text-align: center;">土地节点<br/>Ground Nodes</td>
    <td>Arduino Nano</td>
    <td>Arduino.h</td>
</tr>
<tr>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.11.58a54915TdUHKS&id=556174103413&ns=1&abbucket=14#detail">SX1278 LORA模块</a></td>
    <td>SPI.h</td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.20.161f53ed47xg5U&id=41414863412&ns=1&abbucket=10">LM35DZ 温度传感</a></td>
    <td><a href="https://github.com/sandeepmistry/arduino-LoRa">LoRa.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-21581912015.41.6c425535FUUqU7&id=37365775741&rn=b1c1a8a7f17260619669f001aa3241bf&abbucket=14&skuId=4138700612305">土壤湿度传感</a></td>
    <td><a href="https://github.com/IoTcat/LoRa-socket">LoRa-Socket.h</a></td>
</tr>
<tr>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.16.21461532U3rUws&id=541730394024&ns=1&abbucket=14#detail">四分电磁阀</a></td>
    <td><a href="https://github.com/IoTcat/LoRa-mqtt">LoRa-mqtt.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/tomstewart89/Vector">vector.h</a></td>
</tr>


<tr>
    <td rowspan="7" style="vertical-align: middle;text-align: center;">气象站节点<br/>Air Station</td>
    <td>Arduino Nano</td>
    <td>Arduino.h</td>
</tr>
<tr>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.11.58a54915TdUHKS&id=556174103413&ns=1&abbucket=14#detail">SX1278 LORA模块</a></td>
    <td>SPI.h</td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.1.1b456f1dTRXYJd&id=576191025158&areaId=320500&user_id=738263294&cat_id=2&is_b=1&rn=14dcb16f28668aa5ca15c5be0f88d092">BME280 温度，湿度，大气压强传感</a></td>
    <td><a href="https://github.com/sandeepmistry/arduino-LoRa">LoRa.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-21581912015.32.2fe555358wswJr&id=521238059334&rn=233756c78897999fd97ca2dd4f649071&abbucket=14">GY-30 光强传感</a></td>
    <td><a href="https://github.com/IoTcat/LoRa-socket">LoRa-Socket.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-21581912015.52.23e05535hDDYEB&id=13302081252&rn=ced14f01f4a9179e7b090c544cf5836a&abbucket=14">MQ-135 空气质量传感</a></td>
    <td><a href="https://github.com/IoTcat/LoRa-mqtt">LoRa-mqtt.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-21581912015.52.270b5535itNYUg&id=13673403530&rn=418dfd01fe7ae4ce8b775fc271d9886a&abbucket=14">MQ-7 一氧化碳传感</a></td>
    <td><a href="https://github.com/tomstewart89/Vector">vector.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-21581825912.37.16ca535042HtRT&id=41536690942&rn=a0912ce05addd045044d65bc796797e8&abbucket=14">雨量传感</a></td>
    <td></td>
</tr>


<tr>
    <td rowspan="8" style="vertical-align: middle;text-align: center;">LoRa 网关<br/>LoRa Gateway</td>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.58.6c20435c9AhMz2&id=555750159003&ns=1&abbucket=14#detail">SX1278</a></td>
    <td>Arduino.h</td>
</tr>
<tr>
    <td></td>
    <td>SPI.h</td>
</tr>
<tr>
    <td></td>
    <td>WiFi.h</td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/sandeepmistry/arduino-LoRa">LoRa.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/IoTcat/LoRa-socket">LoRa-Socket.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/IoTcat/LoRa-mqtt">LoRa-mqtt.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/tomstewart89/Vector">vector.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/knolleary/pubsubclient">PubSubClient.h</a></td>
</tr>


<tr>
    <td rowspan="5" style="vertical-align: middle;text-align: center;">内网控制器/MQTT代理<br/>Controler/MQTT Proxy</td>
    <td>树莓派3B - RASPBIAN</td>
    <td>Python3.7</td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.9.791b1000Beu0tp&id=555610012670&cm_id=140105335569ed55e27b&abbucket=14">直流变频水泵</a></td>
    <td>NodeJS</td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-mqtt-proxy">sf-mqtt-proxy@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-pump">sf-pump@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/forever">forever@npm</a></td>
</tr>



<tr>
    <td rowspan="6" style="vertical-align: middle;text-align: center;">云服务器<br/>Cloud Server</td>
    <td>华为云主机 - Centos7.4</td>
    <td>Nginx/1.12.2</td>
</tr>
<tr>
    <td></td>
    <td>NodeJS/12.4.0</td>
</tr>
<tr>
    <td></td>
    <td>Redis/3.2.12</td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-mqtt-broker">sf-mqtt-broker@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-web-api">sf-web-api@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/forever">forever@npm</a></td>
</tr>

<tr>
    <td rowspan="1" style="vertical-align: middle;text-align: center;">数据库<br/>Database</td>
    <td>华为云数据库</td>
    <td>MySQL 5.7.23</td>
</tr>

</table>
</div>
{% endraw %}

### 4.2 数据规模预估
按照生产场景预估，每15分钟产生一组数据集合，一组数据集合约占用253-291字节。按照291计算，每天将新增27.93KB数据。

## 5 设计思路

### 5.1 理念

 - 面向文档
 - 面向接口
 - 面向测试

### 5.2 关键问题
 - 土地节点RAM资源稀缺，只有2K
 - LoRa通信采用433MHz，单信道收发，干扰多
 - 服务器需要采集聚合来自多节点的散列数据
 - 预留与无人机AI小组的交互方法
 - 实时消息向前端浏览器推送

### 5.3 方案选择
为了**优先**确保通信以及服务的**稳定性**和**可拓展性**，我们选取**分层模型**作为架构的设计模式。整个系统分成多个层级，层级之间具备必要的交互行为。每个层级都独立运行，崩溃时会迅速重启，具备高度的可靠性。

安全上，采取**内外网隔离**的方法。内网中考虑到部分设备计算资源稀缺，与内网服务器的交互采用不加密的通信模式。内网服务器通过SSL加密的方式与云服务器进行交互。为了确保客户端的资料安全，云服务器API只接受具备SSL加密的HTTP和WebSocket请求。

## 6 架构设计

### 6.1 基础介绍

本架构的主要目的是提供一个**稳定(Available)**并**可靠(Reliable)**的物联网系统，通过采集农田中的实时数据，结合通过无人机采集的图片以及CNN判断的植物健康情况，实现对灌溉系统以及植物健康状况的智能管理。本架构理论上适用于大部分农场环境。测试环境半径2~5km(取决于天线)以内，风力3级以下。本系统通过传感器获取农田数据，通过晶体管电路，继电器等控制灌溉系统，通过网页与API与管理者进行交互。

### 6.2 系统层级图

![Smart Farm 系统分层结构图](https://api.yimian.xyz/img/?path=imgbed/img_c46f5639_577x906_8_null_normal.jpeg)

此图展示了此架构的抽象层级结构。正如其所指出的，此分层架构可明确为**感知层**，**网络层**，**应用层**三个横向操作层以及一个纵向**错误处理层**。

其中，**感知层**又可细化为**环境层**以及**硬件层**。环境层中包含植物，土壤，空气，水流等我们要检测和控制的自然物体，硬件层通过传感器、控制器等人造电气设备为系统对自然要素的交互行为（检测，控制）提供了底层技术可行性。当感知层实现对自然信息的交互后，相应的数字信息被传往网络层进行通信。相应的，感知层也会从网络层接受相应的控制信息，并根据这些指令做出相应的控制行为。

**网络层**分为三层。其中最低一层为**预处理层**，它的主要任务是对感知层采集的数据进行打包处理，转变成网络流通所适合的形式，如套接字。因此，预处理层需要少量的计算存储资源，比如单片机，EEPROM等。经过预处理层的封装后，数据被传往**物理层**。基于物理层中的网关、路由器等设备，这些数据包得以被有秩序的分发和传递。**通信层**中的MQTT协议的应用，使得这些数据包分发的管理更加高效与便利。此外，通信层中QoS服务质量检测体系的实施也使得网络层的性能更加的容错和可靠。

**应用层**主要负责一些应用层面的服务于业务逻辑，比如数据分析，事件处理等。在应用层的最底端，**服务层**在长期的运转着。服务层是应用层中最近接网络层的部分，它的主要目的是实时处理从网络层传入的数据，并对相应的请求及错误事件进行快速响应。同时，服务层也负责将传感器采集的数据进行整理分析并传递到**数据库**层进行存储。为了保证服务的可靠性，服务层的实现程序被注册为系统服务并由专门的守护进程进行守护。与服务层的长期运行不同，**业务层**则是按需唤起。当界面层有新的请求传入或服务层发生特定的事件时，业务层将会被调用并处理它们。除了一些基础的数据分析外，业务层也有权限向AI层进行分析请求。**AI层**通过分析从无人机传回的图像数据后，会传回一个判断结果给业务层。根据请求的具体内容，业务层会将图像识别结果，历史传感器数据等进行整理，并传递到界面层。**界面层**则主要用来提供不同形式的接口，比如HTTP接口和WebSocket接口，以方便客户端调用。

### 6.3 系统拓扑图

![Smart Farm 系统拓扑图](https://api.yimian.xyz/img/?path=imgbed/img_27df1756_1426x710_8_null_normal.png)

从拓扑结构来看，如上图所示，整个系统物理上可划分为土地节点，气象节点，LoRa网关，内网服务器，云服务器，数据库和用户终端。

从功能机制上看，整个系统包含：传感器模块，LoRa通信模块，LoRa网关模块，MQTT-Proxy代理模块，水泵控制模块，MQTT+数据处理模块，web接口模块，守护进程模块和数据库模块。

***土地节点***
土地节点部署于不同区域的农田中，用于探测土壤温度，湿度参数，并能够提供对相应位置水流电磁阀的控制。土地节点使用Arduino Nano作为计算单元，使用LoRa作为通信方式连接LoRa网关(和其它节点)，使用电池供电。其数量较多，工作环境恶劣，无线通信不稳定，是系统中最大的不确定性来源。

***气象节点***
气象节点部署于农田特定位置，用于探测空气温度，湿度，大气压，降雨量，光照，NH3浓度，CO浓度等气象参数。气象节点使用Arduino Nano作为计算单元，使用LoRa作为通信方式连接LoRa网关(和土地节点)，使用电池或有线供电。其工作环境较为恶劣，无线通信质量一般。

***LoRa网关***
LoRa网关部署于室内，为扩大有效通信半径，其天线可延伸至室外。LoRa网关通过LoRa连接各土地节点和气象节点，通过WiFi连接内网服务器。LoRa网关能够将通过LoRa传入的socket包转换为mqtt消息并传递给内网服务器，以及将内网服务器传来的mqtt消息转换为socket包通过LoRa发送至指定节点。

***内网服务器***
内网服务器是一个树莓派3B，它包含三个功能模块：MQTT-Proxy代理模块，水泵控制模块以及守护进程模块。

*MQTT-Proxy代理模块*能够接收由LoRa网关通过WiFi发送的mqtt消息，对其进行SSL加密并转发至云服务器。同时，MQTT-Proxy代理模块也将接受指定的来自云服务器的mqtt消息，将其解密并转发至LoRa网关。

*水泵控制模块*通过树莓派的GPIO通过继电器控制水泵的状态。与水泵控制模块直接与云服务器进行mqtt通信，不经过MQTT-Proxy代理。

*守护进程模块*运行在Linux上，用于监视MQTT-Proxy代理模块和水泵控制模块。当探测到模块停止运行时，守护进程模块会及时重启这些模块，以确保服务的稳定性和连续性。

***云服务器***
云服务器运行在位于北京的华为云上，包含MQTT+数据处理模块，web接口模块和守护进程模块。

*MQTT+数据处理模块*包含了层级结构中的Service层和Business层。这个模块通过mqtt与内网进行通信，通过mqtt, redis与web接口模块(和AI模块)进行交互。当收到来自内网的各种散列的数据后，本模块会自动对它们进行聚合，整理成一条一条的数据，存入数据库，并通过redis推送给web接口模块。此外，本模块会定时向各节点发送请求以获取它们的数据，这些请求将被追踪以计算延时。

*web接口模块*提供一系列的HTTP和WebSocket接口。这些接口可用于获取数据，发送指令，刷新数据以及获取推送消息。

*守护进程模块*运行在Linux上，用于监视MQTT+数据处理模块和web接口模块。当探测到模块停止运行时，守护进程模块会及时重启这些模块，以确保服务的稳定性和连续性。

## 7 模块说明

### 7.1 LoRa通信模块
LoRa通信模块用于在单信道情况下实现稳定可靠的socket通信。本模块包含LoRa-socket和LoRa-mqtt。

LoRa-socket是在LoRa-Arduino的基础上进行了数据包的封装，实现了简单的udp和tcp通信，让传统的LoRa通信更加可靠。通过在数据包的head添加收发ip地址，以及在数据包的最后添加hash校验值，LoRa-socket支持点对点通信和广播通信，并且具有强大的噪音处理能力和数据防篡改能力。
***项目地址***：[iotcat/LoRa-socket](https://github.com/IoTcat/LoRa-socket)

LoRa-mqtt是在LoRa-socket基础上对mqtt协议进行的一个简单再现。基于udp和tcp，LoRa-mqtt支持qos为0和1的mqtt通信。
***项目地址***：[iotcat/LoRa-mqtt](https://github.com/IoTcat/LoRa-mqtt)

### 7.2 MQTT-Proxy代理模块
本模块运行在内网服务器，实现了对内网mqtt的加密转发。
***项目地址***：[iotcat/sf-mqtt-proxy](https://www.npmjs.com/package/sf-mqtt-broker)

### 7.3 水泵控制模块
本模块运行在内网服务器，实现了通过GPIO对继电器水泵的控制。
***项目地址***：[iotcat/sf-pump](https://www.npmjs.com/package/sf-pump)

### 7.4 mqtt+数据处理模块
本模块运行在云服务器，实现了对来自底层mqtt消息的数据聚合，处理和存储。
***项目地址***：[iotcat/sf-mqtt-broker](https://www.npmjs.com/package/sf-mqtt-broker)

### 7.5 web接口模块
本模块运行在云服务器，实现了功能性接口的提供。
***项目地址***：[iotcat/sf-web-api](https://www.npmjs.com/package/sf-web-api)


## 8 开发文档

### 8.1 mqtt主题
 - [mqtt主题列表](https://doc.smartfarm.yimian.xyz/#/home?id=mqtt)

### 8.2 http接口
 - [http接口文档](https://doc.smartfarm.yimian.xyz/#/home?id=api-http)

### 8.3 websocket接口
 - [websocket接口文档](https://doc.smartfarm.yimian.xyz/#/home?id=api-websocket)


## 9 运行状态

### 9.1 系统延时

![qos](https://api.yimian.xyz/img/?path=imgbed/img_b36d5030_1806x546_8_null_normal.png)

上图展示了土地节点(左)，气象节点(右)，水泵(下)的延时统计折线图。由图可以看出，土地节点的平均延时在730ms左右，气象节点延时在900ms左右，水泵的延时较低，在45ms左右。

### 9.2 传感器数据
[点击这里查看2019-7-31的气象传感器数据](https://smartfarm.yimian.xyz/chart-station.html?f=1564484461&t=1564570861)



-------------------------------
**Reference List:**

[1] OASIS, (2015,12.10). MQTT Version 3.1.1 Plus Errata 01 [Online]. Available: https://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html

[2] Sinha, R.S., Wei, Y. and Hwang, S.H., "A survey on LPWA technology: LoRa and NB-IoT", in Ict Express, 3(1), pp.14-21, 2017.



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}
## 1 Background

### 1.1 Requirements
In order to explore the feasibility of agricultural Internet of Things technology, instructor Alam Mohammed hopes that we can provide a **Available** and **Reliable** Internet of Things system to realize intelligent monitoring and management of farmland. This system will be able to timely detect the parameters related to plant health in the soil and the air, process and store these data (proposed by Alam). At the same time, the automatic control irrigation function (proposed by Caleb) and some data display methods (optional requirements proposed by Alam) are also expected to be provided by this system.

### 1.2 Positioning
As it is a small scientific research project designed for the agricultural Internet of Things, the goal of the project is to explore the feasibility of the agricultural Internet of Things, and the vision is to simulate the most common small-scale agricultural Internet of Things application scenarios. Therefore, the positioning of this architecture is **applicable to most small agricultural IoT projects with sensing, control and display functions**.



## 2 Glossary

> + `MQTT`: MQTT Message Queuing Telemetry Transport is a message protocol based on the publish/subscribe paradigm under the ISO standard (ISO/IEC PRF 20922). It works on the TCP/IP protocol suite and is a publish/subscribe message protocol designed for remote devices with low hardware performance and poor network conditions [1].

> + `LoRa`: LoRa is an emerging technology in the current market, which operates in the public frequency band below 1 GHz for long-distance low-power communication [2].

## 3 Design goals

### 3.1 Implementing functions

The functional requirements of this architecture mainly include land data collection, weather data collection, irrigation system control, interaction with the drone group system, web console (can view real-time and historical sensor data, index data; be able to control the system).

### 3.2 Performance indicators
+ `Communication range (test)`: the radius is not less than 1km
+ `Communication range (production)`: the radius is not less than 3km
+ `Delay`: average less than 1s
+ `Timeout rate`: no more than 5%
+ `Resource occupation`: Node RAM does not exceed 2k
+ `Run cycle`: 1 minute (test) | 15 minutes (production)


## 4 System Environment

### 4.1 Related software and hardware

{% raw %}
<div style="overflow:scroll;">
<table>
<tr>
    <td style="vertical-align: middle;text-align: center;"><strong>Node name</strong></td>
    <td style="vertical-align: middle;text-align: center;"><strong>Hardware facilities</strong></td>
    <td style="vertical-align: middle;text-align: center;"><strong>Software cluster</strong></td>
</tr>


<tr>
    <td rowspan="6" style="vertical-align: middle;text-align: center;">Ground Nodes<br/>Ground Nodes</td>
    <td>Arduino Nano</td>
    <td>Arduino.h</td>
</tr>
<tr>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.11.58a54915TdUHKS&id=556174103413&ns=1&abbucket=14#detail">SX1278 LORA module</a></td >
    <td>SPI.h</td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.20.161f53ed47xg5U&id=41414863412&ns=1&abbucket=10">LM35DZ temperature sensor</a></td>
    <td><a href="https://github.com/sandeepmistry/arduino-LoRa">LoRa.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-21581912015.41.6c425535FUUqU7&id=37365775741&rn=b1c1a8a7f17260619669f001aa3241bf&abbucket=14&skuId=4138700612305">土壤湿度传感</a></td>
    <td><a href="https://github.com/IoTcat/LoRa-socket">LoRa-Socket.h</a></td>
</tr>
<tr>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.16.21461532U3rUws&id=541730394024&ns=1&abbucket=14#detail">Four-point solenoid valve</a></a></a> td>
    <td><a href="https://github.com/IoTcat/LoRa-mqtt">LoRa-mqtt.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/tomstewart89/Vector">vector.h</a></td>
</tr>


<tr>
    <td rowspan="7" style="vertical-align: middle;text-align: center;">weather station node<br/>Air Station</td>
    <td>Arduino Nano</td>
    <td>Arduino.h</td>
</tr>
<tr>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.11.58a54915TdUHKS&id=556174103413&ns=1&abbucket=14#detail">SX1278 LORA module</a></td >
    <td>SPI.h</td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.1.1b456f1dTRXYJd&id=576191025158&areaId=320500&user_id=738263294&cat_id=2&is_b=1&rn=14dcb16f28668aa5ca15c5be0f88d092">BME280 温度，湿度，大气压强传感</a></td>
    <td><a href="https://github.com/sandeepmistry/arduino-LoRa">LoRa.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-bs.w4011-21581912015.32.2fe555358wswJr&id=521238059334&rn=233756c78897999fd97ca2dd4f649071&abbucket=14">GY-30 light intensity sensor </a></td>
    <td><a href="https://github.com/IoTcat/LoRa-socket">LoRa-Socket.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-bs.w4011-21581912015.52.23e05535hDDYEB&id=13302081252&rn=ced14f01f4a9179e7b090c544cf5836a&abbucket=14">MQ-135 air quality sensor </a></td>
    <td><a href="https://github.com/IoTcat/LoRa-mqtt">LoRa-mqtt.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.3-bs.w4011-21581912015.52.270b5535itNYUg&id=13673403530&rn=418dfd01fe7ae4ce8b775fc271d9886a&abbucket=14">MQ-7 carbon monoxide sensor< /a></td>
    <td><a href="https://github.com/tomstewart89/Vector">vector.h</a></td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a1z10.5-bs.w4011-21581825912.37.16ca535042HtRT&id=41536690942&rn=a0912ce05addd045044d65bc796797e8&abbucket=14">rainfall sensor</a> </td>
    <td></td>
</tr>


<tr>
    <td rowspan="8" style="vertical-align: middle;text-align: center;">LoRa Gateway<br/>LoRa Gateway</td>
    <td><a href="https://item.taobao.com/item.htm?spm=a230r.1.14.58.6c20435c9AhMz2&id=555750159003&ns=1&abbucket=14#detail">SX1278</a></td>
    <td>Arduino.h</td>
</tr>
<tr>
    <td></td>
    <td>SPI.h</td>
</tr>
<tr>
    <td></td>
    <td>WiFi.h</td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/sandeepmistry/arduino-LoRa">LoRa.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/IoTcat/LoRa-socket">LoRa-Socket.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/IoTcat/LoRa-mqtt">LoRa-mqtt.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/tomstewart89/Vector">vector.h</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://github.com/knolleary/pubsubclient">PubSubClient.h</a></td>
</tr>


<tr>
    <td rowspan="5" style="vertical-align: middle;text-align: center;">Intranet Controller/MQTT Proxy<br/>Controler/MQTT Proxy</td>
    <td>Raspberry Pi 3B-RASPBIAN</td>
    <td>Python3.7</td>
</tr>
<tr>
    <td><a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.9.791b1000Beu0tp&id=555610012670&cm_id=140105335569ed55e27b&abbucket=14">DC frequency conversion water pump</a></td>
    <td>NodeJS</td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-mqtt-proxy">sf-mqtt-proxy@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-pump">sf-pump@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/forever">forever@npm</a></td>
</tr>



<tr>
    <td rowspan="6" style="vertical-align: middle;text-align: center;">Cloud Server<br/>Cloud Server</td>
    <td>Huawei Cloud Host-Centos7.4</td>
    <td>Nginx/1.12.2</td>
</tr>
<tr>
    <td></td>
    <td>NodeJS/12.4.0</td>
</tr>
<tr>
    <td></td>
    <td>Redis/3.2.12</td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-mqtt-broker">sf-mqtt-broker@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/sf-web-api">sf-web-api@npm</a></td>
</tr>
<tr>
    <td></td>
    <td><a href="https://www.npmjs.com/package/forever">forever@npm</a></td>
</tr>

<tr>
    <td rowspan="1" style="vertical-align: middle;text-align: center;">Database<br/>Database</td>
    <td>Huawei Cloud Database</td>
    <td>MySQL 5.7.23</td>
</tr>

</table>
</div>

{% endraw %}

### 4.2 Data size estimation
According to the production scenario, a data set is generated every 15 minutes, and a data set occupies about 253-291 bytes. According to 291 calculation, 27.93KB of data will be added every day.

## 5 Design Ideas

### 5.1 Idea

 - Document-oriented
 - Interface-oriented
 - Test-oriented

### 5.2 Key Issues
 - Land node RAM resources are scarce, only 2K
 - LoRa communication adopts 433MHz, single-channel transceiving, much interference
 - The server needs to collect and aggregate hash data from multiple nodes
 - Reserve a method of interaction with the drone AI team
 - Push real-time messages to the front-end browser

### 5.3 Scheme selection
In order to **prioritize** to ensure the **stability** and **scalability** of communication and services, we select **layered model** as the design mode of the architecture. The entire system is divided into multiple levels, with necessary interactions between levels. Each level runs independently, restarts quickly when it crashes, and has a high degree of reliability.

In terms of safety, the method of **internal and external network isolation** is adopted. Taking into account the scarcity of computing resources of some devices in the intranet, the interaction with the intranet server adopts an unencrypted communication mode. The intranet server interacts with the cloud server through SSL encryption. To ensure the security of the client's data, the cloud server API only accepts HTTP and WebSocket requests with SSL encryption.

## 6 Architecture Design

### 6.1 Basic introduction

The main purpose of this architecture is to provide a **stable (Available)** and **reliable** Internet of Things system, which collects real-time data in farmland, combines pictures collected by drones and judged by CNN Plant health, realize intelligent management of irrigation system and plant health. This framework is theoretically suitable for most farm environments. The test environment is within a radius of 2~5km (depending on the antenna), and the wind is below level 3. This system acquires farmland data through sensors, controls the irrigation system through transistor circuits, relays, etc., and interacts with managers through web pages and APIs.

### 6.2 System hierarchy diagram

![Smart Farm system hierarchical structure diagram](https://api.yimian.xyz/img/?path=imgbed/img_c46f5639_577x906_8_null_normal.jpeg)

This figure shows the abstract hierarchy of this architecture. As pointed out, this layered architecture can be clearly defined as the **perception layer**, **network layer**, **application layer**, three horizontal operation layers, and a vertical **error handling layer**.

Among them, the **perception layer** can be further refined into **environment layer** and **hardware layer**. The environment layer contains plants, soil, air, water and other natural objects that we want to detect and control. The hardware layer provides the underlying technology for the system's interactive behavior (detection, control) of natural elements through artificial electrical devices such as sensors and controllers. Sex. When the perception layer realizes the interaction of natural information, the corresponding digital information is transmitted to the network layer for communication. Correspondingly, the perception layer will also receive corresponding control information from the network layer, and make corresponding control actions according to these instructions.

**Network layer** is divided into three layers. The lowest layer is the **preprocessing layer**. Its main task is to package the data collected by the perception layer and transform it into a form suitable for network circulation, such as sockets. Therefore, the pre-processing layer requires a small amount of computing storage resources, such as a single-chip microcomputer, EEPROM, etc. After encapsulation by the preprocessing layer, the data is transmitted to the **physical layer**. Based on devices such as gateways and routers in the physical layer, these data packets can be distributed and transmitted in an orderly manner. The application of the MQTT protocol in the **communication layer** makes the management of these data packet distribution more efficient and convenient. In addition, the implementation of the QoS service quality detection system in the communication layer also makes the performance of the network layer more fault-tolerant and reliable.

**Application layer** is mainly responsible for some application-level services for business logic, such as data analysis, event processing, etc. At the bottom of the application layer, the **service layer** is running for a long time. The service layer is the closest part of the application layer to the network layer. Its main purpose is to process the incoming data from the network layer in real time and respond quickly to corresponding requests and error events. At the same time, the service layer is also responsible for sorting and analyzing the data collected by the sensors and passing it to the **database** layer for storage. In order to ensure the reliability of the service, the implementation program of the service layer is registered as a system service and guarded by a special daemon. Unlike the long-term operation of the service layer, the **business layer** is invoked on demand. When a new request comes in from the interface layer or a specific event occurs in the service layer, the business layer will be called and processed. In addition to some basic data analysis, the business layer also has the authority to make analysis requests to the AI ​​layer. **AI layer** After analyzing the image data returned from the drone, it will send back a judgment result to the business layer. According to the specific content of the request, the business layer will organize the image recognition results, historical sensor data, etc., and pass them to the interface layer. **Interface layer** is mainly used to provide different forms of interfaces, such as HTTP interface and WebSocket interface, to facilitate client calls.

### 6.3 System Topology Diagram

![Smart Farm system topology diagram](https://api.yimian.xyz/img/?path=imgbed/img_27df1756_1426x710_8_null_normal.png)

From the topological structure, as shown in the figure above, the entire system can be physically divided into land nodes, weather nodes, LoRa gateways, intranet servers, cloud servers, databases and user terminals.

From the perspective of functional mechanism, the entire system includes: sensor module, LoRa communication module, LoRa gateway module, MQTT-Proxy proxy module, water pump control module, MQTT+ data processing module, web interface module, daemon module and database module.

***Land Node***
Land nodes are deployed in farmland in different regions to detect soil temperature and humidity parameters, and can provide control of water flow solenoid valves at corresponding locations. The land node uses Arduino Nano as the computing unit, uses LoRa as the communication method to connect to the LoRa gateway (and other nodes), and uses battery power. Its large number, harsh working environment and unstable wireless communication are the biggest source of uncertainty in the system.

***Weather Node***
Meteorological nodes are deployed at specific locations in farmland to detect meteorological parameters such as air temperature, humidity, atmospheric pressure, rainfall, light, NH3 concentration, and CO concentration. The weather node uses Arduino Nano as the computing unit, uses LoRa as the communication method to connect to the LoRa gateway (and the land node), and uses battery or wired power. The working environment is harsh and the wireless communication quality is average.

***LoRa Gateway***
The LoRa gateway is deployed indoors. In order to expand the effective communication radius, its antenna can be extended outdoors. The LoRa gateway connects to various land nodes and weather nodes through LoRa, and connects to the intranet server through WiFi. The LoRa gateway can convert the socket packet incoming through LoRa into an mqtt message and pass it to the intranet server, and convert the mqtt message from the intranet server into a socket packet and send it to the designated node through LoRa.

***Intranet server***
The intranet server is a Raspberry Pi 3B, which contains three functional modules: MQTT-Proxy proxy module, water pump control module and daemon process module.

*MQTT-Proxy proxy module* can receive the mqtt message sent by the LoRa gateway via WiFi, encrypt it with SSL and forward it to the cloud server. At the same time, the MQTT-Proxy proxy module will also accept the specified mqtt message from the cloud server, decrypt it and forward it to the LoRa gateway.

*Water pump control module* The state of the water pump is controlled through a relay through the GPIO of the Raspberry Pi. The mqtt communication with the water pump control module directly communicates with the cloud server without passing through the MQTT-Proxy proxy.

*Daemon module* runs on Linux and is used to monitor the MQTT-Proxy proxy module and the water pump control module. When modules are detected to stop running, the daemon module will restart these modules in time to ensure the stability and continuity of services.

***Cloud Server***
The cloud server runs on Huawei Cloud located in Beijing and includes MQTT+ data processing module, web interface module and daemon module.

*MQTT+data processing module* includes the Service layer and the Business layer in the hierarchical structure. This module communicates with the intranet through mqtt, and interacts with the web interface module (and AI module) through mqtt and redis. After receiving various hashed data from the intranet, this module will automatically aggregate them, organize them into one piece of data, store it in the database, and push it to the web interface module through redis. In addition, this module will periodically send requests to each node to obtain their data, and these requests will be tracked to calculate the delay.

*web interface module* provides a series of HTTP and WebSocket interfaces. These interfaces can be used to get data, send instructions, refresh data, and get push messages.

*Daemon module* runs on Linux and is used to monitor MQTT+ data processing module and web interface module. When modules are detected to stop running, the daemon module will restart these modules in time to ensure the stability and continuity of services.

## 7 Module description

### 7.1 LoRa communication module
The LoRa communication module is used to realize stable and reliable socket communication in a single channel. This module includes LoRa-socket and LoRa-mqtt.

LoRa-socket encapsulates data packets on the basis of LoRa-Arduino, realizes simple udp and tcp communication, and makes traditional LoRa communication more reliable. By adding the sending and receiving ip address to the head of the data packet, and adding the hash check value at the end of the data packet, LoRa-socket supports point-to-point communication and broadcast communication, and has powerful noise processing capabilities and data tamper resistance.
***Project address***: [iotcat/LoRa-socket](https://github.com/IoTcat/LoRa-socket)

LoRa-mqtt is a simple reproduction of the mqtt protocol based on LoRa-socket. Based on udp and tcp, LoRa-mqtt supports mqtt communication with qos 0 and 1.
***Project address***: [iotcat/LoRa-mqtt](https://github.com/IoTcat/LoRa-mqtt)

### 7.2 MQTT-Proxy proxy module
This module runs on the intranet server and realizes the encrypted forwarding of the intranet mqtt.
***Project address***: [iotcat/sf-mqtt-proxy](https://www.npmjs.com/package/sf-mqtt-broker)

### 7.3 Water pump control module
This module runs on the intranet server and realizes the control of the relay water pump through GPIO.
***Project address***: [iotcat/sf-pump](https://www.npmjs.com/package/sf-pump)

### 7.4 mqtt+data processing module
This module runs on the cloud server and realizes the data aggregation, processing and storage of the underlying mqtt messages.
***Project address***: [iotcat/sf-mqtt-broker](https://www.npmjs.com/package/sf-mqtt-broker)

### 7.5 web interface module
This module runs on the cloud server and realizes the provision of functional interfaces.
***Project address***: [iotcat/sf-web-api](https://www.npmjs.com/package/sf-web-api)


## 8 Development Document

### 8.1 mqtt theme
 - [mqtt topic list](https://doc.smartfarm.yimian.xyz/#/home?id=mqtt)

### 8.2 http interface
 - [httpinterface document](https://doc.smartfarm.yimian.xyz/#/home?id=api-http)

### 8.3 websocket interface
 - [websocket interface document](https://doc.smartfarm.yimian.xyz/#/home?id=api-websocket)


## 9 Running status

### 9.1 System delay

![qos](https://api.yimian.xyz/img/?path=imgbed/img_b36d5030_1806x546_8_null_normal.png)

The figure above shows the line graphs of the delay statistics of the land node (left), the weather node (right), and the water pump (bottom). It can be seen from the figure that the average delay of the land node is about 730ms, the delay of the weather node is about 900ms, and the delay of the water pump is relatively low, about 45ms.

### 9.2 Sensor data
[Click here to view the weather sensor data of 2019-7-31](https://smartfarm.yimian.xyz/chart-station.html?f=1564484461&t=1564570861)



-------------------------------
**Reference List:**

[1] OASIS, (2015,12.10). MQTT Version 3.1.1 Plus Errata 01 [Online]. Available: https://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt -v3.1.1-errata01-os-complete.html

[2] Sinha, R.S., Wei, Y. and Hwang, S.H., "A survey on LPWA technology: LoRa and NB-IoT", in Ict Express, 3(1), pp.14-21, 2017.

{% raw %}</span>{% endraw %}
