---
title: Arduino中[]=重载导致的String调用问题
titleEN: String call problem caused by []= overload in Arduino
date: 2019-07-21
categories:
- tech
tags:
- Arduino
- cpp
---


{% raw %}<span class=".zh">{% endraw %}
最近在物联网开发中使用Arduino搭建LoRa网关和节点，发现在调用String时总遇到一些奇奇怪怪的现象。经过排查，发现是由于其它地方[]=运算符的重载所导致。
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Recently, I have used Arduino to build LoRa gateways and nodes in the development of the Internet of Things, and I found that some strange phenomena are always encountered when calling String. After investigation, it was found that it was caused by overloading of the []= operator elsewhere.
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

为了方便，在开发节点时，我们使用了[LoRa-Socket](https://github.com/iotcat/lora-socket)和[ArduinoJSON](https://arduinojson.org/)作为依赖。我们发现这两个依赖分别使用时表现良好，但如果在同一个项目文件中使用，则会导致一些怪异的问题。

## 情况一
通过指针调用函数时String参数传递异常。代码如下：

```C
    inline static void _onReceived(const String& msg, const String& from, const String& to, const String& type){
        (*_f)(msg, from, to, type);
    };
```

在这个案例中，我们发现msg等String在此函数中的数值是一切正常的，可是却没有能够成功传递到_f中。经过一系列骚操作，我们得出如下结论：
 - 发现如果将String换成int或其它类型，则参数传递至_f一切正常。有问题的只有String和char类型。
 - 我们尝试过将String转换为其它类型，再转回，但是没有效果。
 - String或char类型全局变量的声明会使单片机崩溃。
 - 当我们将ArduinoJSON依赖删去，String参数的传递则一切正常。

我们从而可以得出，这种怪异现象是由于与ArduinoJSON包的冲突所致。

## 情况二
在使用[ArduinoVector](https://github.com/tomstewart89/Vector)制作String类型Vector时，我们也发现了String类型的不稳定现象。神奇的是，这种现象只出现在String的使用中，其它如int类型运作良好。

这些不稳定现象可以总结如下：
 - 赋值时被截断
 - String值局部乱序
 - String值部分乱码
 - 作为参数传给函数时会失败，读取出来是空(与案例一类似)

## 综述
通过上述两个案例，我们可以初步总结出，这是由于[]=赋值运算符的重载与String有冲突。只要使用[]=重新定义String，即有可能出现String怪异的问题。



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

For convenience, we used [LoRa-Socket](https://github.com/iotcat/lora-socket) and [ArduinoJSON](https://arduinojson.org/) as dependencies when developing nodes. We found that these two dependencies perform well when used separately, but if used in the same project file, it will cause some weird problems.

## Situation One
When calling a function through a pointer, the String parameter passing is abnormal. code show as below:

```C
    inline static void _onReceived(const String& msg, const String& from, const String& to, const String& type){
        (*_f)(msg, from, to, type);
    };
```
In this case, we found that the value of msg and other String in this function is all normal, but it was not successfully passed to _f. After a series of Sao operations, we come to the following conclusions:
 - Found that if you change String to int or other types, the parameters passed to _f are all normal. Only the String and char types are problematic.
 - We tried to convert String to other types, and then back, but to no avail.
 - The declaration of global variables of type String or char will crash the microcontroller.
 - When we delete the ArduinoJSON dependency, the passing of String parameters is normal.

We can conclude that this strange phenomenon is caused by the conflict with the ArduinoJSON package.

## Situation Two
When using [ArduinoVector](https://github.com/tomstewart89/Vector) to make a String type Vector, we also discovered the instability of the String type. The magic is that this phenomenon only occurs in the use of String, other types such as int work well.

These instabilities can be summarized as follows:
 - Truncated during assignment
 - String values ​​are locally out of order
 - Part of the String value is garbled
 - It will fail when passed as a parameter to the function, and it will be empty (similar to case 1)

## Summary
Through the above two cases, we can preliminarily conclude that this is due to the conflict between the overload of the []= assignment operator and String. As long as you use []= to redefine String, string weird problems may occur.

{% raw %}</span>{% endraw %}