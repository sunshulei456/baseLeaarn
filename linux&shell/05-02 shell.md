# 关键字

## expr 计算

```
介绍
	一个用于进行基本算术运算和字符串操作的命令行工具，通常用于 shell 脚本中对数值或字符串的处理。
	expr 命令只能进行基本的算术运算和字符串操作，对于更加复杂的操作需要使用其他工具或编程语言实现。
语法
	expr `expression`
	expr 命令会对 expression 进行解析和计算，并将结果输出到标准输出中
	注意： 需要使用反斜引号进行包括起来，shell 才能进行计算
例子：
	a=`expr 1 + 2`
```

## typeset

```
Shell 内置命令，都用来设置变量的属性。不过 typeset 已经被弃用了
```



## declare

```

```



# 变量

## 语法规则

```shell
变量名 = 变量值
name="123"
  
// 引用变量  
n=$(name)  
n=$name

注意
!!! 变量名和等号之间不能有空格，
命名只能使用英文字母，数字和下划线，首个字符不能以数字开头。
中间不能有空格，可以使用下划线 _。
不能使用标点符号。
不能使用bash里的关键字（可用help命令查看保留关键字）
区分大小写

对于有空格的字符串赋值给变量的时候， 需要用引号引起来

```

## 作用域

```java
概述
  局部变量 - 本地变量
  环境变量
  shell 变量  -- shell 内置的
  系统变量
  
介绍
  1) 局部变量 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2) 环境变量 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3) shell变量 shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行
```

#### 局部变量

```java
本地变量:当前用户自定义的变量。当前进程中有效，其他进程及当前进程的子进程无效。

```

#### 环境变量 - delare

```shell
环境变量:当前进程有效,并且能够被子进程调用。
。env查看当前用户的环境变量
。set查询当前用户的所有变量(临时变量与环境变量)
。export 变量名=变量值 或者 量名=变量值; export量名

  
# 方式一
delare -x a=123
# 方式二
a=123
export a;
# 方式2.2
export a=123 
```

#### 全局变量

```java
全局变量:全局所有的用户和程序都能调用，且继承，新建的用唐也默认能调用.

文件名 说明 备注
$HOME/.bashrc
  当前用户的bash信息,用户登录时读
  定义别名、umask、 函数等

$HOME/.bash_ profile
	当前用户的环境变量,用户登录时读取

$HOME/.bash_ logout
	当前用户退出当前helI时最后读取等
  定义用户退出时执行的程序
/etc/bashrc
	全局的bash信息，所有用户都生效
/etc/profile
  全局环境变量信息
  系统和所有用户都生效
  
  
========
说明:以文件修改后，都需要重新source让其生效或者退出重新登录。
●用户登录系统读取相关文件的顺序
1. /etc/profile
2.、$HOME/ .Ibash_ _profile
3. $HOME/ . bashrc
4. /etc/bashrc
5. $HOME/ . bash_ 1ogout
  
```

#### 系统内置变量

```shell
$?
上一条命令执行后返回的状态;状态值为0表示执行正常,非0表示执行异常或错误
$0 I
当前执行的程序或脚本名
$#
脚本后面接的参数的个数
$*
脚本后面所有参数，参数当成一个整体输出，每一个变 量参数之间以空格隔开
$@
脚本后面所有参数,参数是独立的，也是全部输出
$1~$9
脚本后面的位置参数，$1表示第1个位置参数，依次类推
${10}-${n}|
扩展位置参数第10个位置变量必须用{}大括号括起来(2位数字以上扩起来)
$$
当前所在进程的进程号，如echo $$
$!
后台运行的最后一个进程号(当前终端)
!$
调用最后一条命令历史中的参数

```

#### 介绍

```shell
概述
  在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：$n。
  n 代表一个数字，
  0 为执行的文件名（包含文件路径）
  1 为执行脚本的第一个参数，
  2 为执行脚本的第二个参数，以此类推……
  
案例
  #!/bin/bash
  echo "Shell 传递参数实例！";
  echo "执行的文件名：$0";
  echo "第一个参数为：$1";
	# 运行
	$ chmod +x test.sh 
  $ ./test.sh 1 
```



### 特殊符号

```shell
$n  传参
$#	传递到脚本的参数个数
$*	以一个单字符串显示所有向脚本传递的参数。
如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
$$	脚本运行的当前进程ID号
$!	后台运行的最后一个进程的ID号
$@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
$-	显示Shell使用的当前选项，与set命令功能相同。
$?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

概述
  $* 与 $@ 区别：
    相同点：都是引用所有参数。
    不同点：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）。	
```



### 操作

#### 复用

```java
要在变量名前面加美元符号, 
最好加上{}:变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界
  
name="123"
echo $name  
echo ${name}  

已定义的变量，可以被重新定义，
name="123"  
name="456"  
e  
```

#### 删除

```java
// 使用 unset 命令可以删除变量,变量被删除后不能再次使用。
// unset 命令不能删除只读变量。
unset mame
```

### 自定义类型

```java
语法
  declare 选项 变量名=变量值
选项
  -i 将变量看成整数 declare -i A=123
  -r 定义只读变量  declare -r B=hello
  -a 定义普通数组;查看普通数组 
  -A 定义关联数组;查看关联数组 
  -X 将变量通过环境导出 declare -X AAA=123456等于export AAA=123456

```

## $ 变量引用

```shell
$ 只要没有转义字符的话， shell 中就默认是引用变量

name="123"
  
// 引用变量  
n=$(name)  
n=$name  // n 的值就是 123
=============================
a=1
b="dfd"
c="$a$b"
echo $c   // 结果就是 1dfd

```



## ${} 模板的符号

### 语法

```
${变量 符号 值}

介绍
	就是 shell 中字符串模板引擎
	
计算表达式
${variable}：获取变量的值
${command}：执行命令并返回输出结果

```

### : 赋值

```shell

${variable:-value}：如果变量未定义，则返回默认值 value
${variable:=value}：如果变量未定义，则设置为默认值 value
${variable:+value}：如果变量已定义，则返回值 value
${variable:offset:length}：截取变量值的指定部分
```

### ? 判断

```
${var?message}：检查变量 var 是否存在，如果不存在则输出错误信息 message。它可以用于检查变量是否已经被定义，如果没有定义则给出错误提示。
```

### / 正则

```shell
/     正则替换第一个匹配到的 old
//    正则替换所有匹配到的 old

${var/old/new}：将变量 var 中第一个匹配到的子字符串 old 替换为 new。它可以用于字符串替换操作，将字符串中的特定部分替换为指定的值。
${var//old/new}：将变量 var 中所有匹配到的子字符串 old 全部替换为 new。它可以用于全局字符串替换操作，将字符串中所有匹配到的特定部分全部替换为指定的值。
```



### %  删除后边

```
语法
	${string%sub}  删除 sub 最后一次出现的位置到最后, 最最后
	${string%%sub} 删除 sub 第一次出现的位置到最后
语法案例
	hello="hel666lo"
	${hello%l*} ==> hel666
	${hello%%l*} ==> he
  
	
注意：
	1. 感觉这个语法应该改成 sub*，不然不起作用
 
```

### # 删除前边

```java
语法
	${string#sub}  删除 sub 第一次出现的位置到最开始， 最最前
	${string##sub} 删除 sub 最后一次出现的位置到最开始
语法案例
	hello="hel666lo"
	${hello#*l} ==> 666lo
	${hello#*l} ==> o
案例
 	${"hello word.txt" # .} // 截取 hello word.txt 中最后一个子串 ".txt" 右侧的字符串，即 ".txt"
```



## $() 模板

```


$((expression))：计算算术表达式并返回结果
使用
1.循环
2. 
```

## $[] 模板

```shell
使用[]对表达式进行求值，与命令expr不同的是： [ ] 用于插值，则 expr 用于将值进行输出。

[root@localhost ~]# echo $[1024 + 2048]
3072
[root@localhost ~]# expr 1024 + 2048
3072
[root@localhost ~]# a=1024
[root@localhost ~]# b=2048
[root@localhost ~]# echo $[ a + b ]
3072

```



## 修饰符

### read

```java
read [选项] 变量名
#!/bin/sh
read name  # 从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量
read -p "输入姓名"  name
  
-P 定义提示用户的信息
-n 定义字符数(限制变量值的长度)
-S  不显示(不显示用户输入的内容)
-t 定义超时时间，默认单位为秒(限制用户输入变量值的超时时间)
  
```

### read-only

```shell
// 使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变
#!/bin/bash
name="123"  
readOnly name
```



### unset

```shell
删除变量
c="川川菜鸟"
unset c
echo $c  // 没有任何输出
```





# 数据类型

## 数字

```shell
a = 1
```



## 字符串

### 声明使用

```java
// 单引号
案例
	name='adb'
要求
  1. 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
  2. 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。
  
// 双引号
案例
  name="adb"
使用
  1.双引号里可以有变量
	2. 双引号里可以出现转义字符
  
// 反引号
  
  
双引号: 会把引号的内容当成整体来看待，允许通过$符号引用其他变量值
单引号: 会把引号的内容当成整体来看待， 禁止引用其他变量值。shell中特殊符号都被视为普通字符
反撇号: 反撇号和${-样,引号或括号里的命令会优先执行，如果存在嵌套，反撇号不能用
  
   
单引号不取变量值；内部嵌套双引号，不取出变量值
双引号取变量值内部嵌套单引号，取出变量值  
反引号`，执行引号中命令 
```



### 操作

```shell
a="123"
${ #a }  // # 表示取字符串的长度
${#a:1:2}  去索引位置 1 开始的的 2 个字符


索引计算
`expr index "$name" io`  # 查找字符 i 或 o 的位置(哪个字母先出现就计算哪个),注意使用的是 反引号！

字符串拼接

```



#### 拼接

```java
your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3
```



## 布尔

```java
1 假
0 真  
```



## == 单列集合 ==

## 数组

### 介绍

```java
bash支持一维数组（不支持多维数组），并且没有限定数组的大小。

类似于 C 语言，数组元素的下标由 0 开始编号。获取数组中的元素要利用下标，下标可以是整数或算术表达式，其值应大于或等于 0。
```



### 声明使用

```shell
案例1
  # 用括号来表示数组，数组元素用"空格"符号分割开
  数组名=(value1 value2 ... valuen)
  names=("11" "22" "33")
  names=(
  	"11"
    "22"
    "33"
    )
    
案例2
	# 单独定义数组的各个分量
	# 可以不使用连续的下标，而且下标的范围没有限制。
	name[0]="11"
	name[1]="22"
  
读取数组
  # ${}
	
	# 获取所有元素 @
	echo name[@]
```

### 操作

#### 基础操作

```java
元素获取： 数组名[下标]
vame1 = ${name[1]} 

获取所有元素
echo name[@]   
echo name[*]      

# 获取长度
length=${#array_name[@]} 获取数组长度
length=${#array_name[*]} 获取数组长度
lengthn=${#array_name[n]} 获取数组指定索引位置的元素
```

## map 

### 声明定义

```bash
在使用map时，需要先声明，否则结果可能与预期不同，array可以不声明

方式1：
declare -A myMap
myMap["my03"]="03"

方式2：
declare -A myMap=(
	["my01"]="01"
    ["my02"]="02"
)


# 初始化
myMap["my03"]="03"
myMap["my04"]="04"
```

### 操作

```bash
# 1）输出所有的key
#若未使用declare声明map，则此处将输出0，与预期输出不符，此处输出语句格式比arry多了一个！
echo ${!myMap[@]}
#2）输出所有value
#与array输出格式相同
echo ${myMap[@]}
#3）输出map长度
#与array输出格式相同
echo ${#myMap[@]}


#1)遍历，根据key找到对应的value
for key in ${!myMap[*]};do
 echo $key
 echo ${myMap[$key]}
done
#2)遍历所有的key
for key in ${!myMap[@]};do
 echo $key
 echo ${myMap[$key]}
done
#3)遍历所有的value
for val in ${myMap[@]};do
 echo $val
done
```





# 运算符

```shell
概述
	原生bash不支持简单的数学运算，只支持特别简单的四则运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用
分类
	算数运算符
  关系运算符
  布尔运算符
  字符串运算符
  文件测试运算符
```

## 特殊符号

### () 单小括号

```shell
1. 命令组
	括号中的命令将会新开一个子shell顺序执行，所以括号中的变量不能够被脚本余下的部分使用。
	括号中多个命令之间用分号隔开，最后一个命令可以没有分号，各命令和括号之间不必有空格。
	# 这个命令将会在一个子shell 中依次执行 command1、command2 和 command3。
	# 相当于多线程
	(command1; command2; command3)
	# 将其中的命令进行执行，得到其标准输出，再将此输出放到原来命令。有些shell不支持，如tcsh。
	$(command1; command2; command3)
	
2. 用于初始化数组
	myarray=(item1 item2 item3)
3. 函数的参数列表
	command (arg1 arg2 arg3)

	
```



### (()) 双小括号

```shell
语法
	((expression))
含义
	计算expression 的值
介绍
	1. 搭配 for, while 循环体
	2. 搭配 $ 对表达式进行解析
```



### []

```shell
test 表达式 等价于 [ 条件表达式 ]  
[expression]  : 表示计算表达式
	用法1：与 if， un 搭配， 表示 test 的缩写
		if [ 100 -lt 200 ]
	用法2: 与 $ 搭配解析表达式, 表示取表达式的数学表达式的值，如果内含有非数字值，则转为 0
		echo $["abc"] # 0
		echo $["123"] # 123
		echo $["123" + "a"] # 123 , 因为 "a", 非数字值会转为数字值，转不了的则转为0 
	用法3： 搭配 echo, echo 命令不会对其进行解析和执行。
		echo ["abc"]    # [abc]  
		
		
[[ 条件表达式 ]]   支持正则表达
```



### [[]]

### {}





## 运算

```shell
#!/bin/bash
val=`expr 2 + 2`
echo "和是 ： ${val}"

注意
	1. 表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
	2. 完整的表达式要被 ` ` 包含，注意这个字符不是常用的单引号，在 Esc 键下边。
	
	
表达式	
$(( 1 + 1 ))
$[ 1 + 1 ]
expr 1 + 1
let a+=a  let n=n+1 // 符合赋值
```

## 算数运算符

```java
a=10
b=20  
运算符	说明	举例
+	加法	`expr $a + $b` 结果为 30。
-	减法	`expr $a - $b` 结果为 -10。
*	乘法	`expr $a \* $b` 结果为  200。  乘号(*)前边必须加反斜杠(\)才能实现乘法运算
/	除法	`expr $b / $a` 结果为 2。
%	取余	`expr $b % $a` 结果为 0。
=	赋值	a=$b 把变量 b 的值赋给 a。
==	相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
!=	不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。
  
注意
  乘号(*)前边必须加反斜杠(\)才能实现乘法运算
  在 MAC 中 shell 的 expr 语法是：$((表达式))，此处表达式中的 "*" 不需要转义符号 "\" 。
```

### 自增

```java
++i
i  
    
    
    
```



## 关系运算符

### 比较整数

```java
运算符	说明	举例
-eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
-ne	检测两个数是否不相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
-gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
-lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
-ge	检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
-le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。
```

### [ ] 条件判断

```shell
test 表达式  # 查看 man test

```

### 字符串比较

```java
-Z
判断是否为空字符串,字符串长度为0则成立
-n
判断是否为非空字符串，字符串长度不为0则成立
strng1 = string2
判断字符串是否相等
string1 != string2
判断字符串是否相不等

```



### 注意

```java
关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
```

## 布尔运算符

```java
运算符	说明	举例
!	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
-o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
-a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。
```

## 逻辑运算

```java
# 不能用在 [] 中 ，而是 [] &
&& 逻辑与
|| 逻辑或  
```

# 流程控制

```java
概述
  和 Java、PHP 等语言不一样，sh 的流程控制不可为空
  
  
```



## 条件分支

### if 分支

```shell
注意
	condition 就是条件表达式， 可以替换成 [ condition ]

if condition
then
	语句
fi  # 末尾的 fi 就是 if 倒过来拼写，后面还会遇到类似的。
=====================================================================
if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi
[ 条件 ] && command
=====================================================================

if condition
then
	command1
else
	command2
fi	
[ 条件 ] && command1 || command2
=====================================================================
if conditon
then 
	command1
elif condition2
then 
	command2
else
	comman3
fi


```

### case 分支

```shell
# 每一模式必须以右括号结束。取值可以为变量或常数，匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;
 
取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令
  
read num
case $num in
  
  1)             
  echo '输入了1'
  ;;  # ;; 就是break
  2) 
    echo '输入了2'
  ;;
  *) 
    echo '输入的不是 1 或者 2'
  ;;
 
```



## 循环

### for 循环

```shell
当变量值在列表里，for 循环即执行一次所有命令，使用变量名获取列表中的当前取值。命令可为任何有效的 shell 命令和语句。in 列表可以包含替换、字符串和文件名。

in列表是可选的，如果不用它，for循环使用命令行的位置参数。
for var in item1 item2 ... temN
do
  command
done
  
for var in item1 item2 ... itemN; do command1; command2… done;  


# 相当于遍历 in 后面的值， 放入 loop 中
# for 条件
for loop in 1 2 3
do
  echo "the value is $loop"
done  
  
# for 书写的形式  
for i in {1..5}  
for i in 1 2 3 4 5
 
// 类 c 风格
for (( i=1;i<5;i++))  
for v 
```

### while循环

```java
// 当符合条件得时候执行循环
while condition
do 
  command
done
  

案例
#!/bin/bash  
num = 1
# 当 num 小于 5 的时候执行  
while (($num<=5))  
do
  echo $num
  let "int++"
done  
```

### until 循环

```shell
# 循环执行一系列命令直至条件为 true 时停止。
until condition
do 
	command
done

#!/bin/bash
a=0
until [! $a -lt 10]
do 
	echo $a
	a=`expr $a + 1`
done	
```



### 无限循环

```java
while:
do
  command
done
  
========
while true
do
  command
done
========
for((;;))  
```

### 跳出循环

#### break

```java
跳出当前循环， 不再执行当前循环
  
#!/bin/bash  
while:
do 
  read num
  case $num in
    1|2|3)
      echo "输入了 $num"
      ;;
    *)
      echo "输入错误"
      break
      ;;
	esac
done    

```

#### continue

```java
当前循环跳过当前不步骤，继续往下执行
  
```

## test 条件判断

### 介绍

```java
 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
语法：
     test expression
     简写： [expression]
     
```

### == 测试 ==

### 数值测试

```shell
参数	说明
-eq	等于则为真
-ne	不等于则为真
-gt	大于则为真
-ge	大于等于则为真
-lt	小于则为真
-le	小于等于则为真


num1=1
num2=2
echo test ${num1} -eq ${num2}  # true

# 下面的意思是 [num1] 创建一个数组， 元素只要num1
# $[num1] 获取只有 num1 的数组的引用
echo test $[num1] -eq $[num2]  # true
```

### 字符串测试

```java
参数	说明
=	等于则为真
!=	不相等则为真
-z 字符串	字符串的长度为零则为真
-n 字符串	字符串的长度不为零则为真
  
str1="123"  
str2="123"  
echo test $str1 == $str2  # true  
```



### 文件测试

```jav
参数	说明
-e 文件名	如果文件存在则为真
-r 文件名	如果文件存在且可读则为真
-w 文件名	如果文件存在且可写则为真
-x 文件名	如果文件存在且可执行则为真
-s 文件名	如果文件存在且至少有一个字符则为真
-d 文件名	如果文件存在且为目录则为真
-f 文件名	如果文件存在且为普通文件则为真
-c 文件名	如果文件存在且为字符型特殊文件则为真
-b 文件名	如果文件存在且为块特殊文件则为真

if test -e ./bash
then
	echo '文件已经存在'
else
	echo '文件不存在'
fi	
```







# 模块化

```java
Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。
```

## 声明使用

```shell
# 方式一
. fileName
# 方式二
source
```







# == 面向对象

# 函数

```java
linux shell 可以用户定义函数，然后在shell脚本中可以随便调用。
```

## 声明定义

```shell
# 介绍
所有函数在使用前必须定义。这意味着必须将函数放在脚本开始部分，直至shell解释器首次发现它时，才可以使用。调用函数仅使用其函数名即可。
# 函数声明
sum() {
  echo "这是一个函数"
}

function sum() {
	echo
}


# 函数调用
s


```

## 参数

```shell
调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，
	$1表示第一个参数，
	$2表示第二个参数
	...
	$9表示第九个参数
	超过第9个参数，需要使用${n}来获取参数。

sum() {
	echo $1 + $2
}

sum 1 2
```

### 特殊符号

```java
$#	传递到脚本或函数的参数个数
$*	以一个单字符串显示所有向脚本传递的参数
$$	脚本运行的当前进程ID号
$!	后台运行的最后一个进程的ID号
$@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
$-	显示Shell使用的当前选项，与set命令功能相同。
$?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
```



## 返回值

```java
return 返回，
  如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255
                                       
函数返回值在调用该函数后通过 $? 来获得。                              $? 仅对其上一条指令负责，一旦函数返回后其返回值没有立即保存入参数，那么其返回值将不再能通过 $? 获得。                 
                                               
function sum() {
  return 2
}      
sum
echo "和为 $?"                                               
                                               
                                               
```





# == 库

## 介绍

```shell
从你的终端接受输入并将所产生的输出发送回​​到您的终端。一个命令通常从一个叫标准输入的地方读取输入，默认情况下，这恰好是你的终端。同样，一个命令通常将其输出写入到标准输出，默认情况下，这也是你的终端。
```

# 内置函数

## echo

```shell
介绍
  Shell 的 echo 指令与 PHP 的 echo 指令类似，都是用于字符串的输出。命令格式
  
案例
显示普通字符串
  echo "it is test"
  echo it is test
显示转义字符
  echo "\"it is test ""
  
从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量
  read name
  echo "${name} it is a name"
  
换行
  echo -e "ok \n" # -e 开启转义
不换行
  echo -e "ok \c" # \c 不换行
  
  
输出到文件
  echo "123" > fileName
  
原样输出
  echo '$name'
  
显示命令执行结果
  # 这里使用的是反引号 `, 而不是单引号 '
  # Thu Jul 24 10:08:46 CST 2014
  echo `date`  
```

## printf

### 介绍

```java
printf 由 POSIX 标准所定义，因此使用 printf 的脚本比使用 echo 移植性好。

printf 使用引用文本或空格分隔的参数，外面可以在 printf 中使用格式化字符串，还可以制定字符串的宽度、左右对齐方式等。默认的 printf 不会像 echo 自动添加换行符，我们可以手动添加 \n。
```



### 命令

```java
printf format-string [arguments...]
printf "%s %s %4.2f"  李四 男 22.123
  
# format-string为双引号
printf "%d %s\n" 1 "abc"

# 单引号与双引号效果一样
printf '%d %s\n' 1 "abc"

# 没有引号也可以输出
printf %s abcdef

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def

printf "%s\n" abc def

printf "%s %s %s\n" a b c d e f g h i j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"  
```

### 格式化替代符

```java
％s 输出一个字符串
  %-10s 指一个宽度为 10 个字符（- 表示左对齐，没有则表示右对齐），任何字符都会被显示在 10 个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
％d 整型输出
％c 输出一个字符，
％f 输出实数，以小数形式输出
  %-4.2f 指格式化为小数，其中 .2 指保留2位小数。
    
    
    netstat -anp | grep 6200
```



### 转义序列

```hava
序列	说明
\a	警告字符，通常为ASCII的BEL字符
\b	后退
\c	抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
\f	换页（formfeed）
\n	换行
\r	回车（Carriage return）
\t	水平制表符
\v	垂直制表符
\\	一个字面上的反斜杠字符
\ddd	表示1到3位数八进制值的字符。仅在格式字符串中有效
\0ddd	表示1到3位的八进制值字符
```



















# 重定向

```shell
命令	说明
command > file	将输出以覆盖的方式重定向到 file。
command >> file	将输出以追加的方式重定向到 file。


# 
command < file	将输入重定向到 file。从文件中获取

n > file	将文件描述符为 n 的文件重定向到 file。
n >> file	将文件描述符为 n 的文件以追加的方式重定向到 file。
n >& m	将输出文件 m 和 n 合并。
n <& m	将输入文件 m 和 n 合并。
<< tag	将开始标记 tag 和结束标记 tag 之间的内容作为输入。
```

### 输出重定向

```shell
# command > file	将输出重定向到 file。

```

















































