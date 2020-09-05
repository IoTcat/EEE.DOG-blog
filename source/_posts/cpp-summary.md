---
title: C++建库中遇到的坑
titleEN: The pits encountered in C++ library building
date: 2019-02-24 
categories:
- tech
tags:
- cpp
---

{% raw %}<span class=".zh">{% endraw %}

由于学校课程安排，作为一只电气狗第一次正经的开始搞Cpp ::aru:shy:: 
特记录一些建库过程遇到的坑，，→_→
{% raw %}</span>{% endraw %}


{% raw %}<span class=".en">{% endraw %}
Due to the school curriculum, as an electric dog, it is the first time to start doing Cpp .
Specially record some pits encountered in the process of building a database, →_→

{% raw %}</span>{% endraw %}

<!--more-->

{% raw %}
<script>
  session.onload(function(){
    if(page.tran.getLang() == 'en'){
      tips.warning({
        title: 'Caution',
        position: 'topRight',
        message: 'This page was translated by Machine!!'
      });
    }
  });
</script>
{% endraw %}

{% raw %}<span class=".zh">{% endraw %}

## 关于.h文件
作为头文件，.h中一般放有相应类及函数的声明。
一个典型的.h文件如下：(FileName: yimian.h)
````C++
#ifndef YIMIAN_H //防止本文件被多次编译
#define YIMIAN_H //'YIMIAN_H'的值需自定义

//.h中可能用到的lib
#include<iostream>
#include<string>

using namespace std; //使用std命名空间，这样下面就可以不用写如std::cout了

//声明yimian类
class yimian{
  public:  //公共域（可外界直接调用）
  void hi();
    static string version;

    private:  //私有（不对外公开）
};

#endif //与文件开头防多次编译相对应
````

为了安全起见，函数以及变量的初始化一般不放在.h文件中进行。而是习惯于建一个新的同名.cpp文件。
下面是一个与上午相对应的.cpp文件示例：(FileName: yimian.cpp)

````C++
#include"yimian.h" //需要指向yimian.h

string yimian::version = "Version 0.0.1"; //为字符串变量赋值

void yimian::hi(){ //定义yimian类中hi()函数内容
  cout << "Hellow Yimian~" << endl; //输出"Hellow Yimian~\n"到屏幕
}
````

有了以上文件，一个简单的C++库就建成了φ(￣∇￣o)
于是我们新建一个test.cpp文件用来放置main()

````C++
#include<iostream> //要用到的lib声明
#include<stdio.h>
#include"yimian.h" //引入自定义lib

  using namespace std; //使用std命名空间

  int main(){
    yimian $; //定义一个名字为$的新yimian类

    $.hi(); //调用yimian类中hi()函数
    cout << $.version<< endl; //将yimian类version变量输出到屏幕

    return 0; //主函数结束
}
````

然后便可以愉快的使用g++编译啦，指令如下：（win如何搭建GNU环境）

````
  $ g++ test.cpp yimian.cpp -o [目标文件的名称]
````

之后命令行启动编译好的程序 （什么是命令行⌇●﹏●⌇）

````
  $ ./目标文件名称.exe
````

如你所料，以上程序的运行结果为：

> Hellow Yimian~
> Version 0.0.1

----------

**坑** ::aru:meditation:: 

 - 头文件中声明定义好的类貌似一定要在main()中实例化(调用)才行，不然会报错


------------

## 总结一下类相关知识

### 类访问修饰符
 - **public:** 类内外皆可访问的内容
 - **private:** 类外不可访问，仅可自己和友元访问，子类不可访问
 - **protected:** 外部不可访问，自己、友元和子类可访问

### 特殊函数类型
 - **构造函数：** 每次创建对象时会执行，即初始化
````C++
class Line{
  public:
    void setLength( double len );
    double getLength( void );
    Line();  // 这是构造函数
 
  private:
    double length;
};
````

 - **析构函数:** 删除对象时执行的函数，即善后
````C++
class Line{
  public:
    void setLength( double len );
    double getLength( void );
    Line();   // 这是构造函数声明
    ~Line();  // 这是析构函数声明
 
  private:
    double length;
};
````

 - **拷贝构造函数:** 实现复制对象时同一类对象间传参
````C++
class Line{
  public:
  int getLength( void );
    Line( int len );             // 简单的构造函数
    Line( const Line &obj);      // 拷贝构造函数
    ~Line();                     // 析构函数
 
  private:
    int *ptr;
};
·········
Line::Line(const Line &obj){
  cout << "调用拷贝构造函数并为指针 ptr 分配内存" << endl;
  ptr = new int;
  *ptr = *obj.ptr; // 拷贝值
}
·········
int main( ){
  Line line1(10);
 
  Line line2 = line1; // 这里也调用了拷贝构造函数
 
  return 0;
}
````

 - 构造与拷贝构造区别：
````C++
A x(2);　　//直接初始化，调用构造函数
A y = x;　　//拷贝初始化，调用拷贝构造函数
````

### 友元函数/类
 - **友元：**友元就像老邻居啦，家里东西随便拿
````C++
class INTEGER{
  friend void Print(const INTEGER& obj);//声明友元函数
};

void Print(const INTEGER& obj）{
  //函数体
}

void main(){
  INTEGER obj;
  Print(obj);//直接调用
}
````

### 内联函数
 - 总之行数很少，功能很简单，没有循环和开关语句，想提高函数效率，就用内联（╯‵□′）╯︵┴─┴
````C++
inline int Max(int x, int y){
  return (x > y)? x : y;
}

// 程序的主函数
int main(){
  cout << "Max (20,10): " << Max(20,10) << endl;
  cout << "Max (0,200): " << Max(0,200) << endl;
  cout << "Max (100,1010): " << Max(100,1010) << endl;
  return 0;
}
````

### this指针
 - 类似js中this，指向参数对象本身



----------
To Be Continued..



{% raw %}</span>{% endraw %}

{% raw %}<span class=".en">{% endraw %}

## About .h files
As a header file, there are generally declarations of corresponding classes and functions in .h.
A typical .h file is as follows: (FileName: yimian.h)
````C++
#ifndef YIMIAN_H //Prevent this file from being compiled multiple times
#define YIMIAN_H //The value of'YIMIAN_H' needs to be customized

//Lib may be used in.h
#include<iostream>
#include<string>

using namespace std; //Use the std namespace, so you don’t need to write std::cout below

//Declare the yimian class
class yimian{
  public: //Public domain (can be directly called by the outside world)
  void hi();
    static string version;

    private: //Private (not public)
};

#endif //Correspond to the anti-multiple compilation at the beginning of the file
````

For safety, the initialization of functions and variables is generally not carried out in the .h file. Instead, I am used to creating a new .cpp file with the same name.
The following is an example of a .cpp file corresponding to the morning: (FileName: yimian.cpp)

````C++
#include"yimian.h" //Need to point to yimian.h

string yimian::version = "Version 0.0.1"; //Assign a value to a string variable

void yimian::hi(){ //Define the content of the hi() function in the yimian class
  cout << "Hellow Yimian~" << endl; //Output "Hellow Yimian~\n" to the screen
}
````

With the above files, a simple C++ library is built φ(￣∇￣o)
So we create a new test.cpp file to place main()

````C++
#include<iostream> //lib declaration to be used
#include<stdio.h>
#include"yimian.h" //Introduce custom lib

  using namespace std; //Use std namespace

  int main(){
    yimian $; //Define a new yimian class named $

    $.hi(); //Call the hi() function in the yimian class
    cout << $.version<< endl; //Output the yimian class version variable to the screen

    return 0; //End of main function
}
````

Then you can use g++ to compile happily, the instructions are as follows: (How to build a GNU environment in win)

````
  $ g++ test.cpp yimian.cpp -o [name of target file]
````

Then start the compiled program from the command line (what is the command line ⌇●﹏●⌇)

````
  $ ./Target file name.exe
````

As you might expect, the result of the above program is:

> Hellow Yimian~
> Version 0.0.1

----------

**Pit** ::aru:meditation::

 - The defined class declared in the header file must be instantiated (called) in main(), otherwise an error will be reported


------------

## Summarize the related knowledge of the class

### Class access modifier
 - **public:** Content accessible inside and outside the class
 - **private:** not accessible outside the class, only accessible by yourself and friends, not accessible by subclasses
 - **protected:** Inaccessible from outside, accessible by yourself, friends and subclasses

### Special function types
 - **Constructor:** It will be executed every time an object is created, that is, initialization
````C++
class Line{
  public:
    void setLength( double len );
    double getLength( void );
    Line(); // This is the constructor
 
  private:
    double length;
};
````

 - **Destructor:** The function executed when the object is deleted, that is, the aftermath
````C++
class Line{
  public:
    void setLength( double len );
    double getLength( void );
    Line(); // This is the constructor declaration
    ~Line(); // This is the destructor declaration
 
  private:
    double length;
};
````

 - **Copy constructor:** Transfer parameters between objects of the same type when copying objects
````C++
class Line{
  public:
  int getLength( void );
    Line( int len ​​); // simple constructor
    Line( const Line &obj); // copy constructor
    ~Line(); // Destructor
 
  private:
    int *ptr;
};
·········
Line::Line(const Line &obj){
  cout << "Call the copy constructor and allocate memory for the pointer ptr" << endl;
  ptr = new int;
  *ptr = *obj.ptr; // copy value
}
·········
int main( ){
  Line line1(10);
 
  Line line2 = line1; // The copy constructor is also called here
 
  return 0;
}
````

 - The difference between construction and copy construction:
````C++
A x(2);　　//Direct initialization, call the constructor
A y = x;　　//Copy initialization, call the copy constructor
````

### Friend function/class
 - **Youyuan:** Youyuan is like an old neighbor, you can take whatever you want at home
````C++
class INTEGER{
  friend void Print(const INTEGER& obj);//Declare friend function
};

void Print(const INTEGER& obj) {
  //Function body
}

void main(){
  INTEGER obj;
  Print(obj);//Call directly
}
````

### Inline functions
 - In short, the number of lines is small and the function is very simple. There are no loops and switch statements. If you want to improve the efficiency of the function, use inline (╯‵□′)╯︵┴─┴
````C++
inline int Max(int ​​x, int y){
  return (x> y)? x: y;
}

// The main function of the program
int main(){
  cout << "Max (20,10): "<< Max(20,10) << endl;
  cout << "Max (0,200): "<< Max(0,200) << endl;
  cout << "Max (100,1010): "<< Max(100,1010) << endl;
  return 0;
}
````

### this pointer
 - Similar to this in js, pointing to the parameter object itself



----------
To Be Continued..
{% raw %}</span>{% endraw %}