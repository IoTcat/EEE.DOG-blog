title: Arduino中[]=重载导致的String调用问题
date: 2020-06-16 15:43:54
categories:
- tech
tags:
---
最近在物联网开发中使用Arduino搭建LoRa网关和节点，发现在调用String时总遇到一些奇奇怪怪的现象。经过排查，发现是由于其它地方[]=运算符的重载所导致。


<!--more-->

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