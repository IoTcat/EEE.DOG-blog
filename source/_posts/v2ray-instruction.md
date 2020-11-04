---
title: Ushio-V2ray使用方法
titleEN: Ushio V2ray Instruction
date: 2020-11-04
categories:
- tech
tags:
- v2ray
- instruction
---


{% raw %}<span class=".zh">{% endraw %}
Ushio V2ray 使用方法。
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Ushio V2ray Instruction..
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

## 流程总览

 - 用户注册
 - v2ray软件安装

## 用户注册

在开始安装软件前，请先前往[https://v2ray.yimian.xyz/](https://v2ray.yimian.xyz/)使用手机号进行账户注册。

## v2ray软件安装

本文包含[Win10](#Win10)，[安卓](#Android)，[IOS/Ipad OS](#Ios)的软件安装方法，请根据相应流程进行安装。

> 如果您有任何疑惑，请在下方评论中提出！

### Win10

**下载**

 - 使用浏览器访问[http://eee.dog/8bcc14](https://onedrive.yimian.xyz/packages/programs/all/v2ray/Windows_v2rayN-Core.zip)下载名为`Windows_v2rayN-Core.zip`的压缩文件。

**解压**
 - 将下载的压缩文件解压到C盘根目录，如下图
 > 如果提示需要**管理员权限**，请一律选**是**

 ![解压文件图](https://api.yimian.xyz/img/?path=imgbed/img_2eb9b63_1565x429_8_null_normal.jpeg)

**配置**
 - 请打开C盘中刚才解压的文件夹，找到名为`V2ray`或`V2rayN.exe`的程序，双击打开。如下图。
![V2rayN图](https://api.yimian.xyz/img/?path=imgbed/img_430e95a_1557x460_8_null_normal.jpeg)
 - 找到右下角任务栏，找到下图中的图标，双击打开
![V2rayN图标](https://api.yimian.xyz/img/?path=imgbed/img_3a35a1f_928x246_8_null_normal.jpeg)
 - 选中窗口上方的**订阅**，点击**订阅设置**如下图
![订阅设置](https://api.yimian.xyz/img/?path=imgbed/img_4574629_1421x180_8_null_normal.jpeg)
 - 打开[https://v2ray.yimian.xyz](https://v2ray.yimian.xyz/)并登录，待出现二维码后点击**Copy**。如下图
![获取订阅地址](https://api.yimian.xyz/img/?path=imgbed/img_6d86c79_1254x711_8_null_normal.jpeg)

 - 回到订阅设置的窗口，将刚才复制的内容粘贴到**地址URL框**中，勾选**启用**，点击**确定**。如下图
![设置订阅地址](https://api.yimian.xyz/img/?path=imgbed/img_50dc56e_867x752_8_null_normal.jpeg)

 - 点击主窗口上方的**参数设置**如下图

![参数设置](https://api.yimian.xyz/img/?path=imgbed/img_6a56090_1313x195_8_null_normal.jpeg)

 - 选择**V2rayN设置**，勾选**开机自动启动**，点击下方**确定**。如下图

![开机启动](https://api.yimian.xyz/img/?path=imgbed/img_0b74331_993x1020_8_null_normal.jpeg)

 - 回到主窗口，点击**更新订阅**如下图

![更新订阅](https://api.yimian.xyz/img/?path=imgbed/img_396bcc7_1037x174_8_null_normal.jpeg)

 - 此时，主窗口中会多出一个或几个服务器，如下图

 ![服务器列表](https://api.yimian.xyz/img/?path=imgbed/img_4419a90_1196x216_8_null_normal.jpeg)

 - 关闭主窗口，右键右下角状态栏中的V2ray，选择**服务器**->**Vmess-Los_Angeles(....**。如下图
 ![选择服务器](https://api.yimian.xyz/img/?path=imgbed/img_0266a2f_1067x288_8_null_normal.jpeg)

 - 右键右下角状态栏中的V2ray，选择**Http代理**->**...（PAC模式）**。如下图
 ![PAC模式](https://api.yimian.xyz/img/?path=imgbed/img_8c3a651_1088x306_8_null_normal.jpeg)


**验证**

 - 浏览器打开[https://google.com](https://www.google.com)试一下能否访问。


### Android

**下载安装软件**

 - 浏览器打开[http://eee.dog/6db2e3](https://onedrive.yimian.xyz/packages/programs/all/v2ray/Android_v2rayNG_1.3.1.apk)下载V2ray安卓安装包
 - 点开安装包进行安装


**配置**

 - 使用手机浏览器，打开[https://v2ray.yimian.xyz/](https://v2ray.yimian.xyz/)，进行登录
 - 待页面显示出二维码，点击**Copy**
 - 打开安装的V2rayNG软件,点击左上角三条杠，展开左侧栏，点击**订阅设置**
 - 进入订阅设置页面后，点击右上角**加号**
 - 备注中填**ushio**, 地址url中填**刚才复制的东西**，点击右上角对勾。
 - 回到主页面，点击左上角三条杠，展开左侧栏，点击**设置**
 - 进入设置页面后，点击**分应用代理**
 - 勾选**分应用代理**模式，然后在列表中勾选需要访问外网的app，如twitter, youtube等
 - 回到主页面，点击右上角三个点，点击**更新订阅**
 - 点一下主页面列表中的**Los_Angeles**，使其左侧变绿
 - 点击主页面右下角的V图标，使其变绿

**验证**

 - 点击主页面下方**已连接，点击测试连接**语句，检测连接是否成功


### Ios


 - 在系统设置中更改苹果账户的地区到中国大陆以外的地方，比如英国、美国等。
 - 在app store购买并安装Shadowrocket软件
 - 使用浏览器打开[https://v2ray.yimian.xyz](https://v2ray.yimian.xyz/)，进行登录
 - 待页面显示出二维码，点击**Copy**
 - 打开Shadowrocket软件
 - 点击右上角加号
 - 类型选择**Subscribe**
 - URL中粘贴刚才复制的东西
 - 点击右上角完成
 - 点击首页中的api.yimian.xyz，点击**Los_Angeles**
 - 在首页第一行，勾选**Los_Angeles**
 - 使用浏览器访问[https://google.com](https://www.google.com)试一下



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## Process overview

 - User registration
 - v2ray software installation

## User registration

Before installing the software, please go to [https://v2ray.yimian.xyz/](https://v2ray.yimian.xyz/) to register with your mobile phone number.

## v2ray software installation

This article contains software installation methods for [Win10](#Win10), [Android](#Android), [IOS/Ipad OS](#Ios), please install according to the corresponding process.

### Win10

**download**

 - Use a browser to visit [http://eee.dog/8bcc14](https://onedrive.yimian.xyz/packages/programs/all/v2ray/Windows_v2rayN-Core.zip) and download the name `Windows_v2rayN-Core.zip `The compressed file.

**Unzip**
 - Decompress the downloaded compressed file to the root directory of drive C, as shown below
 > If you are prompted to require **administrative permissions**, please select all **yes**
 
 ![Extracted file image](https://api.yimian.xyz/img/?path=imgbed/img_2eb9b63_1565x429_8_null_normal.jpeg)

**Configuration**
 - Please open the folder just unzipped in the C drive, find the program named `V2ray` or `V2rayN.exe`, and double-click to open it. As shown below.
![V2rayN picture](https://api.yimian.xyz/img/?path=imgbed/img_430e95a_1557x460_8_null_normal.jpeg)
 - Find the taskbar in the lower right corner, find the icon in the figure below, double-click to open
![V2rayN icon](https://api.yimian.xyz/img/?path=imgbed/img_3a35a1f_928x246_8_null_normal.jpeg)
 - Select **Subscription** at the top of the window, and click **Subscription Settings** as shown below
![Subscription Settings](https://api.yimian.xyz/img/?path=imgbed/img_4574629_1421x180_8_null_normal.jpeg)
 - Open [https://v2ray.yimian.xyz](https://v2ray.yimian.xyz/) and log in. After the QR code appears, click **Copy**. As shown below
![Get subscription address](https://api.yimian.xyz/img/?path=imgbed/img_6d86c79_1254x711_8_null_normal.jpeg)

 - Go back to the subscription settings window, paste the content you just copied into the **Address URL box**, check **Enable**, and click **OK**. As shown below
![Set subscription address](https://api.yimian.xyz/img/?path=imgbed/img_50dc56e_867x752_8_null_normal.jpeg)

 - Click **Parameter Settings** at the top of the main window as shown below

![Parameter settings](https://api.yimian.xyz/img/?path=imgbed/img_6a56090_1313x195_8_null_normal.jpeg)

 - Select **V2rayN Settings**, tick **Autostart at boot**, and click **OK** below. As shown below

![Start on boot](https://api.yimian.xyz/img/?path=imgbed/img_0b74331_993x1020_8_null_normal.jpeg)

 - Back to the main window, click **Update Subscription** as shown below

![Update Subscription](https://api.yimian.xyz/img/?path=imgbed/img_396bcc7_1037x174_8_null_normal.jpeg)

 - At this time, there will be one or more servers in the main window, as shown below

 ![Server list](https://api.yimian.xyz/img/?path=imgbed/img_4419a90_1196x216_8_null_normal.jpeg)

 - Close the main window, right-click V2ray in the status bar at the bottom right corner, and select **Server**->**Vmess-Los_Angeles(....**. As shown below
 ![Select Server](https://api.yimian.xyz/img/?path=imgbed/img_0266a2f_1067x288_8_null_normal.jpeg)

 - Right-click V2ray in the status bar at the bottom right corner, and select **Http Proxy**->**...(PAC Mode)**. As shown below
 ![PAC Mode](https://api.yimian.xyz/img/?path=imgbed/img_8c3a651_1088x306_8_null_normal.jpeg)


**verification**

 - Open [https://google.com](https://www.google.com) in your browser to check if you can access it.


### Android

**Download and install software**

 - Open the browser [http://eee.dog/6db2e3](https://onedrive.yimian.xyz/packages/programs/all/v2ray/Android_v2rayNG_1.3.1.apk) to download the V2ray Android installation package
 - Click to open the installation package to install


**Configuration**

 - Use your mobile browser to open [https://v2ray.yimian.xyz/](https://v2ray.yimian.xyz/) and log in
 - When the QR code is displayed on the page, click **Copy**
 - Open the installed V2rayNG software, click the three bars in the upper left corner, expand the left column, and click **Subscription Settings**
 - After entering the subscription settings page, click the **plus sign** in the upper right corner
 - Fill in **ushio** in the remarks, fill in the things you just copied in the address url, and click the tick in the upper right corner.
 - Back to the main page, click the three bars in the upper left corner, expand the left column, and click **Settings**
 - After entering the settings page, click **Sub App Proxy**
 - Check the **Sub App Proxy** mode, and then check the apps that need to access the Internet, such as twitter, youtube, etc.
 - Back to the main page, click the three dots in the upper right corner, and click **Update Subscription**
 - Tap **Los_Angeles** in the main page list to make the left side green
 - Click the V icon in the lower right corner of the main page to make it green

**verification**

 - Click **Connected at the bottom of the main page, click the test connection** statement to check whether the connection is successful


### Ios


 - Change the Apple account area in the system settings to a place outside of mainland China, such as the United Kingdom, the United States, etc.
 - Purchase and install Shadowrocket software in the app store
 - Use a browser to open [https://v2ray.yimian.xyz](https://v2ray.yimian.xyz/) and log in
 - When the QR code is displayed on the page, click **Copy**
 - Open the Shadowrocket software
 - Click the plus sign in the upper right corner
 - Type selection **Subscribe**
 - Paste what you just copied in the URL
 - Click on the upper right corner to finish
 - Click api.yimian.xyz on the homepage, click **Los_Angeles**
 - On the first line of the homepage, check **Los_Angeles**
 - Use a browser to visit [https://google.com](https://www.google.com) to try


{% raw %}</span>{% endraw %}