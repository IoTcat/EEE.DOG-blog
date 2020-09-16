---
title: wIoT发展展望
titleEN: wIoT - What is the future
date: 2020-09-15
display: true
categories:
- tech
tags:
- iot
- WiFi
- nodeJS
---

{% raw %}<span class=".zh">{% endraw %}
本文将讨论wiot项目下一步的发展目标与实施方法。
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
This article will discuss the next development goals and implementation methods of the Wiot project.

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
                buttons: [['<button>Show Chinese Page</button>', function (instance, toast) {
                    page.tran.setLang('zh');
                    instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
                }, true]]
            });
        }
    });
</script>
{% endraw %}

{% raw %}<span class=".zh">{% endraw %}


### wIoT
wiot，一个基于NodeJS的分布式物联网操作系统。

# 项目简介

## 立项初衷
本项目旨在帮助不熟悉固件编程的网络开发者实现出自己的物联网应用。

在开发传统的物联网程序时，我们需要一次又一次的编写，烧录，调试每一个开发板，以某种方式将其相连结，以提供某种服务。这样的方式非常繁琐，开发成本和门槛都比较高。此外，古老的C和C++语言缺少成熟的依赖管理工具，以至于我们在编写开发板时难以像开发python或nodeJS程序一样轻松便捷。

本项目试图提供一种方法，将烧录，调试开发板的流程自动化，并将逻辑编写的步骤移动到远程计算机的NodeJS界面上。通过此方式，我们进而得以将分布式物联网节点的功能进行集中化管理。此外，借助NodeJS成熟的依赖管理器npm，使得物联网应用的开发更加便捷高效。

至此，下到每一个物联网节点，上到各种类型的数据库、用户终端，都可以在同一个nodeJS界面上配置、操作。开发者将能够专注于物联网逻辑的开发，实现出更加丰富多彩的物联网应用。

# 第一轮开发

> 第一轮开发完成于2019.5，详见[这篇博客](https://www.eee.dog/tech/wiot.html)

 实现了对D1 MINI开发板对nodeJS的pin口映射，并支持诸如ota等一系列功能。

# 第二轮开发

> 待进行，计划当做FYP项目

## 支持的开发版
 - [NodeMCU](https://www.nodemcu.com/index_en.html)

## 实现方法
通过提供标准化的单片机固件以及自动化的烧录工具，wiot将各开发板的pin口功能进行抽象，整理，并映射为可调用的NodeJS接口。


![wiot Architecture](https://api.yimian.xyz/img/?path=imgbed/img_b0a1fe7_1395x662_8_null_normal.jpeg)


如上图所示，wiot架构主要包含三部分：Node节点，wiot Cloud Module云模块，wiot cli命令行程序。其中，Node节点为烧录好wiot固件的NodeMCU单片机，他们通过IEEE 802.11 WiFi进行分布式通信，并于某个节点接入路由器以连接wiot云模块。用户在自己的PC上使用NodeJS调用wiot依赖编写物联网程序。完成后，用户使用wiot cli对开发好的程序进行检查、测试和部署。被部署的物联网程序将运行在wiot云模块上，并可使用nodeJS的接口与其它云服务或数据库进行交互。


### Node节点

Node节点使用的是NodeMCU开发板（基于ESP8266的扩展板）。在使用wiot-cli烧录wiot固件后，NodeMCU将成为wiot节点。

#### **模式**

wiot节点有四种模式：master模式、slave模式、bridge模式和debug模式。此模式只能在烧录固件时配置。master模式和bridge模式下，nodeMCU将同时开启STA和AP模式。slave模式下则只开启STA模式。master需要有稳定且无限制的电源供电，其功率较大(包含RSA, 协议转换等)，不适合低功耗场景。bridge与slave则可以灵活调整功率，可用于低功耗场景。

debug模式下节点工作在STA和AP模式，用户可以使用手机等设备连接到此节点，并打开根目录网页。网页上将实时显示此节点当前所处位置的各种信息，比如收到各其它节点的信号强度等，适用于挑选部署场景。

#### **低功耗**

wiot节点支持低功耗（Low Power）状态。但此状态仅能在slave模式和bridge下开启。此状态可通过wiot api或者wiot-cli进行开启或关闭。低功耗状态由esp8266睡眠功能实现。此状态下可由干电池供电工作数年[[1]](https://makecademy.com/esp8266-battery)。

#### **组网**

wiot节点使用分布式组网。在路由器信号较强的地方，master节点将接入路由器WiFi网络，并桥接。在路由器信号不强的地方，每一个节点都会找到信号最强的另一个上游的master或bridge节点，并桥接（slave除外）。

![wiot节点分布式组网](https://api.yimian.xyz/img/?path=imgbed/img_a42f5a4_1224x561_8_null_normal.jpeg)

如上图，两个距离路由器近的master节点自动接入到路由器wifi。下游的其它节点分别连接至信号最强的上游节点。

#### **认证**

![射频指纹识别[2]](https://api.yimian.xyz/img/?path=imgbed/img_d184ff2_1442x502_8_null_normal.jpeg)
wiot节点支持使用**射频指纹识别**[[2]](https://ieeexplore.ieee.org/document/9149584)来实现下游通信认证。此方法使用esp8266的RSSI函数以及scan返回参数。在下游设备试图接入网络时，上游设备将搜集指纹信息并向服务器汇报。服务器将指纹与数据库存储的先前版本进行比对，并作出是否允许入网的决策。

### 云模块

云模块充当wiot的云部分，提供云的功能。云模块能够守护运行run-time状态下的wiot程序。此外，云模块还能够提供测试，部署等功能。云模块使用Docker进行虚拟化。

### 命令行程序

即wiot-cli。是wiot在开发者终端上提供的操作工具集。通过wiot-cli，开发者可以实现对wiot程序的测试，部署，恢复等功能。此外，wiot-cli也支持一系列debug等常用功能。详见下方`wiot-cli命令`。


## 用户操作步骤

1. 用户下载安装并配置好NodeJS环境。
2. 用户通过命令行运行`npm i -g wiot-cli`指令安装wiot命令行工具
3. 用户运行命令`wiot init my-wiot-proj`在当前目录新建并配置一个wiot项目文件夹，项目名称为my-wiot-proj。此时，会提示用户填写此项目的一些信息，比如项目描述，作者信息，路由器WiFi账户密码，wiot云模块地址，项目主脚本等。
4. 用户进入到项目目录，将nodeMCU通过数据线连接到电脑，运行`wiot node init my-first-node [--type=<master|slave|bridge|debug>]`。这将自动配置并将wiot固件烧录到nodeMCU开发板，并将其命名为my-first-node。type为可选参数，可设置为`master`或`slave`或`bridge`或`debug`，默认为`master`。
5. 依次按照此方法烧录好所有的开发板，将其部署在生产环境。
6. 在项目文件夹运行指令`wiot status`查看是否所有节点均已在线。如果没有，使用指令`wiot log`配合`grep`工具查找日志定位问题。
7. 从项目主脚本（默认是`index.js`）开始编写你的wiot程序。
8. 使用指令`wiot check`检查你wiot程序的逻辑问题。
9. 使用指令`wiot test`将挂起云模块中正在运行的程序，并运行当前项目文件夹中的程序。此时，所有控制台输出将显示在你的命令行窗口。使用`Ctrl+C`终止当前测试并恢复云模块先前的程序。
10. 使用指令`wiot push`将本地的wiot程序部署到云端。

## 其它操作

### 部署自己的wiot云模块

默认使用wiot官方wiot云模块。你也可以部署自己的wiot云服务，方法如下：

安装docker并运行指令`docker run -d --name=wiot-cloud -p 3594:3594 -v /var/wiot/data/:/var/wiot/data/ iotcat/wiot`。

### wiot-cli命令

 - `wiot help [command]`查看帮助
 - `wiot clone <host:user/project>`将项目从云模块克隆到本地
 - `wiot pull`使用远程代码覆盖本地代码
 - `wiot push`将当前文件夹wiot程序部署到云模块
 - `wiot ls`显示当前所有节点
 - `wiot map [nodeID]`显示某节点的连接路径
 - `wiot log [nodeID] [--head=<number>|--tail=<number>]`查看某节点的日志
 - `wiot stop`停止wiot服务
 - `wiot start`开启wiot服务
 - `wiot restart`重启wiot服务
 - `wiot reload`在不重置flash变量情况下重启wiot服务
 - `wiot init <name>`新建并初始化wiot项目文件夹
 - `wiot node init <node-name> [--type=<master|slave|bridge|debug>]`配置并烧录nodeMCU开发板
 - `wiot check`检查当前文件夹项目逻辑问题。
 - `wiot test`将挂起云模块中正在运行的程序，并运行当前项目文件夹中的程序。此时，所有控制台输出将显示在你的命令行窗口。使用`Ctrl+C`终止当前测试并恢复云模块先前的程序。
 - `wiot status [nodeID]`显示当前项目或节点状态信息
 - `wiot debug start`终止当前云端程序并进入debug模式
 - `wiot debug set <nodeID> <pinID> <0-255>`debug模式下设置某个节点pin的PWM输出值
 - `wiot debug reset <nodeID>`debug模式下重置某个节点的数据存储，并重连
 - `wiot debug get <nodeID> <pinID>`debug模式下获取某个节点pin的PWM值
 - `wiot debug sleep <nodeID> <pinID> <HIGH|LOW>`debug模式下设置某节点轻度休眠，直到被某pin的高或低电平唤醒
 - `wiot debug dsleep <nodeID> <millisecond>`debug模式下设置某节点深度休眠多少毫秒
 - `wiot debug reconnect [nodeID]`debug模式下重新组网或断开重连某个节点
 - `wiot debug setphymode <nodeID> <b|g|n>`debug模式下配置节点WiFi协议为802.11b|g|n
    ···

### 常用API
> 待设计，请参考[一轮开发wiot文档](https://wiot.yimian.xyz/#/home)



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

### wIoT
Wiot, a distributed IoT operating system based on NodeJS.

# Project Description

## The original intention of the project
This project aims to help web developers who are not familiar with firmware programming to implement their own IoT applications.

When developing traditional Internet of Things programs, we need to write, burn, and debug each development board again and again, and connect them in a certain way to provide a certain service. This method is very cumbersome, and the development cost and threshold are relatively high. In addition, the ancient C and C++ languages ​​lack mature dependency management tools, so that it is difficult for us to write development boards as easy and convenient as developing python or nodeJS programs.

This project is trying to provide a method to automate the process of burning and debugging the development board, and move the steps of logic writing to the NodeJS interface of the remote computer. In this way, we are able to centrally manage the functions of distributed IoT nodes. In addition, with NodeJS's mature dependency manager npm, the development of IoT applications is more convenient and efficient.

So far, down to every IoT node, up to various types of databases and user terminals, all can be configured and operated on the same nodeJS interface. Developers will be able to focus on the development of IoT logic and realize more colorful IoT applications.

# First round of development

> The first round of development was completed in May 2019, please refer to [this blog](https://www.eee.dog/tech/wiot.html)

 Realize the pin port mapping of D1 MINI development board to nodeJS, and support a series of functions such as ota.

# Second round of development

> To be carried out, plan as FYP project

## Supported development version
 - [NodeMCU](https://www.nodemcu.com/index_en.html)

## Implementation
By providing standardized microcontroller firmware and automated burning tools, wiot abstracts, organizes, and maps the pin port functions of each development board into a callable NodeJS interface.


![wiot Architecture](https://api.yimian.xyz/img/?path=imgbed/img_b0a1fe7_1395x662_8_null_normal.jpeg)


As shown in the figure above, the wiot architecture mainly consists of three parts: Node node, wiot Cloud Module, and wiot cli command line program. Among them, the Node node is the NodeMCU microcontroller with the wiot firmware burned. They use IEEE 802.11 WiFi for distributed communication, and connect to a router at a node to connect to the wiot cloud module. Users use NodeJS to call Wiot on their own PCs and rely on writing IoT programs. After completion, the user uses wiot cli to check, test and deploy the developed program. The deployed IoT program will run on the wiot cloud module, and can use the nodeJS interface to interact with other cloud services or databases.


### Node node

Node node uses NodeMCU development board (expansion board based on ESP8266). After using wiot-cli to burn the wiot firmware, NodeMCU will become a wiot node.

#### **Mode**

Wiot nodes have four modes: master mode, slave mode, bridge mode and debug mode. This mode can only be configured when burning firmware. In master mode and bridge mode, nodeMCU will enable STA and AP mode at the same time. In slave mode, only STA mode is enabled. The master needs to have a stable and unlimited power supply, which has a large power and is not suitable for low power consumption scenarios. Bridge and slave can flexibly adjust power, which can be used in low power consumption scenarios.

In debug mode, the node works in STA and AP mode. Users can use mobile phones and other devices to connect to this node and open the root directory webpage. The web page will display various information about the current location of this node in real time, such as the signal strength received from other nodes, which is suitable for deployment scenarios.

#### **Low power**

Wiot nodes support Low Power state. But this state can only be opened in slave mode and bridge. This state can be turned on or off through wiot api or wiot-cli. The low power consumption state is realized by the sleep function of esp8266. In this state, it can be powered by dry batteries for several years [[1]](https://makecademy.com/esp8266-battery).

#### **Networking**

Wiot nodes use distributed networking. Where the router signal is strong, the master node will access the router WiFi network and bridge it. Where the router signal is not strong, each node will find another upstream master or bridge node with the strongest signal and bridge it (except slave).

![wiot node distributed networking](https://api.yimian.xyz/img/?path=imgbed/img_a42f5a4_1224x561_8_null_normal.jpeg)

As shown in the figure above, the two master nodes close to the router are automatically connected to the router wifi. The other downstream nodes are respectively connected to the upstream node with the strongest signal.

#### **Certification**

![Radio frequency fingerprint identification[2]](https://api.yimian.xyz/img/?path=imgbed/img_d184ff2_1442x502_8_null_normal.jpeg)

Wiot nodes support the use of **RF Fingerprint Recognition**[[2]](https://ieeexplore.ieee.org/document/9149584) to achieve downstream communication authentication. This method uses the RSSI function of esp8266 and scan return parameters. When the downstream device attempts to access the network, the upstream device will collect fingerprint information and report to the server. The server compares the fingerprint with the previous version stored in the database and makes a decision whether to allow access to the network.

### Cloud Module

The cloud module acts as the cloud part of Wiot and provides cloud functions. The cloud module can guard the wiot program running in the run-time state. In addition, the cloud module can also provide functions such as testing and deployment. The cloud module uses Docker for virtualization.

### Command Line Program

That is wiot-cli. It is a set of operation tools provided by Wiot on the developer terminal. Through wiot-cli, developers can implement functions such as testing, deploying, and restoring wiot programs. In addition, wiot-cli also supports a series of common functions such as debug. See the `wiot-cli command` below for details.


## User operation steps

1. The user downloads, installs and configures the NodeJS environment.
2. The user runs the command `npm i -g wiot-cli` through the command line to install the wiot command line tool
3. The user runs the command `wiot init my-wiot-proj` to create and configure a wiot project folder in the current directory, the project name is my-wiot-proj. At this point, the user will be prompted to fill in some information about this project, such as project description, author information, WiFi account password, wiot cloud module address, project main script, etc.
4. The user enters the project directory, connects the nodeMCU to the computer through the data cable, and runs `wiot node init my-first-node [--type=<master|slave|bridge|debug>]`. This will automatically configure and burn the Wiot firmware to the nodeMCU development board and name it my-first-node. type is an optional parameter, which can be set to `master` or `slave` or `bridge` or `debug`, and the default is `master`.
5. Follow this method to burn all the development boards and deploy them in the production environment.
6. Run the command `wiot status` in the project folder to see if all nodes are online. If not, use the command `wiot log` with the `grep` tool to find the log location problem.
7. Start writing your wiot program from the main project script (default is `index.js`).
8. Use the command `wiot check` to check the logic of your wiot program.
9. Use the command `wiot test` to suspend the running program in the cloud module and run the program in the current project folder. At this point, all console output will be displayed in your command line window. Use `Ctrl+C` to terminate the current test and restore the previous program of the cloud module.
10. Use the command `wiot push` to deploy the local wiot program to the cloud.

## Other operations

### Deploy your own wiot cloud module

Install docker and run the command `docker run -d --name=wiot-cloud -p 3594:3594 -v /var/wiot/data/:/var/wiot/data/ iotcat/wiot`.

### wiot-cli command

 - `wiot help [command]` view help
 - `wiot clone <host:user/project>` to clone the project from the cloud module to the local
 - `wiot pull` uses remote code to overwrite local code
 - `wiot push` deploys the current folder wiot program to the cloud module
 - `wiot ls` shows all current nodes
 - `wiot map [nodeID]` shows the connection path of a node
 - `wiot log [nodeID] [--head=<number>|--tail=<number>]` view the log of a node
 - `wiot stop` stop wiot service
 - `wiot start` to start wiot service
 - `wiot restart` restart wiot service
 - `wiot reload` restarts the wiot service without resetting the flash variable
 - `wiot init <name>` creates and initializes the wiot project folder
 - `wiot node init <node-name> [--type=<master|slave|bridge|debug>]` configure and burn nodeMCU development board
 - `wiot check` checks the current folder project logic problem.
 - `wiot test` will suspend the running program in the cloud module and run the program in the current project folder. At this point, all console output will be displayed in your command line window. Use `Ctrl+C` to terminate the current test and restore the previous program of the cloud module.
 - `wiot status [nodeID]` displays current project or node status information
 - `wiot debug start` terminates the current cloud program and enters debug mode
 - `wiot debug set <nodeID> <pinID> <0-255>`Set the PWM output value of a node pin in debug mode
 - In `wiot debug reset <nodeID>`debug mode, reset the data storage of a node and reconnect
 - `wiot debug get <nodeID> <pinID>` get the PWM value of a node pin in debug mode
 - `wiot debug sleep <nodeID> <pinID> <HIGH|LOW>`debug mode to set a node to lightly sleep until it is awakened by a pin's high or low level
 - `wiot debug dsleep <nodeID> <millisecond>` set how many milliseconds a node deeply sleeps in debug mode
 - In `wiot debug reconnect [nodeID]`debug mode, reconnect to the network or disconnect and reconnect to a node

### Common API
> To be designed, please refer to [One-round development wiot document](https://wiot.yimian.xyz/#/home)

{% raw %}</span>{% endraw %}
