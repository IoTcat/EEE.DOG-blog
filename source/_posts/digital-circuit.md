---
title: 数电期中总结
titleEN: Mid-term Summary of Digital Circuits
date: 2019-02-28
categories:
- notes
tags:
- circuit
---



{% raw %}<span class=".zh">{% endraw %}
上学期掉了魔电的坑，这学期来搞点数电小攻略掩饰一下(☆ω☆)
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
I lost the pit of magic electricity last semester. This semester, let’s make a small strategy to hide it (☆ω☆)

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
# 1. 数制与码制
## 二进制运算
### 补码
常用补码来表示负数，以便于计算。
正数和零补码是其自身，负数的补码方法如下：
二进制减法可以通过被减数加要减数的补码来实现。
**<法一>直接法**
$$(N)_{COMP}=\begin{cases}N&\text{N为正数}\\2^{n}-N& \text{N为负数} \end{cases}$$

符号位为零（正数）时，补码与源码相同，符号位为1（负数）时，补码为$2^{n}-N$.
**<法二>观察法**
欲求补码，可以先找其反码。
$$(N)_{INV}=\begin{cases}N&\text{N为正数}\\(2^{n}-1)-N& \text{N为负数} \end{cases}$$

即，除符号位外其他值0变1，1变0。
随后反码整体加1即可得到补码~

## 常用编码
### DCB
即8421恒权码。DCB作为10进制显示时，须在每一个Invalid位(>9)上加6。

### Signed Numbers
使用8位，最左边一位表示符号，其余7位表示数值。


## 期中总结
### 第一周 - 初识数电
 - 模拟量太复杂，不符合人类思维
 - 三极管MOS管等非线性器件为魔转数提供了器件基础
 - 因为模电太难，所以我们要学数电
**一些要点**
 - TTL意思是指晶体管逻辑电路，由各种三极管和电阻组成，特点是速度快
 - TTL中0-0.8V为低电平，2-5V为高电平
 - 二进制与十进制相互转换(整数/小数)
 - LSB(Least Significant Bit)/MSB(Most S B)

### 第二周 - 数制
 - 反码 1's Complement
 - 补码 2's Complement
 - 有时候二进制太长不好用，这使16进制很方便
 - 16进制类似2进制的助记符，如观察`1100 0101`可直接写出`C5`
 - BCD是用一个16进制表示一个10进制数
 - BCD很符合人类的思维习惯，但造成极大的资源浪费
 - BCD四则运算，我觉得最好转成10进制算完再转回去，反正很方便
 - 计算机BCD加法采取+6进位法
 - 数字储存时最左一位是符号位
 - 负数使用补码来存储([栗子][1])
 - 1字节signed数字范围`-128-127`
 - 合理设计存储位数，小心溢出
 - [二进制乘法](https://zhidao.baidu.com/question/293829485.html)
 - [二进制除法](https://zhidao.baidu.com/question/304091753926723564.html) 与十进制类似

### 第三周 - 逻辑门与电路封装类型
 - 非门 NOT
 - 与门 AND
 - 或门 OR
 - 非与门 NAND
 - 非或门 NOR
 - 异或门 XOR
 - 常见有TTL和CMOS两类
 - CMOS按照供压可分为3.3V和5V两类
 - fan-out是指有效input个数
 - propagation delay time指响应时间
 - 集成电路命名，如`74LS04`中74指商品级，LS指种类，04为型号
 - 按复杂程度分类：SSI(1-12门)，MSI(13-99门)，LSI(100-9999门)，VLSI(10000-99999)，ULSI(100000+)

### 第四周 - 布尔运算
 - 遵循交换，结合，分配律
 - 结论`A+AB=A`与`A+~AB=A+B`
 - DeMorgan's Theorems `~(AB)=(~A+~B)` 与 `~(A+B)=~A~B`
 - `~A~B`为Negative AND, `~(AB)`为NAND, OR同理
 - SOP格式为`··+··+··`
 - POS格式为`()*()*()`
 - Truth Table即为将全部可能的Input和output列表

### 第五周 - Karnaugh Map
 - Karnaugh Map来可视化逻辑门化简

### 第六周 - 逻辑门组合
 - NAND和NOR可以组合出其它任意门
 - 加法器 左位放`A AND B`右位放`A XOR B`
 - 比较器 1bit`A XOR B` 2bit`(A0 XOR B0) NOR (A1 XOR B0)`
 - 译码器 逻辑二进制转控制电平输出

------------
课件：
[Lecture03.pdf][2]
[Lecture04.pdf][3]


  [1]: https://zhidao.baidu.com/question/1692306348989800588.html
  [2]: https://www.eee.dog/usr/uploads/2019/02/1948813444.pdf
  [3]: https://www.eee.dog/usr/uploads/2019/02/20970449.pdf


{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

# 1. Number system and code system
## Binary operation
### Complement
The complement is often used to represent negative numbers for easy calculation.
Positive numbers and zero complement are themselves, and the complement method of negative numbers is as follows:
Binary subtraction can be implemented by adding the complement of the subtracted number to the subtracted number.
**<Method One> Direct Method**
$$(N)_{COMP}=\begin{cases}N&\text{N is a positive number}\\2^{n}-N& \text{N is a negative number} \end{cases}$$

When the sign bit is zero (positive number), the complement is the same as the source code. When the sign bit is 1 (negative number), the complement is $2^{n}-N$.
**<Method Two> Observation Method**
If you want the complement, you can find the inverse first.
$$(N)_{INV}=\begin{cases}N&\text{N is a positive number}\\(2^{n}-1)-N& \text{N is a negative number} \end{cases}$$

That is, except for the sign bit, 0 changes to 1, and 1 changes to 0.
Then add 1 to the whole complement to get the complement~

## Common coding
### DCB
That is, the 8421 constant weight code. When DCB is displayed as a decimal number, 6 must be added to each Invalid bit (>9).

### Signed Numbers
8 bits are used, the leftmost bit represents the sign, and the remaining 7 bits represent the value.


## Mid-term summary
### First week-first acquaintance with digital telephony
 - The analog quantity is too complicated to conform to human thinking
 - Non-linear devices such as triode and MOS tube provide the device basis for the magic speed
 - Because analog electricity is too difficult, we have to learn math electricity
**Some points**
 - TTL means transistor logic circuit, composed of various transistors and resistors, and is characterized by fast speed
 - 0-0.8V in TTL is low level, 2-5V is high level
 - Conversion between binary and decimal (integer/decimal)
 - LSB(Least Significant Bit)/MSB(Most S B)

### Second week-Number system
 - 1's Complement
 - 2's Complement
 - Sometimes the binary is too long to use, which makes hexadecimal very convenient
 - Hexadecimal is similar to binary mnemonic, if you observe `1100 0101`, you can write `C5` directly
 - BCD uses a hexadecimal number to represent a decimal number
 - BCD is in line with human thinking habits, but it causes a great waste of resources
 - BCD four arithmetic, I think it’s best to convert to decimal and then convert it back. Anyway, it’s very convenient
 - Computer BCD addition adopts +6 carry method
 - When storing numbers, the leftmost digit is the sign bit
 - Negative numbers are stored using one's complement ([chestnut][1])
 - 1 byte signed number range `-128-127`
 - Reasonably design the number of storage bits and be careful of overflow
 - [Binary Multiplication](https://zhidao.baidu.com/question/293829485.html)
 - [Binary Division](https://zhidao.baidu.com/question/304091753926723564.html) Similar to decimal

### Week 3-Logic Gate and Circuit Package Type
 - NOT
 - AND gate
 - OR gate OR
 - NOT AND gate NAND
 - NOR gate
 - Exclusive OR gate XOR
 - Commonly there are TTL and CMOS two types
 - CMOS can be divided into 3.3V and 5V according to the supply voltage
 - Fan-out refers to the number of valid inputs
 - propagation delay time refers to response time
 - IC naming, for example, 74 in `74LS04` means commodity grade, LS means type, 04 is model
 - Classification by complexity: SSI (1-12 doors), MSI (13-99 doors), LSI (100-9999 doors), VLSI (10000-99999), ULSI (100000+)

### Week 4-Boolean operations
 - Follow the exchange, combination, and distribution laws
 - Conclusion `A+AB=A` and `A+~AB=A+B`
 - DeMorgan's Theorems `~(AB)=(~A+~B)` and `~(A+B)=~A~B`
 - `~A~B` is Negative AND, `~(AB)` is NAND, OR is the same
 - SOP format is `··+··+··`
 - POS format is `()*()*()`
 - Truth Table is a list of all possible Input and Output

### Week 5-Karnaugh Map
  - Karnaugh Map to visualize logic gate simplification

### Week 6-Logic Gate Combination
 - NAND and NOR can be combined into any other gate
 - Adder put `A AND B` on the left bit and `A XOR B` on the right bit
 - Comparator 1bit`A XOR B` 2bit`(A0 XOR B0) NOR (A1 XOR B0)`
 - Decoder logic binary to control level output

------------
Courseware:
[Lecture03.pdf][2]
[Lecture04.pdf][3]


  [1]: https://zhidao.baidu.com/question/1692306348989800588.html
  [2]: https://www.eee.dog/usr/uploads/2019/02/1948813444.pdf
  [3]: https://www.eee.dog/usr/uploads/2019/02/20970449.pdf

{% raw %}</span>{% endraw %}
