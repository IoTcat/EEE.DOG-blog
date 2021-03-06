---
title: JS中那些惊艳的操作
titleEN: Those amazing operations in JS
date: 2019-03-19
categories:
- tech
tags:
- nodeJS
---




{% raw %}<span class=".zh">{% endraw %}
教你如何一步步迷上JS.. ╮(╯▽╰)╭ 
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Teach you how to fall in love with JS step by step.. ╮(╯▽╰)╭

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


好嘀,只是一些总结 

## JS中的那些萌点
 - `<script>`标签中，合理使用`defer="defer"`(延迟执行)，`async="async"`(异步执行)
 - 外部JS可以使用其它扩展名(如.php)，但必须返回正确MINE类型
 - 使用`var obj = preferredObj || backupObj;` 提供后备值 ::aru:surprised:: 
 - 函数中使用`arguements[]`获取参数
 - 无函数签名，再见吧重载 ::aru:meditation:: 
 - 函数无引用传参，只要不作死用全局变量，封装就很完美
 - 神奇的垃圾收集功能，开发时无需考虑手动释放内存
 - 函数传参使用`function hh({})`直接传包含参数的对象，更加灵活
 - 数组每一个位置可以存不同类型的数据 ::aru:blood2:: 
 - 数组支持模拟栈操作，如`push()`和`pop()`
 - 数组支持模拟队列操作，如`push()`和`shift()`
 - 数组支持从相反方向模拟队列，如`unshift()`和`pop()`
 - `sort()`可自定义比较函数为参数
 - 数组`splice()`可太好用了吧
 - 函数是对象，函数名是指针
 - 可以像传递参数一样把一个函数传给另一个函数，也可以将一个函数作为另一个函数的结果返回
 - 函数中可通过`arguments.callee`获取当前函数名指针
 - 使用`arguments.callee.caller`获取调用当前函数的引用
 - 使用`function.apply(this/*作用域*/, arguments)`或`function.call(this, arg1, arg2...)`指定作用域运行函数
 - 使用函数固有属性`function.length`获取其期待的参数个数
 - 通过函数继承属性`toLocaleString()``toString()``valueOf()`返回代码，方便调试
 - 使用`indexOf()``lastIndexOf()`查找元素出现位置
 - `trim()`删除字符串开头结尾空格
 - 支持正则`RegExp`
 - 神奇但可怕的`eval("")`可将字符串转译成代码并就地执行
 - `encodeURI()/decodeURI()`与`encodeURIComponent()/decodeURICompoent()`处理uri
 - 立即调用函数`function(){}();`
 - 内置Math对象
 - Math中`ceil()``floor()``round()`向上，向下，标准舍入
 - `Math.random()`大于零小于一随机数
 - 对象中使用`functionName: function(){}`直接定义函数
 - ES6中`(x)=>x+1`等价于`function(x){return x+1;}`
 - 使用`;(function(name, context, definition){moudle.exports = definition();})('funationName', this, function(){});`封装模块

## 小心得
 - 不建议使用`with`语句
 - `label`标签少用
 - `0.1 + 0.2 != 0.3` 浮点型天坑，与C类似
 - `~26 == -27` 利用按位非提高效率
 - 标识符查询由内部环境向外部环境进行
 - 没有块级作用域，与C++不同
 - `var obj2 = obj1;`实际是引用
 - 函数传参时传对象，实际传的是指针
 - 全局变量用完及时置为null以提性能
 - 使用变量属性访问对象只能使用`obj[var]`
 - `var sum = function sum(){};`在Safari中会报错
 - 不能为基本类型值添加属性和方法
 - `new Number("25")`返回对象，而`Number("25")`返回25
 - 布尔表达式中对象均为true



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

Okay, just some summary

## Those cute points in JS
 - In the `<script>` tag, reasonably use `defer="defer"` (delayed execution) and `async="async"` (asynchronous execution)
 - External JS can use other extensions (such as .php), but must return the correct MINE type
 - Use `var obj = preferredObj || backupObj;` to provide a backup value ::aru:surprised::
 - Use `arguements[]` to get parameters in the function
 - No function signature, goodbye overload ::aru:meditation::
 - The function has no reference to pass parameters, as long as the global variable is not used for deadly, the encapsulation is perfect
 - Magic garbage collection function, no need to consider manually releasing memory during development
 - Use `function hh({})` to pass parameters directly to functions, which is more flexible
 - Each position of the array can store different types of data ::aru:blood2::
 - Array supports simulated stack operations, such as `push()` and `pop()`
 - Array supports simulated queue operations, such as `push()` and `shift()`
 - Array supports simulating queues from the opposite direction, such as `unshift()` and `pop()`
 - `sort()` can customize the comparison function as a parameter
 - The array `splice()` is so easy to use, right?
 - Functions are objects and function names are pointers
 - You can pass a function to another function as parameters, or you can return a function as the result of another function
 - In the function, the current function name pointer can be obtained through `arguments.callee`
 - Use `arguments.callee.caller` to get a reference to call the current function
 - Use `function.apply(this/*scope*/, arguments)` or `function.call(this, arg1, arg2...)` to specify the scope to run the function
 - Use the function intrinsic property `function.length` to get the number of expected parameters
 - Inherit the property `toLocaleString(), toString(), and valueOf()` return code through the function to facilitate debugging
 - Use `indexOf() and lastIndexOf()` to find the element's appearance
 - `trim()` delete spaces at the beginning and end of the string
 - Support regular `RegExp`
 - The magical but terrible `eval("")` can translate the string into code and execute it in place
 - `encodeURI()/decodeURI()` and `encodeURIComponent()/decodeURICompoent()` handle uri
 - Call the function immediately `function()()();`
 - Built-in Math object
 - `ceil(), floor(), round()` in Math up, down, standard rounding
 - `Math.random()` is a random number greater than zero and less than one
 - Use `functionName: function(){}` in the object to directly define the function
 - In ES6 `(x)=>x+1` is equivalent to `function(x){return x+1;}`
 - Use `;(function(name, context, definition){moudle.exports = definition();})('funationName', this, function()());` to encapsulate the module

## Be careful
 - It is not recommended to use `with` statement
 - Less use of `label`
 - `0.1 + 0.2 != 0.3` floating point tiankeng, similar to C
 - `~26 == -27` Use bitwise not to improve efficiency
 - Identifier query is carried out from the internal environment to the external environment
 - No block-level scope, different from C++
 - `var obj2 = obj1;` is actually a reference
 - The object is passed when the function is passed, but the pointer is actually passed
 - Set global variables to null when used up to improve performance
 - Use variable attributes to access objects can only use `obj[var]`
 - `var sum = function sum(){};` will report an error in Safari
 - You cannot add attributes and methods to basic type values
 - `new Number("25")` returns the object, and `Number("25")` returns 25
 - All objects in Boolean expressions are true

{% raw %}</span>{% endraw %}
