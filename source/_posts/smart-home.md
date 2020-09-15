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


## 背景：
大一上学期，初接触单片机，使用Arduino Uno搭建了一个宿舍中的智慧窗帘系统（细节可以参考[这篇blog](https://www.eee.dog/tech/build-236-iot-platform-on-wifiduino.html)），积累了一定的经验。

## 方法：
1.	向专家请教（水管问题向五金店老板请教，LoRa向欧朗研发部请教）
2.	做轮子，不断迭代，在重构中优化系统，获取经验
3.	认真调研客户（家人）的需求，在设计时重视客户需求，多于客户沟通
4.	在设计某一系统时，一定要假设与其交互的其它系统不稳定。让系统之间的交互就像君子相交一样，像水一样。从而提高整个系统的裕度。
5.	持续运维。比如三轮开发前曾经发生过，我妈在打扫卫生时碰掉了一个人体传感器，导致整个灯控系统紊乱。当时在苏州的我通过远程ssh连接到家里的服务器，将坏掉的传感器踢出控制系统进而解决了问题。因此，一定要让自己在任何时候都可以接入到系统进行运维。一定要在设计时充分考虑之后的运维。

## 过程综述：

### 一轮开发
大一暑假，开始尝试使用WiFiduino在家中控制一些物体，实现了对（坏了的）太阳能加水（通过电磁阀）的控制（修改了原先家里的管道，加入了电磁阀。跑了好多趟五金店，收获了不少关于水管的知识和实践经验。之后做surf的水泵也有用到。）以及对走廊灯（通过光电耦合器）的控制。找到一台废弃的10年前的我爸的IBM笔记本，装上了win server 2008, 并配置好了mysql数据库，并定期使用http从单片机采集数据。我用php写了一个简单的web界面，来展示相关信息，并实现网页控制。由于家里被分配的是中国移动分配的大NAT内网IP，因此使用frp来实现内网穿透，使外界可以访问家里服务器上的web网页。

### 二轮开发
大二寒假，改进先前的固件，使用wifiduino陆续实现了对厨房，客厅，餐厅的灯体的控制，并部署了一系列传感器，并接入网络。由于先前太阳能管道的单片机WiFi信号弱，于是在附近使用路由器做了桥接。值得一提的是，年三十晚上春晚开始前2分钟我还在家里停电施工，，不知道爸妈是什么感受⊙０⊙。。

### 三轮开发
大二暑假，基于本学期经验，重构系统。在服务器上，重装系统为Centos7使用home assistant 开源项目提供UI等服务，使用mqtt作为通信协议。使用nodeJS编写了灯控自动化和太阳能加水的控制逻辑。在单片机，更新了固件，支持ota远程更新固件（参考了部分wiot经验，但更加因地制宜）。此外，新增了两个流量计，以实现太阳能加水完全自动化（之前是通过网页设置加水时长）。由于流量计WiFi信号弱，我们使用了Arduino uno + LoRa作为通信手段。本次设计，结合爸妈的意见，充分考虑了整体系统的稳定性。比如，如何handle各种类型的错误和失联，如何在断电后丝滑得重启，如何在服务器无响应情况下保证单片机不紊乱，如何在系统失控后物理切回到手动（比如灯，和太阳能加水）。

### 四轮开发
大三暑假，基于过去积累的传感器数据，使用LSTM模型，通过keras+tensorflow训练神经网络，实现对灯控状态的预测。目前仍在持续优化中，预计9月前完成。此外，有计划接入天猫精灵的打算（仍在队列中，需等待ushio oauth系统的研发，ushio oauth系统需要等待ushio user系统研发，ushio user系统需要稳定的js-session作为支撑，js-session需要使用fp来精确识别用户设备。。目前fp仍处于第三测试阶段。所以，一步一步来吧，，）。




##  硬件设计

###  单片机选材
使用Arduino UNO作为计算单元。一方面，Arduino Uno拥有高可靠性，我之前的智慧窗帘系统使用Arduino Uno作为主控板，平稳运行1年半未出现硬件问题。另一方面，Arduino Uno拥有较大的RAM，无需为了争夺RAM而在单片机编程上煞费苦心。

Arduino UNO的缺陷主要是价格高，但是为保障长期稳定运行，这个成本是必要的。

###  WiFi通信模块选材

使用ESP-01作为WiFi的通信模块。主要原因是之前学校课程使用过ESP-01搭建遥控小车，对其工作方式和性能比较了解，降低开发成本。

###  LoRa通信模块选材

使用**安信可 LORA RA-02 LORA**作为LoRa节点和LoRa网关通信模块。原因是surf项目使用的就是这个模块，比较了解它。

###  智能音箱选材

智能音箱作为此物联网系统人机交互的最主要界面，发挥着举足轻重的作用。经研究，我使用天猫精灵方糖R作为家用智能音箱。一方面，天猫精灵的性价比摆在那里，非常便宜。第二，与小米开发小爱同学不同，阿里开发天猫精灵的目的是提供平台，它允许开发者以各种形式接入其网络，这一点对我至关重要。

###  灯拨动开关

初期设想: 单向控制+复位器。
实际实现：将原有单开改造为双开，一路与继电器串联，另一路与两个pin口相连。


##  通信设计

![网络拓扑图](https://api.yimian.xyz/img/?path=imgbed/img_43b85bd4_1096x660_8_null_normal.png)

采用WiFi+LoRa两种通信模式。在需要高速高质量通信的场景，如天猫精灵，手机，笔记本，使用WiFi作为通信手段。在WiFi信号不稳定的地方，使用LoRa进行通信。使用MQTT为应用层协议。

##  主控系统设计

使用python3开源项目Home Assistant 为基础搭建本项目的主控系统。效果如下图：

![Sola Website](https://api.yimian.xyz/img/?path=imgbed/img_c1a1b81_1895x859_8_null_normal.jpeg)

##  多媒体系统设计

多媒体主要由天猫精灵提供。此外，通过小米盒子，家庭网盘中的视频，图片，音乐实现了电视与音响上的播放。

##  云端支持系统设计

dns.yimian.xyz提供dns解析服务。

##  NAS存储系统设计

通过挂载从老电脑上拆卸的闲置500G机械硬盘到老IBM服务器，实现存储系统的搭建。
对局域网内，由于家里都是win系统，使用smb作为共享协议实现文件传输，支持局域网内挂载。速度稳定，全网读写10MB/s左右。对外网访问，通过http，frp反代实现，但速度较慢。

以下是对网页界面的一个截屏：

![NAS Web Page](https://api.yimian.xyz/img/?path=imgbed/img_352da66_1866x814_8_null_normal.jpeg)


## 总结

### 主要收获
1.	全栈物联网（云+管+端）系统搭建运维经验
2.	LoRa，WiFi通信系统搭建经验
3.	机器学习开发运维经验
4.	客户需求分析经验
5.	家用电路线路改装经验
6.	家用水管管道改造经验

### 遇到的挑战
1.	如何保证所有的单片机处拥有优质的网络连接
2.	家人希望预留方法，在系统崩溃时一键回到最古老的手动开关状态。
3.	准确的控制灯的开关
4.	如何降低各模块间的耦合

### 解决方法
1.	使用WiFi，LoRa双协议。WiFi用于连接距离路由器较近的单片机，LoRa 连接距离较远WiFi信号弱的原处的单片机。
2.	我在每一个开关都配置了双保险，让每一个开关都可以经过轻易的操作即可回到手动状态。如果要回到手动状态，只需要扫描开关上的二维码，根据指示操作。详见[应急操作指南](https://sola.yimian.xyz/#/home?id=%E5%BA%94%E6%80%A5%E6%93%8D%E4%BD%9C%E6%8C%87%E5%8D%97)
3.	在第一轮开发，灯控是由单片机决定的。与楼道里的声控灯并无本质差别，都是传感器->单片机->灯。第二轮开发时，将这个判断逻辑转移到了服务器。第三轮开发，我们引入了夜间模式，白天模式，午夜模式等，并在决策时使用了数学模型，通过各传感器的数据测算有人的概率，来决定对灯的控制。但是，这一方法并不总是及时，家里人在天刚黑时总是需要去按一下拨动开关。因此，第四轮开发中，我希望能够借助机器学习，让其自己学习家人的开关习惯。目前，正在持续采集数据并训练中，夜间准确度在0.75左右。
4.	各个模块和单片机都是用mqtt进行交互。每个单片机都有在线模式和离线模式。灯控决策模块和太阳能控制模块是单独的两个nodeJS模块，由pm2守护。为了保证其服务不间断性，他们是用redis（已配置持久化）作为实时数据存储。

------------------------
**2020.6 更新**

## RNN实现对灯控制

基于先前积累的人体传感器数据，通过LSTM模型，使用keras训练神经网络，实现对开灯状态的预测。


--------------------------
**2020.8 更新**

## 天猫精灵接入
自建了OAuth服务器，实现了天猫精灵的接入。




{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

Combining the knowledge I have learned and using cutting-edge technology to benefit life has been my unremitting pursuit for a long time. In order to let my family experience a more stable, comfortable and intelligent lifestyle, and to consolidate the technical foundation and architecture experience accumulated in the school smartfarm project and my own ushio system, I decided to use 20 to 23 before going abroad. All day long, reconstruct the old IoT system at home. Adopt a layered architecture and interface-oriented, test-oriented, and **document-oriented** development principles, with **Available** and **Reliable** as the highest priority indicators to build an operational target 3. A highly modular, easy-to-remote control, open source home software and hardware intelligent sensor control system for more than years.


## Background:
In the first semester of the freshman year, I was new to MCU and used Arduino Uno to build a smart curtain system in the dormitory (for details, please refer to [this blog](https://www.eee.dog/tech/build-236-iot-platform) -on-wifiduino.html)), has accumulated a certain amount of experience.

## Method:
1. Ask experts (for water pipe problems, ask the owner of the hardware store, and LoRa for advice from Oulang R&D department)
2. Be a wheel, keep iterating, optimize the system in refactoring, and gain experience
3. Investigate the needs of customers (family) carefully, pay more attention to customer needs in design, rather than communicate with customers
4. When designing a system, it must be assumed that other systems that interact with it are unstable. Let the interaction between systems be like gentlemen intersect, like water. Thereby improving the margin of the whole system.
5. Continuous operation and maintenance. For example, it happened before the three rounds of development. My mother touched a human sensor while cleaning, causing the entire light control system to be disordered. At that time, I was in Suzhou connected to the server at home via remote ssh, kicked the broken sensor out of the control system and solved the problem. Therefore, you must allow yourself to be connected to the system for operation and maintenance at any time. The future operation and maintenance must be fully considered in the design.

## Process overview:

### First round of development
Freshman summer vacation, I began to try to use WiFiduino to control some objects at home, and realized the control of (broken) solar water (through solenoid valve) (modified the original home pipes and added solenoid valves. I went to the hardware store many times. , I have gained a lot of knowledge and practical experience on water pipes. Later, I will also be useful to do surf pumps.) and control the corridor lights (through photocouplers). I found an abandoned IBM laptop of my dad 10 years ago, installed it with win server 2008, and configured the mysql database, and regularly used http to collect data from the microcontroller. I wrote a simple web interface in php to display relevant information and implement web control. Since the home is assigned a large NAT intranet IP allocated by China Mobile, frp is used to achieve intranet penetration, so that the outside world can access the web pages on the home server.

### Second round of development
During the sophomore winter vacation, the previous firmware was improved, wifiduino was used to control the lights in the kitchen, living room, and dining room one after another, and a series of sensors were deployed and connected to the network. Because the WiFi signal of the single-chip microcomputer of the solar energy pipeline was weak, a router was used nearby to bridge. It is worth mentioning that on the night of New Year’s Eve, I was still at home with a power outage 2 minutes before the start of the Spring Festival Gala. I don’t know how my parents feel. .

### Third round of development
Sophomore summer vacation, based on the experience of this semester, reconstruct the system. On the server, the reinstallation system provides UI and other services for Centos7 to use the home assistant open source project, using mqtt as the communication protocol. Use nodeJS to write the control logic of light control automation and solar water adding. In the single chip microcomputer, the firmware is updated, and the ota remote firmware update is supported (referring to some Wiot experience, but more tailored to local conditions). In addition, two new flow meters have been added to fully automate the solar water addition (previously, the water addition time was set through the web page). Due to the weak WiFi signal of the flowmeter, we used Arduino uno + LoRa as the communication means. This design, combined with the opinions of parents, fully considered the stability of the overall system. For example, how to handle various types of errors and loss of connection, how to restart after a power failure, how to ensure that the MCU is not disordered when the server is unresponsive, and how to physically switch back to manual after the system is out of control (such as lights, and Solar energy plus water).

### Fourth round of development
In the summer vacation of the junior year, based on the sensor data accumulated in the past, the LSTM model is used to train the neural network through keras+tensorflow to realize the prediction of the light control state. The optimization is still ongoing and is expected to be completed before September. In addition, there are plans to connect to the Tmall Wizard (still in the queue, waiting for the development of the ushio oauth system, the ushio oauth system needs to wait for the development of the ushio user system, and the ushio user system needs stable js-session as support, js-session Need to use fp to accurately identify user equipment.. Currently fp is still in the third test stage. So, let's do it step by step,,).




##  Hardware design

### Single Chip Microcomputer Material Selection
Use Arduino UNO as the calculation unit. On the one hand, Arduino Uno has high reliability. My previous smart curtain system used Arduino Uno as the main control board, and it ran smoothly for one and a half years without hardware problems. On the other hand, Arduino Uno has a larger RAM, so there is no need to bother to program the microcontroller in order to compete for RAM.

The main disadvantage of Arduino UNO is its high price, but this cost is necessary to ensure long-term stable operation.

### WiFi communication module selection

Use ESP-01 as the WiFi communication module. The main reason is that the ESP-01 has been used to build a remote control car in the previous school courses, and I have a better understanding of its working methods and performance to reduce development costs.

### LoRa communication module selection

Use **Anxinke LORA RA-02 LORA** as the communication module between LoRa node and LoRa gateway. The reason is that this module is used in the surf project, so I understand it better.

### Smart speaker selection

As the most important interface for human-computer interaction in this IoT system, smart speakers play a pivotal role. After research, I use Tmall Elf Sugar R as a home smart speaker. On the one hand, the price/performance ratio of Tmall Genie is very cheap. Second, unlike Xiaomi’s development of Xiao Ai, the purpose of Ali’s development of Tmall Genie is to provide a platform that allows developers to access its network in various forms, which is very important to me.

### Light toggle switch

Initial idea: one-way control + reset device.
Actual realization: The original single-opening is transformed into double-opening, one is connected in series with the relay, and the other is connected with two pin ports.


## Communication Design

![Network Topology Diagram](https://api.yimian.xyz/img/?path=imgbed/img_43b85bd4_1096x660_8_null_normal.png)

Two communication modes of WiFi+LoRa are adopted. In scenarios that require high-speed and high-quality communication, such as Tmall Genie, mobile phones, and notebooks, use WiFi as a means of communication. In places where the WiFi signal is unstable, use LoRa for communication. Use MQTT as the application layer protocol.

## Main control system design

Use the python3 open source project Home Assistant as the basis to build the main control system of this project. The effect is as follows:

![Sola Website](https://api.yimian.xyz/img/?path=imgbed/img_c1a1b81_1895x859_8_null_normal.jpeg)

## Multimedia system design

Multimedia is mainly provided by Tmall Genie. In addition, through the Xiaomi box, the video, pictures, and music in the home network disk can be played on the TV and stereo.

## Cloud support system design

dns.yimian.xyz provides dns resolution service.

## NAS storage system design

By mounting the idle 500G mechanical hard disk removed from the old computer to the old IBM server, the storage system is built.
In the local area network, since the home is a win system, smb is used as a sharing protocol to realize file transfer and supports mounting in the local area network. The speed is stable, and the whole network reads and writes about 10MB/s. Access to the external network is realized through http and frp reverse generation, but the speed is slow.

The following is a screenshot of the web interface:

![NAS Web Page](https://api.yimian.xyz/img/?path=imgbed/img_352da66_1866x814_8_null_normal.jpeg)


## Conclusion

### Main gains
1. Full-stack IoT (cloud + pipe + terminal) system construction operation and maintenance experience
2. LoRa, WiFi communication system construction experience
3. Machine learning development operation and maintenance experience
4. Customer needs analysis experience
5. Experience in home circuit modification
6. Experience in renovation of household water pipes

### Challenges encountered
1. How to ensure that all MCUs have high-quality network connections
2. The family hopes to reserve a way to return to the oldest manual switch state with one click when the system crashes.
3. Control the light switch accurately
4. How to reduce the coupling between modules

### Solution
1. Use WiFi, LoRa dual protocol. WiFi is used to connect the single-chip microcomputer closer to the router, and LoRa connects to the single-chip microcomputer in the original place where the WiFi signal is weaker.
2. I have equipped each switch with double insurance, so that each switch can be returned to manual state after easy operation. If you want to return to manual mode, just scan the QR code on the switch and follow the instructions. For details, see [Emergency Operation Guide](https://sola.yimian.xyz/#/home?id=%E5%BA%94%E6%80%A5%E6%93%8D%E4%BD%9C%E6%8C%87%E5%8D%97)
3. In the first round of development, the light control is determined by the microcontroller. There is no essential difference with the sound-controlled lights in the corridor, they are all sensors -> single chip microcomputer -> lights. In the second round of development, this judgment logic was transferred to the server. In the third round of development, we introduced night mode, day mode, midnight mode, etc., and used mathematical models in the decision-making process to determine the probability of people using the data of each sensor to determine the control of the lights. However, this method is not always timely. Family members always need to press the toggle switch when it is just dark. Therefore, in the fourth round of development, I hope to use machine learning to let myself learn the switching habits of my family. Currently, data is being continuously collected and trained, and the night accuracy is around 0.75.
4. Each module and the single-chip microcomputer use mqtt to interact. Each microcontroller has an online mode and an offline mode. The light control decision module and the solar control module are two separate nodeJS modules, guarded by pm2. In order to ensure uninterrupted services, they use redis (configured persistence) as real-time data storage.

------------------------
**2020.6 update**

## RNN realizes light control

Based on the previously accumulated human sensor data, the LSTM model is used to train the neural network using keras to realize the prediction of the light state.


--------------------------
**2020.8 update**

## Tmall Elf Access
Self-built OAuth server has realized the access of Tmall Wizard.
{% raw %}</span>{% endraw %}
