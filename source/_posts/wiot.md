---
title: wIoT - 轻松物联
titleEN: wIoT - Easy IoT
date: 2019-05-20
display: true
categories:
- tech
tags:
- iot
- WiFi
- nodeJS
---

{% raw %}<span class=".zh">{% endraw %}
基于NodeJS搭建的物联网系统，配合D1 MINI单片机，帮助你灰常快速实现物联~

{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
The Internet of Things system based on NodeJS, combined with D1 MINI microcontroller, helps you quickly realize the Internet of Things~

{% raw %}</span>{% endraw %}


<!--more-->

{% raw %}
<script>
    session.onload(function(){
        if(page.tran.getLang() == 'en'){
            tips.warning({
                title: 'Caution',
                position: 'topRight',
                message: 'English version may be not up to date!!',
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


### wIoT for NodeJS
适用于NodeJS的wIoT服务器控制组件，轻松物联

# 项目简介

## 立项初衷
本项目旨在帮助不熟悉固件编程的网络开发者实现出自己的物联网应用。您仅需要一台网络内部的服务器（比如树莓派），以及若干个支持可联网（通过串口，WiFi，LoRa，蓝牙，Zigbee等）的单片机，即可轻松创建并管理属于您自己的物联网集群。

## 支持功能
 - ota (隔空自动更新固件)
 - 自动扫描网络内单片机
 - 通过wifi连接设置
 - 使用socket/HTTP通信

## todo List
 - 支持python界面
 - 开发web面板，图像化管理
 - 支持更多单片机，比如esp8266等
 - 开发nodeJS wiot-cli 命令行程序
 - 支持nodeJS自动烧写固件，并自动配置(很重要)


# 使用方法

> 正式开发文档见[**这里**](https://wiot.yimian.xyz/#/home)


## 先觉条件
 - 拥有烧录好[wIoT固件](https://wiot-ota.yimian.xyz/get.php)的**D1 MINI**单片机
 - 一台或多台无线WiFi路由器2.4G/5G
 - 局域网内拥有一台装有**NodeJS**的服务器或电脑 (NodeJS装法非常简单, 请自行Google或百度)
 - 配置好**npm**

## 快速开始

### 单片机接入
1. 使用MicroUSB, 5V, 或3V pin脚给单片机供电
2. 用一根导线连接D0脚与3V3脚，持续一秒以上拔出，以重置单片机
3. 用手机或电脑搜索它的WiFi热点，名称格式`wiot-xx:xx:xx:xx:xx:xx`
4. 连接上此热点，密码为`1234567890`
5. 用浏览器打开网址`http://192.168.0.1`，记录网页中的MAC地址，这将用于识别此单片机
6. 配置你无线路由器的ssid(即wifi名称，注意不能有非ASCII字符，比如汉字)和密码
7. 配置完成后热点将自动断开，单片机将连接到你的无线路由器

### 依赖安装
在你的项目文件夹下打开命令行，输入以下指令安装wiot:

````shell
$ npm install wiot
````
### 使用方法
在你的项目文件夹中新建一个app.js文件，输入以下内容：

```js
var wiot = require('wiot'); //引入wiot依赖包

// 新建一个单片机对象
// 这里使用了两个参数，MAC是单片机的MAC地址，pin中指定需要OUTPUT输出的端口
// 请自行修改MAC地址的值
var MyMCU = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});


// 以下代码将实现，板载led亮1秒，灭1秒的循环

// 等待所有单品即准备就绪
wiot.begin([MyMCU], ()=>{ // 第一个参数为要等待的单片机对象数组，第二个参数为要执行的函数
    // 设置计时器，每隔2000毫秒, MyMCU的3号pin口将拉高一次电平
    setInterval(()=>{
        MyMCU.write(wiot.D4, wiot.HIGH);
    }, 2000);

    // 设置计时器，延时1000毫秒后开始执行大括号中指令
    setTimeout(()=>{
        // 设置计时器，每隔2000毫秒，MyMCU的3号pin口将拉低一次电平
        setInterval(()=>{
            MyMCU.write(wiot.D4, wiot.LOW);
        }, 2000);
    }, 1000);
});
```

### 开始执行
在项目文件夹中打开命令行，输入以下指令:

````bash
node app.js
````

### 预期结果
如果一切顺利，你现在应该会发现你的板载led在闪烁了

### 社区支持
也许你会觉得上述代码难以理解，这是正常的，由于delay功能在JS中难以实现。但是不用担心，这些问题将会由社区中的其它开发者帮你解决。  
  
wIoT在实现基本的单片机控制同时，也提供了丰富的[扩展功能](#传感器扩展模块)。更神奇的是，任何人都可以在wIoT中编写自己的扩展并与全世界共享它们。在这里我们可以使用wIoT官方提供的led扩展轻松实现上例功能！

```js
var wiot = require('wiot'); //引入wiot依赖包

// 新建一个单片机对象
var MyMCU = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});

// 新建一个led模块
var led = new wiot.led(MyMCU, wiot.D4);

// 以下代码将实现，板载led亮1秒，灭1秒的循环

// 等待所有单品即准备就绪
wiot.begin([MyMCU], ()=>{

    // 调用led模块构建亮1秒灭1秒的动作
    led.set([wiot.HIGH, wiot.LOW], [1000, 1000]);
});

```


## 进阶设置

### wiot.client

#### 参数说明

{% raw %}
<div style="overflow:scroll;">
{% endraw %}

名称 | 默认值 | 描述
----|-------|----
MAC | "" | 单片机的MAC地址
pin | {D1: 0, D2: 0, D3: 0, D4: 0, D5: 0, D6: 0, D7: 0, D8: 0} | pin脚的模式, 0为INPUT, 1为OUTPUT, 2为INPUT_PULLUP 
hint | true | 是否显示状态提示
debug | false | 是否开启debug模式
ip | "default" | 指定单片机IP, 请在长时间搜索不到IP时尝试此选项
port | 8848 | Client的TCP Socket通信端口，默认8848
ip_range | "192.168.0" | IP搜索字段，请在长时间搜索不到IP时尝试此选项
localIP | "127.0.0.1" | 本机IP
OnlyHTTP | false | 是否仅使用HTTP模式连接单片机
errDelayTime | 2000 | 遇到网络错误时重试间隔时间(毫秒)
okDelayTime | 30 | 收到网络请求后延时等待时间(毫秒)
resetDelayTime | 4500 | 向单片机发送重置指令后多久不再发送新消息(毫秒)
noTryMaxTime | 15000 | 经过此时间单片机仍未响应则重新发送消息(毫秒)
IntervalTime | 2000 | 监听行为心跳间隔
MaxToReScanTime | 180000 | 经过此事件单片机无响应则从新扫描IP地址(毫秒)
MinResearchTime | 5000 | 搜索IP经过一此轮询后间隔时间(毫秒)
IpScanTimeout | 1 | IP扫描时的Ping检测超时时间(秒)
pingTimeout | 2 | 心跳Ping检测的超时时间(秒)
MaxTraceBackTimes | 8 | 判断连接状态所向前追溯的历史心跳个数

{% raw %}
</div>
{% endraw %}


例如：

```js
var MyMCU = new wiot.client({
    MAC: "xx:xx:xx:xx:xx:xx",
    pin: {
        D1: 0,
        D2: 0,
        D3: 1,
        D4: 1,
        D5: 0,
        D6: 1,
        D7: 0,
        D8: 0
    },
    hint: true,
    debug: false,
    ip: "192.168.0.55",
    port: 6666,
    ip_range: "192.168.0",
    localIP: "127.0.0.1",
    errDelayTime: 2000,
    okDelayTime: 30,
    resetDelayTime: 4500,
    noTryMaxTime: 15000,
    IntervalTime: 2000,
    MaxToReScanTime: 180000,
    MinResearchTime: 5000,
    IpScanTimeOut: 1,
    pingTimeout: 2,
    MaxTraceBackTimes: 8
});

```

#### 方法列表

+ `.write(pin: wiot.pin/number, state: iot.state/number)`: 向指定pin口输出状态指令，状态可以是wiot.HIGH/wiot.LOW或PWM调制(0-255数字)
+ `wiot.read(pin: wiot.pin/number)`: 读取指定pin口状态，数字pin返回wiot.HIGH/wiot.LOW，模拟pin返回0-1024数值



#### 事件绑定

`.on(event, handler)`

**client事件列表**
- `begin`  开始于单片机正常交互
- `disConnected`  与单片机断开连接
- `reConnected`   与单片机恢复连接

```js
var MCU = new wiot.client({"MAC": "xx:xx:xx:xx:xx:xx"});

MCU.on('disConnected', function () {
    // 当与MCU失联时会执行此处指令
    console.log('Disconnected with MCU!!');
});
```

`.pinOn(pin, event, handler)`

**pin事件列表**
- `on` pin口电位从低到高
- `off` pin口电位从高到低
- `change` pin口电位变化


```js
var MCU = new wiot.client({"MAC": "xx:xx:xx:xx:xx:xx"});

MCU.pinOn(wiot.D2, 'on', function () {
    // 当MCU的D2电位由低到高时会执行
    console.log('D2 from LOW to HIGH!!');
});
```


### API

+ `wiot.begin()`: 单片机准备完成后开始执行

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});
MCU1 = new wiot.client({MAC: "xx:xx:xx:xx:xx:ww"});

wiot.begin([MCU0, MCU1], ()=>{
    //这里放你要执行的指令
    //这些指令将会在MCU0和MCU1准备就绪后开始执行
});
```

+ `wiot.loop()`: 循环执行的指令，适合于条件控制语句

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});
MCU1 = new wiot.client({MAC: "xx:xx:xx:xx:xx:ww"});

// 以下代码将实现: 当MCU0的D5接收到HIGH，MCU1的D4将会输出HIGH
//                当MCU0的D5接收到LOW, MCU1的D4将会输出LOW
// 本函数接受两个参数: 第一个是MCU对象数组, 第二个是参数为MCU对象数组的函数
wiot.loop([MCU0, MCU1], () => {
    if(MCU1.read(wiot.D5) == wiot.HIGH){
        MCU0.write(wiot.D4, wiot.HIGH);
    }else{
        MCU0.write(wiot.D4, wiot.LOW);
    }
});

```

### 注册表
+ `wiot.register.set(status1, status2, function)`: 向注册表中添加一条规则, status可以是值或函数，当status1==status2时会触发function。
注册表的设计是为了方便协调各扩展模块的使用，详见下文[扩展模块](#传感器扩展模块)。
+ `wiot.register.set(status, function)`: 你也可以传入两个函数，其中status的返回值是bool型，变为true时触发function

```js
var myLED = wiot.led(MyMCU, wiot.D4);
var pir = wiot.pir(MyMCU, wiot.D2);

//注册一条规则，当pir探测到人时，myLED亮
wiot.register.set(pir.getStatus, wiot.HIGH, ()=>{
    myLED.set(wiot.HIGH);
});

//注册一条规则，当人离开时，myLED灭
wiot.register.set(()=>{
    return (wiot.LOW == pir.getStatus);
}, ()=>{
    myLED.clear();
});
```


## 传感器扩展模块

### LED
+ `wiot.led(MCU, pin)`: 声明一个led模块
+ `wiot.led.getStatus()`: 获取led状态
+ `wiot.led.set(status, time = 0, isSmooth = false)`: 设置led状态，起始状态，中间状态，最终状态，周期
+ `wiot.led.breath(period)`: 设置一个呼吸灯
+ `wiot.led.clear()`: 重置led

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});

var myLED = wiot.led(MCU0, wiot.D4); //新建一个led对象，使用MCU0上的D4口

/* 如果myLED不亮，则点亮它 */
if(!myLED.getStatus()){
    myLED.set(wiot.HIGH);
}

/* 设置一个周期为2秒的呼吸灯 */
myLED.breath(2000);

/* 设置一个亮三秒，灭四秒的led */
myLED.set([wiot.HIGH, wiot.LOW], [3000, 4000]);

/* 设置一个呼1秒吸3秒的呼吸渐变灯 */
myLED.set([wiot.LOW, wiot.HIGH], [1000, 3000], true);

/* 自定义一个先半亮2秒再全亮3秒再熄灭2秒的led灯 */
myLED.set([100, wiot.HIGH, wiot.LOW], [2000, 3000, 2000]);

/* 熄灭led */
myLED.clear();

```

### PIR 红外人体传感器

+ `wiot.pir(MCU, pin)`: 声明一个PIR模块
+ `wiot.pir.getStatus()`: 获取PIR状态，返回值wiot.HIGH(有人)，wiot.LOW(无人)

**事件触发器**
+ `wiot.pir.on(event, handler)`

**事件列表**
- `detected`  探测到人
- `undetected`  人体移动出探测范围
- `change`   状态改变，包括有人到无人和无人到有人

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx"});

var myPIR = wiot.pir(MCU0, wiot.D2); //新建一个pir对象，使用MCU0上的D2口

/* 输出pir状态到控制台 */
console.log(myPIR.getStatus());

/* 当探测到人，打印 "Detected People!" 到控制台 */
myPIR.on("detected", ()=>{
    console.log("Detected People!");
});

/* 人移动出探测范围，打印 "No People!!" 到控制台 */
myPIR.on("undetected", ()=>{
    console.log("No People!!");
});

/* 当状态改变，执行指令 */
myPIR.on("change", ()=>{
    /* 你的指令 */
});

```

### IR 红外循迹/障碍传感器

+ `wiot.ir(MCU, pin)`: 声明一个IR模块，pin可以是模拟或数字端口
+ `wiot.ir.getStatus()`: 获取IR状态，返回值wiot.HIGH(有障碍)，wiot.LOW(无障碍)，或者0-1024数值(限模拟端口)

**事件触发器**
+ `wiot.ir.on(event, handler)`

**事件列表**
- `detected`  探测到障碍
- `undetected`  障碍消失
- `change`   状态改变

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx"});

var myIR = wiot.ir(MCU0, wiot.D2); //新建一个ir对象，使用MCU0上的D2口

/* 输出ir状态到控制台 */
console.log(myIR.getStatus());

/* 当探测到物体，打印 "Detected Object!" 到控制台 */
myIR.on("detected", ()=>{
    console.log("Detected Object!");
});

/* 物体移动出探测范围，打印 "No Object!!" 到控制台 */
myIR.on("undetected", ()=>{
    console.log("No Object!!");
});

/* 当状态改变，执行指令 */
myIR.on("change", ()=>{
    /* 你的指令 */
});

```

### lightSensor 光敏传感器

+ `wiot.lightSensor(MCU, pin)`: 声明一个lightSensor模块, pin可以是模拟或数字端口
+ `wiot.lightSensor.getStatus()`: 获取lightSensor状态，返回值wiot.HIGH(有光)，wiot.LOW(无光)，或者0-1024数值(限模拟端口)

**事件触发器**
+ `wiot.light.on(event, handler)`

**事件列表**
- `light`  由暗到明
- `dark`  由明到暗
- `change`   状态改变

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx"});

var myLightSensor = wiot.lightSensor(MCU0, wiot.D1); //新建一个pir对象，使用MCU0上的D2口

/* 输出LightSensor状态到控制台 */
console.log(mylightSensor.getStatus());

/* 当由暗到明，打印 "Light!!!" 到控制台 */
myLightSensor.on("light", ()=>{
    console.log("Light!");
});

/* 由明到暗，打印 "Dark!!" 到控制台 */
myLightSensor.on("dark", ()=>{
    console.log("Dark!!");
});

/* 当状态改变，执行指令 */
myLightSensor.on("change", ()=>{
    /* 你的指令 */
});
```


## 网络扩展模块

### mail 邮件模块
使用本模块向指定邮箱发送邮件。自豪地引用[Yimian API](https://api.yimian.xyz/)构建！

+ `wiot.mail(to, from = "wIoT")`: 声明一个mail模块，参数收件地址，发件人名称
+ `wiot.mail.send(subject, body)`: 发送邮件，需传入主题，邮件内容

```js
var mail = wiot.mail("i@iotcat.me", "wIoT Test");

mail.send("Test", "Test from wiot!!");

```

### guguji 咕咕机模块
使用本模块向指定咕咕机发送消息。咕咕机是一款便携式私人打印机，详见[官网](https://www.memobird.shop/)。使用本模块需要在官网提前申请好自己的开发者ak, 详见[这里](https://api.yimian.xyz/gugu/intro.php)。自豪地引用[Yimian API](https://api.yimian.xyz/)构建！

+ `wiot.guguji(ak, userID, memobirdID)`: 声明一个guguji模块，参数: 开发者ak, 用户id, 咕咕机id
+ `wiot.guguji.send(msg)`: 发送消息，需传入待发送的消息

```js
var gugu = wiot.guguji("9e55121803474371bfa25d20e554b31f", "832598", "b3ee06a8bd9b49e1");

gugu.print("This is from wIoT!!");

```




{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

# Quick Start

This project aims to help web developers who are not familiar with firmware programming to implement their own IoT applications. You only need a server inside the network (such as Raspberry Pi) and several MCUs (single-chip computers) that support networking (via serial port, WiFi, LoRa, Bluetooth, Zigbee, etc.), you can easily create and manage your own Internet of Things Cluster.

## Current Support devices
 - D1 MINI


## Node.js Install Node.js

Node.js is a widely used programming language for web developers. To make use of wIoT, you should first install Node.js to your computer.  

For **windows** user, you can follow the instruction in [this website](https://www.jianshu.com/p/03a76b2e7e00)    


## Install wIoT package

After install Node.js and configure npm successfully, you should then use npm to download wIoT package by enter following command in your command window.

```bash
npm install wiot
```

Windows user can use cmd or powershell.It should be notice that this may report error for some users. The solution is to open your cmd window as administrator. You can right click on cmd and choose *run as an administrator*. You can also press windows+R and input *cmd* then press Ctrl+Shift+Enter to open it as administrator.  


## Burn firmware


## Connect your device to D1 MINI
 - After burning the firmware, you should try to connect your device to D1 MINI
Follow the steps below, I'm sure it would not be a problem for such a smart person like you  

### 1. Reset your D1 MINI
 - Find pin **D0** on your D1 MINI, it should be in the middle of A0 and D5.      
 - Use a wire to connect **3V3** to **D0**. If your MINI works normally, you would see its BUILT-IN LED blink. 
 - You **don't** have to wait until it stops blink, just stay for **2s**, then you can pull out the wire and your MINI would reset.  

### 2.Find your D1 MINI on your device
 - After you finish step 1, your MINI would work in AP mode, which means you can search it with your smart phone or personal computer by scanning the Wi-Fi around     
 - If your MINI was reset successfully, you would find a Wi-Fi with SSID in the form of **wiot-xx:xx:xx:xx:xx:xx**.  
Example:         
![ssid](https://api.yimian.xyz/img/?path=docs/wiot/ssid.png)          
"xx:xx:xx:xx:xx:xx" is the MAC address of this MINI, please try to remember the address for you may use it later 

The default password for D1 MINI is **1234567890**, enter the password and you should be able to connect to your MINI.

## Connect D1 MINI to your Wi-Fi
Congratulations, you have successfully connect your device to D1 MINI        
However, this is not the end, you should now try to connect D1 MINI to your Wi-Fi          
Use the device which had just been connected to D1 MINI and follow the steps below            
                   
### 1. Visit the control page of D1 MINI
Visit **http://192.168.0.1** with the browser on your device             
Normally, you would see a webpage like this:          
![webpage](https://api.yimian.xyz/img/?path=docs/wiot/webpage.png)            
In this page, you can see the MAC Address and wIoT version of your MINI  
Again, please **remember** the MAC Address  

### 2.Submit SSID and password to your MINI         
From the page, you can see two blanks that ask the SSID and password of your Wi-Fi            
Input information of the Wi-FI which you would like to connect your MINI, click *Submit*             
If you have input the right SSID and password, you will see a page showing the message: **Set Successfully!! Rebooting!!**         
Then, after a minute, you will see the SSID of D1 MINI has vanished               
                  
If you submitted the wrong message, do not try to directly reconnect to D1 MINI.  Restart the whole procedure from the reset part of the last section


## Execute Example Code         
If you have successfully connect D1 MINI to your Wi-Fi, you can execute the example code below to realize a simple function of wIoT
Before executing the code, you should first connect a LED to D1 MINI with positive pole connect to pin D4 and negative pole connect to GND

```js
var wiot = require('wiot'); //Import wiot package from npm

// Create an object of single chip
// Here are two parameters, MAC is the MAC adress of single chip, the output port should be defined in pin
// The MAC address should be editted by user
var MyMCU = new wiot.client({MAC: "3C:71:BF:3A:F6:CF", pin: {D4 : 1}, hint : true});


// The following code can let the BUILTIN_LED turn on for one second and off for one second periodically

// Wait for all the chips to get ready
wiot.begin([MyMCU], ()=>{ 
    // First parameter is the name of chip, second parameter is the function that is going to be executed

    // Set timer, pin 3 of MyMCU will pull up every 2 seconds
    setInterval(()=>{
        MyMCU.write(wiot.D4, wiot.HIGH);
    }, 2000);

    // Set timer, executer the command in {} after a one-second delay
    setTimeout(()=>{

    // Set timer, pin 3 of MyMCU will pull down every 2 seconds
        setInterval(()=>{
            MyMCU.write(wiot.D4, wiot.LOW);
        }, 2000);
    }, 1000);
});

```

The LED is expected to blink after you execute the code



# Advanced development

## Parameters

{% raw %}
<div style="overflow:scroll;">
{% endraw %}

Name | Default Value | Declaration
----|-------|----
MAC | "" | MAC Address of MCU
pin | {D1: 0, D2: 0, D3: 0, D4: 0, D5: 0, D6: 0, D7: 0, D8: 0} | Mode of each pin, 0 is INPUT, 1 is OUTPUT, 2is INPUT_PULLUP 
hint | true | Whether print the status prompt
debug | false | Whether open the debug mode
ip | "default" | Specify MCU IP, please try this option when you cannot find IP for a long time
port | 8848 | TCP Socket communication port for Client, default 8848
ip_range | "192.168.0" | IP search field, try this option if you cannot find IP for a long time
localIP | "127.0.0.1" | local IP
errDelayTime | 2000 | Retry interval when network error is encountered (milliseconds)
okDelayTime | 30 | Waiting time after receiving the network request (milliseconds)
resetDelayTime | 4500 | Waiting time for stop sending new messages after sending reset instructions to MCU (milliseconds)
noTryMaxTime | 15000 | If the MCU fails to respond after this time, the message will be sent again (milliseconds).
IntervalTime | 2000 | Interval between monitoring (heartbeat)
MaxToReScanTime | 180000 | After this time, if the MCU has no response, it will scan the IP address again (in milliseconds).
MinResearchTime | 5000 | Interval between each polling
IpScanTimeout | 1 | Ping detection timeout for IP scanning (seconds)
pingTimeout | 2 | Timeout of Heartbeat Ping detection (seconds)
MaxTraceBackTimes | 8 | Determine the number of historical heartbeats traced back to the connection state

{% raw %}
</div>
{% endraw %}


## Parameters Declaration Example

### General Example

```js
var MyMCU = new wiot.client({
    MAC: "xx:xx:xx:xx:xx:xx",
    pin: {
        D1: 0,
        D2: 0,
        D3: 1,
        D4: 1,
        D5: 0,
        D6: 1,
        D7: 0,
        D8: 0
    },
    hint: true,
    debug: false,
    ip: "192.168.0.55",
    port: 6666,
    ip_range: "192.168.0",
    localIP: "127.0.0.1",
    errDelayTime: 2000,
    okDelayTime: 30,
    resetDelayTime: 4500,
    noTryMaxTime: 15000,
    IntervalTime: 2000,
    MaxToReScanTime: 180000,
    MinResearchTime: 5000,
    IpScanTimeOut: 1,
    pingTimeout: 2,
    MaxTraceBackTimes: 8
});

```



## Event Binding
### Client

`.on(event, handler)`

#### Event List of client

- `begin`  It begins when MCU starts to interact normally
- `disConnected`  Disconnect from MCU
- `reConnected`   Connection with MCU restored

```js
var MCU = new wiot.client({"MAC": "xx:xx:xx:xx:xx:xx"});

MCU.on('disConnected', function () {

    // Execute the command below when lost connection with MCU
    console.log('Disconnected with MCU!!');
});

```

### Pin

`.pinOn(pin, event, handler)`

#### Event List of pin

- `on` Change output of pin from LOW to HIGH
- `off` Change output of pin from HIGH to LOW
- `change` Change the output of pin

```js

var MCU = new wiot.client({"MAC": "xx:xx:xx:xx:xx:xx"});

MCU.pinOn(wiot.D2, 'on', function () {
    // Execute when the output of D2 changes from LOW to HIGH
    console.log('D2 from LOW to HIGH!!');
});


```


### API

+ `wiot.begin()`: Execute when MCU is ready

```js

MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});
MCU1 = new wiot.client({MAC: "xx:xx:xx:xx:xx:ww"});

wiot.begin([MCU0, MCU1], ()=>{

    //Write the command you want to execute here
    //These command would execute once MCU0 and MCU1 are ready
});


```



+
 `wiot.loop()`: A loop command，Suitable for conditional control statements

```js

MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx", pin: {D4: wiot.OUTPUT}});
MCU1 = new wiot.client({MAC: "xx:xx:xx:xx:xx:ww"});


// Following code would realize: When pin D5 of MCU0 receive HIGH，D4 of MCU1 would output HIGH
// When pin D5 of MCU0 receive LOW，D4 of MCU1 would output LOW

// This function receives two parameters: first is an array of objects for MCU, second is a function which use MCU array of objects as its parameter

wiot.loop([MCU0, MCU1], () => {
    if(MCU1.read(wiot.D5) == wiot.HIGH){
        MCU0.write(wiot.D4, wiot.HIGH);
    }else{
        MCU0.write(wiot.D4, wiot.LOW);
    }
});



```


### Register

+ `wiot.register.set(status1, status2, function)`: Add a rule to register that status can be either value or function,
function would trigger if status1 == status2
The registry is designed to facilitate the use of various extension modules, See [extension module] below (# Sensor Extension Module).

+ `wiot.register.set(status, function)`: You can also pass in two functions, where the return value of status is of type bool, it would trigger the function if it changes to true



```js

var myLED = wiot.led(MyMCU, wiot.D4);
var pir = wiot.pir(MyMCU, wiot.D2);

//Sign up for a rule that says myLED lights up when pir detects a person
wiot.register.set(pir.getStatus, wiot.HIGH, ()=>{
    myLED.set(wiot.HIGH);
});

//Sign up for a rule that when people leave, myLED goes off
wiot.register.set(()=>{
    return (wiot.LOW == pir.getStatus);
}, ()=>{
    myLED.clear();
});

```


## Sensor extension module

### LED

+ `wiot.led(MCU, pin)`: Declare a LED module
+ `wiot.led.getStatus()`: Get status of LED

+ `wiot.led.set(status, time = 0, isSmooth = false)`: Set led state, initial state, intermediate state, final state, period
+ `wiot.led.breath(period)`: Set a breathing LED
+ `wiot.led.clear()`: Reset LED

```js
var wiot = require('wiot'); //Import wiot package from npm
MCU0 = new wiot.client({MAC: "3C:71:BF:3A:F6:CF", pin: {D4: wiot.OUTPUT}});

var myLED = wiot.led(MCU0, wiot.D4); //Create a new led object using the D4 port on MCU0

/* If myLED is not shining, light it up*/
if(!myLED.getStatus()){
    myLED.set(wiot.HIGH);
}

/* Set a breathing light with cycle of 2s */
myLED.breath(2000);

/* Set a LED which light 3 seconds and off 4 seconds */
myLED.set([wiot.HIGH, wiot.LOW], [3000, 4000]);

/* Set a breathing light which use 1 second to light and 3 second to extinguish */
myLED.set([wiot.LOW, wiot.HIGH], [1000, 3000], true);

/* Set a LED which shine with half brightness for 2 seconds, shine with full brightness for 3 seconds and then dextinguish for 2 seconds  */
myLED.set([100, wiot.HIGH, wiot.LOW], [2000, 3000, 2000]);

/* Turn off LED */
myLED.clear();

```

### PIR (Passive Infrared Sensor)
+ `wiot.pir(MCU, pin)`: Declare a PIR module
+ `wiot.pir.getStatus()`: Gets the PIR state, returns the value wiot.high (have people), wiot.low (no people)

#### Event Trigger
+ `wiot.pir.on(event, handler)`



**Events List**

- `detected`  Person detected
- `undetected`  People out of the detective field
- `change`   State change, includes from detected to undetected and from undetected to detected

```js
var wiot = require('wiot'); //Import wiot package from npm

MCU0 = new wiot.client({MAC: "3C:71:BF:3A:F6:CF"});

var myPIR = wiot.pir(MCU0, wiot.D2); //Create an object of pir, use the D2 port on MCU0

/* Output the status of pir to console */
console.log(myPIR.getStatus());

/* When human is detected，print "Detected People!" to console */
myPIR.on("detected", ()=>{
    console.log("Detected People!");
});

/* When human is out of the detection zone，print "No People!!" to console */
myPIR.on("undetected", ()=>{
    console.log("No People!!");
});

/* When there is a change to status, execute your command */
myPIR.on("change", ()=>{
    /* Write command in here */
});

```


### IR Infrared Sensor

+ `wiot.ir(MCU, pin)`: Declare an IR module, pin can be analog or digital port
+ `wiot.ir.getStatus()`: Get IR state, return value wiot.high (with a barrier), wiot.low (with no barrier), or a value of 0-1024 (only for analog port)

#### Event Trigger

+ `wiot.ir.on(event, handler)`



**Event List**

- `detected`  Barrier detected
- `undetected`  Barrier vanished
- `change`   Change state

```js
MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx"});

var myIR = wiot.ir(MCU0, wiot.D2); //Create a new ir object using the D2 port on MCU0

/* Output ir status to console */
console.log(myIR.getStatus());

/* When an object is detected, print "Detected Object!" to the console */
myIR.on("detected", ()=>{
    console.log("Detected Object!");
});

/* When the object move out of the detective area, print "No Object!!" to the console */
myIR.on("undetected", ()=>{
    console.log("No Object!!");
});

/* Execute the command when state changes */
myIR.on("change", ()=>{
    /* Your command */
});

```


### lightSensor


+ `wiot.lightSensor(MCU, pin)`: Declare a lightSensor module, pin can be analog or digital port
+ `wiot.lightSensor.getStatus()`: Get lightSensor state, return value wiot.HIGH(light), wiot.LOW(dark), or a value of 0-1024 (limited to analog port)

#### Event Trigger
+ `wiot.light.on(event, handler)`



**Event List**

- `light`  From dark to light
- `dark`  From light to dark
- `change`   Change state

```js

MCU0 = new wiot.client({MAC: "xx:xx:xx:xx:xx:xx"});
var myLightSensor = wiot.lightSensor(MCU0, wiot.D1); //Create a new pir object using the D2 port on MCU0

/* Output the LightSensor state to the console */
console.log(mylightSensor.getStatus());

/* When going from dark to Light, print "Light!!!" to the console */
myLightSensor.on("light", ()=>{
    console.log("Light!");
});

/* When going from light to Dark, print "Dark!!" to the console */
myLightSensor.on("dark", ()=>{
    console.log("Dark!!");
});

/* When the state changes, execute the command */
myLightSensor.on("change", ()=>{
    /* Your command */
});

```


## Internet Extension Module


### Mail module
Use this module to send messages to the specified mailbox. Proudly built with reference to [Yimian API](https://api.yimian.xyz/)!



+ `wiot.mail(to, from = "wIoT")`: Declare an mail module with sender's name and reveiver's address
+ `wiot.mail.send(subject, body)`: Send email with a subject and content

```js
var mail = wiot.mail("i@iotcat.me", "wIoT Test");

mail.send("Test", "Test from wiot!!");

```



### guguji 
Use this module to send messages to the specified cooing machine.Goo goo is a portable private printer, see [official website](https://www.memobird.shop/).
To use this module, you need to apply for your own developer ak in advance on the official website. See [here](https://api.yimian.xyz/gugu/intro.php). Proudly reference [Yimian API](https://api.yimian.xyz/)!

+ `wiot.guguji(ak, userID, memobirdID)`: Declare a goo goo chicken module, parameter: developer's ak, user id, cooing machine id
+ `wiot.guguji.send(msg)`: Send message, need to pass in the message to be sent

```js
var gugu = wiot.guguji("9e55121803474371bfa25d20e554b31f", "832598", "b3ee06a8bd9b49e1");

gugu.print("This is from wIoT!!");

```


{% raw %}</span>{% endraw %}
