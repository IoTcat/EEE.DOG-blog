---
title: 总结一下我的代码风格
titleEN: Summarize my code style
date: 2019-02-26
categories:
- tech
tags:
- cpp
---



{% raw %}<span class=".zh">{% endraw %}
我的代码风格大致有以下几种情况：组织中追随组织领导，公司里老板说的都对，学校里大佬教的都好╮(╯▽╰)╭ 仅其它一些自己的开源小项目则遵循以下风格→_→
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
My coding style is roughly in the following situations: I follow the leadership of the organization, the boss in the company is right, and the big guys in the school teach well ╮(╯▽╰)╭ Only some other small open source projects of their own follow The following style→_→
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
## 关于强迫症
首先说好，

四个空格的Tab缩进大法好！！！
四个空格的Tab缩进大法好！！！
四个空格的Tab缩进大法好！！！

大括号不换行！！！
大括号不换行！！！
大括号不换行！！！


## 关于命名

命名以让别人一眼就能明白为佳，理想中看你的代码就像读一首英语小诗般惬意 ::aru:insidious:: 

### 常/变量命名

编译器常量全大写，字符间用单下划线连接。如：
````C
#define WIFI_PASSWD 12345
````

变量基本采用小驼峰命名，规则是单词之间直接连接(无需下划线)，第一个单词全小写，之后的单词首字母大写。如：
````C++
String usrName = "IoTgod";
````
频繁调用的变量名称不易过长，但却要表意清晰。
要实现这一点，可以尝试部分省略单词中的非首字母元音，如 user 可以简写为 usr，password 可省略为 passwd 或 psswd。但简化后的名字仍需容易辨识。

全局变量使用 g_ 加变量名称命名，如
````C++
global int g_isLightOn = 0;
````

局部静态变量使用 s_ 加变量名称，如
````C++
static int s_errorCounter = 0;
````
常量变量，命名与普通变量一致，如
````C++
const float pi = 3.14159265;
````

### 函数命名

函数命名技巧偷师自大名鼎鼎的[Nginx][1]，并在其基础上稍有变动。
基本法则为 *小写标签名+__(双下划线)+小写动词+小写名词()*
名词与名词间用单下滑线链接。
例如：
````php
function db__get_usr_info();
````
其中db意为Database, 提示这个函数属于数据库操作标签，作用是获取用户信息。

如果你不需要标签（比如在一些面向对象的语言中），你可以肆意省略标签。如：
````php
function get_usr_info();
//or
function  db::get_usr_info();
````
与变量命名不同，函数命名不必要很短，以表达清楚函数功能为目标

## 关于注释

其实如果能把变量函数命名做好，便不需要什么注释了，但遗憾的是，，我们还是不得不注释。。

### 文件注释
文件注释主要用于声明一些文件功能，分类名，文件名，版权等信息，一个样式如下：
````php
/**
 * cookie支持 #文件功能
 *
 * @category typecho #文件所属的分类
 * @package Cookie #文件名称
 * @copyright Copyright (c) 2008 Typecho team (http://www.typecho.org) #作者及版权信息
 * @license GNU General Public License 2.0 #开源协议
 * @version 2.1.1 #版本
 */
````
### 类注释
类注释用于声明类的一些基本信息，如类功能，作者姓名、所属分类、所属文件。例如：
````php
/**
 * 数据库支持 #功能说明
 *
 * @author qining #作者
 * @category typecho #所属分类
 * @package Cookie #所在文件名称
 */
````
### 函数注释
函数注释在函数前，主要包含函数功能，函数修饰符，其各参数的类型、名称、以及文字说明，返回值的类型及文字说明。
````php
/**
 * 获取指定的COOKIE值 #函数功能
 *
 * @access public #函数修饰符，即函数是否可被外界访问
 * @param string key 指定的参数 #参数1,类型为string, 名称为key, 功能描述为 指定的参数
 * @param string default 默认的参数 #参数2，类型string，名称default，功能描述 默认的参数
 * @return int #返回整形返回值
 */
````

## 一些小细节
 - 赋值等号两边要有空格，如``b = c; b = 15;``



  [1]: https://nginx.org



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## About obsessive-compulsive disorder
First of all,

The four-space Tab indentation is great! ! !
The four-space Tab indentation is great! ! !
The four-space Tab indentation is great! ! !

The braces do not wrap! ! !
The braces do not wrap! ! !
The braces do not wrap! ! !


## About naming

Name it so that others can understand it at a glance. Ideally, looking at your code is as comfortable as reading a little English poem ::aru:insidious::

### Often/variable naming

The compiler constants are all uppercase, and the characters are connected by a single underscore. Such as:
````C
#define WIFI_PASSWD 12345
````

Variables are basically named with small camels. The rule is to connect words directly (without underscores), the first word is all lowercase, and the first letter of subsequent words is capitalized. Such as:
````C++
String usrName = "IoTgod";
````
Variable names that are frequently called should not be too long, but they should be clear.
To achieve this, you can try to partially omit non-initial vowels in words. For example, user can be abbreviated as usr, and password can be omitted as passwd or psswd. But the simplified name still needs to be easy to recognize.

Global variables are named using g_ plus the variable name, such as
````C++
global int g_isLightOn = 0;
````

Local static variables use s_ plus the variable name, such as
````C++
static int s_errorCounter = 0;
````
Constant variables, naming the same as ordinary variables, such as
````C++
const float pi = 3.14159265;
````

### Function Naming

The function naming technique is stolen from the famous [Nginx][1] and slightly changed on its basis.
The basic rule is *lowercase label name+__ (double underscore)+lowercase verb+lowercase noun()*
Use a single underline link between nouns and nouns.
E.g:
````php
function db__get_usr_info();
````
Among them, db means Database, prompting that this function belongs to the database operation label, and its function is to obtain user information.

If you don't need tags (such as in some object-oriented languages), you can arbitrarily omit tags. Such as:
````php
function get_usr_info();
//or
function db::get_usr_info();
````
Different from variable naming, function naming need not be short, aiming at expressing clearly the function function

## About comments

In fact, if you can name the variable function well, you don't need any comments, but unfortunately, we still have to comment. .

### File Notes
File comments are mainly used to declare some file functions, category names, file names, copyright and other information. A style is as follows:
````php
/**
 * cookie support #file function
 *
 * @category typecho #The category to which the file belongs
 * @package Cookie #File name
 * @copyright Copyright (c) 2008 Typecho team (http://www.typecho.org) #Author and copyright information
 * @license GNU General Public License 2.0 #Open source agreement
 * @version 2.1.1 #Version
 */
````
### Class comments
Class annotations are used to declare some basic information of the class, such as class function, author name, classification, and file. E.g:
````php
/**
 * Database support #Function description
 *
 * @author qining #author
 * @category typecho #Category
 * @package Cookie #File name
 */
````
### Function comments
The function comment before the function mainly includes the function function, the function modifier, the type, name, and text description of each parameter, and the type and text description of the return value.
````php
/**
 * Get the specified COOKIE value #Function function
 *
 * @access public #Function modifier, that is, whether the function can be accessed by the outside world
 * @param string key specified parameter #Parameter 1, type is string, name is key, function description is specified parameter
 * @param string default Default parameters #Parameter 2, type string, name default, function description Default parameters
 * @return int #Return the integer return value
 */
````

## Some small details
 - There must be spaces on both sides of the equal sign, such as ``b = c; b = 15;''



  [1]: https://nginx.org
{% raw %}</span>{% endraw %}
