---
title: Java基础
date: 2025-06-02 14:05:11
tags:
---


### 一、Java介绍

### 二、变量和数据类型

#### 1.变量的类型

- 基本类型的变量
- 引用类型的变量

变量必须先定义，后使用，定义时可以先给一个初始值，如果没有初始值，java会给默认值

#### 2.基本数据类型

- 整数类型：byte，short，int，long
- 浮点类型：float，double
- 字符类型：char
- 布尔类型：boolean

##### 各数据类型占用字节数

![image-20210513145429125](/Users/laohangdeche/Library/Application Support/typora-user-images/image-20210513145429125.png)

#### 整型

对于整型类型，Java只定义了带符号的整型，因此，最高位的bit表示符号位（0表示正数，1表示负数）
各种整型能表示的最大范围如下：

- byte：-128 ~ 127
- short: -32768 ~ 32767
- int: -2147483648 ~ 2147483647
- long: -9223372036854775808 ~ 9223372036854775807

**注意：**同一个数的不同进制的表示是完全相同的，long型需要在数据后面加上L

#### 浮点型

- 浮点类型的数就是小数，因为小数用科学计数法表示的时候，小数点是可以“浮动”的，如1234.5可以表示成12.345x10^2，也可以表示成1.2345x10^3，所以称为浮点数
- 对于`float`类型，需要加上`f`后缀。
- 浮点数可表示的范围非常大，`float`类型可最大表示3.4x10^38，而`double`类型可最大表示1.79x10^308

#### 布尔类型

布尔类型只有true和false两种类型，Java语言对布尔类型的存储并没有做规定，因为理论上存储布尔类型只需要1 bit，但是通常JVM内部会把`boolean`表示为4字节整数。

#### 字符类型

- 字符类型`char`表示一个字符，用单引号''括起来。Java的`char`类型除了可表示标准的ASCII外，还可以表示一个Unicode字符
- java使用Unicode表示字符，要显示Unicode编码，可以将字符，赋值给int类型
- 还可以直接用转义字符`\u`+Unicode编码来表示一个字符

```java
public class Main {
    public static void main(String[] args) {
        char a = 'A';
        char zh = '中';
        System.out.println(a);
        System.out.println(zh);
      
        int a1 = a;
        int a2 = zh;
        System.out.println(a1);     // 65
        System.out.println(a2);     // 20013
      
        char c3 = '\u0041'; 				// 'A'，因为十六进制0041 = 十进制65
        char c4 = '\u4e2d'; 				// '中'，因为十六进制4e2d = 十进制20013
    }
}
```

### 3. 引用类型

#### 3.1 字符串

区别于单引号的字符，字符串是用双引号括起来的，引用类型的变量类似于C语言的指针，它内部存储一个“地址”，指向某个对象在内存的位置。

```java
String s = "hello";
```

##### 3.1.1转义字符

\ 是转义字符，要表示该符号，需要两个\\\表示一个\字符

**常见的转义字符**

- `\"` 表示字符`"`
- `\'` 表示字符`'`
- `\\` 表示字符`\`
- `\n` 表示换行符
- `\r` 表示回车符
- `\t` 表示Tab
- `\u####` 表示一个Unicode编码的字符

##### 3.1.2 字符串拼接

java中可以使用 + 连接任意字符串和数据类型，如果连接了其他数据类型，那么会先转换成字符串，再连接

```java
public class Main {
    public static void main(String[] args) {
        int age = 25;
        String s = "age is " + age;
        System.out.println(s); // age is25
    }
}
```

##### 3.1.3 多行字符串

##### 3.1.4 不可变特性
字符串的内容是不可变的，但指向是可变的

#### 3.2 常量

常量在第一次定义赋值后，就不能再次修改了，再次赋值会导致编译错误

通常常量前会，用一个final修饰符，根据习惯，常量通常都为大写字母

#### 3.3 var关键字

有些时候，类型名字太长了，写起来比较麻烦，比如

```java
StringBuilder·s = new StringBuilder();
```

这个时候如果想省略变量类型，可以使用var关键字：

```java
var sb = new StringBuilder();
```

### 4.变量的作用范围

在Java中，变量的作用域一般在它所在的{}中，从定义处开始，到语句块结束，超出了作用域引用这些变量，编译器会报错

### 5.null
- 引用类型的变量可以指向一个空值null，它表示不存在，即该变量不指向任何对象
- 注意要区分空值null和空字符串""，空字符串是一个有效的字符串对象，它不等于null

### 三、流程控制

#### 1.if判断
- 根据条件是true还是false，决定是否执行下面的某一段代码
- 可以使用 if......else if......else来串联，else if较多时，要注意条件的顺序
```java
public class IfSwitch {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("请输入成绩：");
        int i = scanner.nextInt();
        if(i >= 90){
            System.out.println("优秀了");
        }else if(i >= 80)
            System.out.println("良好");
        else if(i >= 60){
            System.out.println("及格了");
        }else{
            System.out.println("没及格");
        }
}
```
**注意：** 当只有一行语句时，可以省略花括号，但不建议这么写，容易出错

##### 判断引用类型相等
- 在判断基本类型时，可以直接使用==，但是在判断引用类型的变量是否相等时，== 表示“该引用是否相等”，或者说，是否指向了同一个对象
- 若想判断两个引用对象的内容是否相等，则需要用到equals() 方法

```java

// 判断引用类型是否相等
public class quoteEquals {
    public static void main(String[] args) {
        int i1 = 10;
        int i2 = 10;
        if(i1 == i2){
            System.out.println("True");
        }else{
            System.out.println("False");
        }

        String s1 = "hang";
        String s2 = "HANG".toLowerCase();
        System.out.println(s1);     // hang
        System.out.println(s2);     // hang

        // different quote
        if(s1 == s2){
            System.out.println("same quote");
        }else{
            System.out.println("different quote");
        }

        // same word
        if(s1.equals(s2)){
            System.out.println("same word");
        }else{
            System.out.println("different word");
        }
    }

```

**注意：执行语句`s1.equals(s2)`时，如果变量`s1`为`null`，会报`NullPointerException`：**

避免报空指针的错误，可以把一定不是null的对象放在前面，因为java中，任何对象都可以调用equals()方法

#### 2.循环

在计算机中，需要重复执行某一段代码，在条件满足时，重复执行；在条件不满足下，退出循环。

##### 2.1 while循环

```java
while(条件){
  循环体...
}
```

while循环在执行时，先判断括号里的条件，如果为true，执行循环体内的代码。如果为false，直接跳到循环体末尾，执行下面的代码

##### 死循环

- 循环要有退出条件，如果条件永远为true，那整个循环语句便会一直运行下去，导致占用100%的CPU资源，导致电脑运行缓慢

```java
// 死循环
int i = 100;
while(i > 0){
  System.out.println(i):
}
```

##### 2.2 do while 循环

- while 循环是先判断条件，再执行循环体
- do while 循环是先执行一次循环体，再判断条件，即至少会执行一次

```java
// do while 循环
public class doWhile {
    public static void main(String[] args) {
        int i = 1;
        int sum = 0;
        do {
            sum += i;
            i++;
        }while (i<= 100);

        System.out.println(sum);
        
        // do while 至少执行一次循环体内的代码
        int n = 1;
        int s = 0;
        do{
            s += n;
            i++;
        }while (n>1);
        System.out.println(s);      // 只加一次，输出1
    }
}
```

##### 2.3 for 循环

`for`循环的功能非常强大，它使用计数器实现循环。`for`循环会先初始化计数器，然后，在每次循环前检测循环条件，在每次循环后更新计数器。计数器变量通常命名为`i`

```java
// for循环
public class forLoop {
    public static void main(String[] args) {
        int sum = 0;
        for(int i = 1;i<=100;i++){
            sum += i;
        }
        System.out.println(sum);    // 5050
    }
}
```

##### for each 循环

```java
public class Main {
    public static void main(String[] args) {
        int[] ns = { 1, 4, 9, 16, 25 };
        for (int n : ns) {
            System.out.println(n);
        }
    }
}
```

##### 练习：利用for循环计算圆周率

```java
public class circlePi {
    public static void main(String[] args) {
        // 圆周率π可以使用公式计算：
        double pi = 0;
        for (double i = 1; i <= 3000; i++) {
            if (i% 2 != 0) {
                pi = pi + 1 / (2 * i -1);
            } else {
                pi = pi - 1 / (2 * i - 1);
            }
        }
        pi = pi * 4;
        System.out.println(pi);
    }
}
```

#### 3.break和continue

在for 循环 和 while 循环中，可以利用这两个关键字，中断或跳过某段程序

- break，中断整个循环，继续执行循环下方的代码，break语句总是跳出最近的一层循环
- continue，跳过当前循环，继续执行下一次循环

```java
public class breakAndContinue {
    public static void main(String[] args) {
        // break，终止循环
        int sum = 0;
        for(int i = 1;i<= 100;i++){
            // 只计算到50
            if(i>50){
                break;
            }
            sum += i ;
        }
        System.out.println(sum);

        // continue，跳过当前循环
        int total = 0;
        for (int i = 1; i <= 100; i++) {
            // 只计算奇数,跳过偶数
            if(i%2==0){
                continue;
            }
            total += i;
        }
        System.out.println(total);
    }
}
```

#### 4.switch选择

switch，可以根据条件的具体结果，分别去执行不同的分支

```java
// switch语法
public class SwitchTest {
    public static void main(String[] args) {
        int option = 111;
        switch (option) {
            case 1:
                System.out.println("select 1");
                break;
            case 2:
                System.out.println("select 2");
                break;
            case 3:
                System.out.println("select 3");
                break;
            default:
                System.out.println("选错了");
                break;
        }
    }
}
```

**注意**

- case后面没有花括号{}
- 每个case需要添加break，忘记写break，语句会穿透下去，直到遇到break或者执行到最后一句

##### java12 中switch表达式的新写法

- 使用箭头语法，类似lambda表达式
- 可以不需要添加break语句
- case 多个条件可以写在一行
- switch语句可以用yield 生成返回值，这个时候，switch块最后要加分号
- 箭头语法下，如果条件大于一条，要用{}括起来

```java
				String fruit = "apple";
        switch (fruit){
            case "apple" -> System.out.println("select apple");
            case "pear" -> System.out.println("select pear");
            case "mongo","test" -> {
                System.out.println("select mango");
                System.out.println("good choice");
            }
            default -> System.out.println("no fruit select");
        }

// 使用yield 生成返回值
				String fruit1 = "mongo";
        int num = switch (fruit1){
            case "apple" -> 1;
            case "pear" -> 2;
            case "mongo","test" -> {
                System.out.println("select mango");
                System.out.println("good choice");
                yield 3;
            }
            default -> 0;
        };
        System.out.println(num);
    }
```






### 四、数组

#### 1.数组的三种定义方法

- 先声明，再分配空间，再赋值
- 先声明并分配空间，再赋值
- 声明并分配空间然后赋值

```java
public class aArray {
    public static void main(String[] args) {
        System.out.println("创建数组的三种方式：");
    
        System.out.println("方式 1");
        int[] array1 ;
        array1 = new int[5];      // 指定数组大小和类型，初始值都是0 或false 或null
        for (int i = 0; i < 5; i++){
            array1[i] = i * 10;  //赋值
        }
        
        System.out.println("\n方式2");
        int[] array2 = new int[5];   
        for (int i = 0; i < 5; i++){
            array1[i] = i * 10;  //赋值
        }
        System.out.println("\n方式3");
        int[] array3 = {1, 2, 3, 4, 5};     // 不指定具体大小，直接初始化数组的值，方式2的简化方法，不需要new int[] 直接添加{}

        System.out.println("for each 遍历数组");
        
    }
```
#### 2.数组特点
- Java数组一旦创建，不能修改大小
- 数组创建后会被分配默认值，整型为0，浮点型为0.0，布尔型为false，*对象为null*

#### 3.数组的基本使用
##### 3.1 索引
若要使用数组，可以根据索引使用。数组索引从0开始，列如10个元素的开始，索引为0~9
数组是引用类型，如果索引超出最大范围，则会报错

##### 3.2 遍历
```java
for (int i = 0; i < array.length; i++) {
    System.out.println(array[i]);
}
        
System.out.println("for each 遍历数组");
for (int num : array2) {
    System.out.println(num);
}
```
##### 3.3 数组的本质
```java
 int[] array1;
 array1 = new int[]{1,2,3,4,5};
 System.out.println(array1);     // [I@f6f4d33
 array1 = new int[]{9,8,1};
 System.out.println(array1);     // [I@23fc625e
```
数组是引用类型，通过变量名指向数组，如果有新数组，可以用这个变量名再指向新的数组

##### 3.4 排序
排序方法有很多种，例如，冒泡排序，快速排序，插入排序等等，这部分涉及到算法
在java中利用Arrays.sort()方法就可以排序
```java
int[] array = {10, 6, 13, 2, 4, 1, 54, 12};
int[] array2 = {111, 21, 31, 14, 16, -2, -54, 102};
System.out.println("排序前：");
System.out.println(array);
System.out.println(Arrays.toString(array));

Arrays.sort(array);
System.out.println("排序后：");
System.out.println(array);
System.out.println(Arrays.toString(array));
```
**注意:该方法是修改了数组本身**
#### 4.多维数组

列如二维数组，就是数组中的数组，最外层的一个数组中，每一个元素都是一个数组
```java
public class Main {
    public static void main(String[] args) {
        int[][] ns = {
            { 1, 2, 3, 4 },
            { 5, 6, 7, 8 },
            { 9, 10, 11, 12 }
        };
        System.out.println(ns.length); // 3
    }
}
```
![34c2c5919f0c554c3f580ec0309ae484.png](evernotecid://4110DA82-EE74-493A-AC6E-7D2C24DDBBB9/appyinxiangcom/27405091/ENResource/p6)

