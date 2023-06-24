## 日志常用命令

````
```java

介绍
	
命令
	
参数
 	
案例
	

```
````



## find

```shell

path 是要查找的目录路径，可以是一个目录或文件名，也可以是多个路径，多个路径之间用空格分隔，如果未指定路径，则默认为当前目录。

find [path] [expression]
	path 表示要搜索的目录路径，可以是相对路径或绝对路径；
		. 从当前目录开始查找
		/ 从根目录开始查找，会一往所有的子目录一直查询
	expression 表示查找文件的条件，可以是文件名、文件类型、文件大小等等。
命令
    -name pattern：按文件名查找，支持使用通配符 * 和 ?。
    -type type：按文件类型查找，可以是 f（普通文件）、d（目录）、l（符号链接）等。
    -size [+-]size[cwbkMG]：按文件大小查找，支持使用 + 或 - 表示大于或小于指定大小，单位可以是 c（字节）、w（字数）、b（块数）、k（KB）、M（MB）或 G（GB）。
    -mtime days：按修改时间查找，支持使用 + 或 - 表示在指定天数前或后，days 是一个整数表示天数。
    -user username：按文件所有者查找。
    -group groupname：按文件所属组查找。
    find 命令中用于时间的参数如下：

    -amin n：查找在 n 分钟内被访问过的文件。
    -atime n：查找在 n*24 小时内被访问过的文件。
    -cmin n：查找在 n 分钟内状态发生变化的文件（例如权限）。
    -ctime n：查找在 n*24 小时内状态发生变化的文件（例如权限）。
    -mmin n：查找在 n 分钟内被修改过的文件。
    -mtime n：查找在 n*24 小时内被修改过的文件。
    在这些参数中，n 可以是一个正数、负数或零。正数表示在指定的时间内修改或访问过的文件，负数表示在指定的时间之前修改或访问过的文件，零表示在当前时间点上修改或访问过的文件
例子
	// 当前目录下查找所有名为 example.txt 的文件，可以使用以下命令
	find . -name "example.txt"
	// 查询后缀为 java 的文件
	find /path/to/directory -name "*.java"





 

例如：-mtime 0 表示查找今天修改过的文件，-mtime -7 表示查找一周以前修改过的文件。

关于时间 n 参数的说明：

+n：查找比 n 天前更早的文件或目录。

-n：查找在 n 天内更改过属性的文件或目录。

n：查找在 n 天前（指定那一天）更改过属性的文件或目录

```

## grep --用于在文本文件中查找指定的字符串

```java
grep [options] pattern [files]
    options 表示命令选项，用于控制 grep 命令的行为；
    pattern 表示要查找的字符串或正则表达式；
    file [输入]表示要查找的文件名或文件名列表。
参数
	-i：忽略大小写
    -w：只匹配完整单词，不匹配单词的一部分
    -v：反向匹配，即匹配不包含指定字符串的行
    -c：只输出匹配行的计数，不输出匹配的行
    -n：在输出的每一行前加上行号
    -r：递归地查找指定目录及其子目录中的文件
    -l：只输出包含指定字符串的文件名，不输出匹配的行
    -e pattern：指定多个模式匹配的字符串
    
例子
	// 实时地从 log_file 文件的末尾读取数据，并将其输出到终端上。-f 选项表示实时追踪文件，即当文件更新时，tail 命令会自动将新添加的内容输出到终端上。
	// | 符号是管道符号，用于将 tail 命令的输出作为 grep 命令的输入。grep 命令会查找包含指定字符串 search_term 的行，并将这些行输出到终端上。
	tail -f log_file | grep search_term
	
	
	
	
[一些好用的命令]
tail -f log_file | grep -i "success\|error"  一直监控出现 success 或者 error 的行
	
```

## head

```java
介绍
	查看文件的前几行，默认情况下，head 命令会输出文件的前 10 行
命令
	head [option] [file]
	option 是可选参数，用于指定要输出文件的前几行。如果不指定该参数，默认输出文件的前 10 行；
	file 是要查看的文件名。【输入】
参数
    -n：指定要输出的行数。例如，head -n 5 file.txt 表示输出 file.txt 文件的前 5 行。
    -c：指定要输出的字节数。例如，head -c 20 file.txt 表示输出 file.txt 文件的前 20 个字节。
    -q：当查看多个文件时，不输出文件名。
    -v：当查看多个文件时，输出文件名。
案例
	// 
	echo "Hello World" | head -n 1
```



## tail

```java
介绍
	用于查看文件的末尾内容。该命令默认显示文件的最后10行内容
命令
	tail [option] [file]
	option 是可选参数，用于指定要输出文件的末尾部分。如果不指定该参数，默认输出文件的最后 10 行；
    file 是要查看的文件名。
参数
 	-n：指定要输出的行数。例如，tail -n 5 file.txt 表示输出 file.txt 文件的最后 5 行。
    -c：指定要输出的字节数。例如，tail -c 20 file.txt 表示输出 file.txt 文件的最后 20 个字节。
    -f：实时输出文件的最后几行，并持续监控文件的新增内容。这个选项通常用于查看日志文件等实时产生的文件。
案例
    tail -f info.log  :动态查看实时输出info.log日志

    tail -n 200 info.log：查看info.log日志后200行

    tail -f info.log | grep  "orderId"：动态查看含有关键字orderId的日志

    tail -n 50 fileName,打印文件末尾50行内容
    tail -n +50 fileName,打印文件从第50行开始一直到末尾的内容
    tail -f fileName ,持续跟踪文件的增长情况，实时输出文件的更新内容；当文件改名或被删除，则跟踪停止；常用于查看实时日志情况；可以简写为tailf fileName
    tail -F fileName ： 注意这里是大写的F， ,持续跟踪文件的增长情况，实时输出文件的更新内容；并保持重试，当文件改名或被删除后，后面又创建了相同的文件，则会继续跟踪；
    tail -f -s 10 fileName：每次间隔10秒打印一次文件的最新内容
    tail -n 50 fileName >> tail.txt ：将文件末尾50行的内容保存到tail.txt文件中
    tail -c 50 fileName ：打印文件末尾50个字节的字符
```

## cat

```java
介绍
	用于查看和连接文件
    当文件较大时，使用 cat 命令会一次性将整个文件内容加载到内存中，可能会导致内存不足。此时可以使用其他命令如 less 或 tail 命令进行分页查看或查看文件的部分内容。
命令
    cat [option] [file]

参数
 	-n：显示每行的行号。
    -b：显示非空行的行号。
    -s：将多个空行压缩为一个空行。
    -E：在每行的末尾显示 $ 符号。
-n 或 --number：由 1 开始对所有输出的行数编号。
-b 或 --number-nonblank：和 -n 相似，只不过对于空白行不编号。
-s 或 --squeeze-blank：当遇到有连续两行以上的空白行，就代换为一行的空白行。
-v 或 --show-nonprinting：使用 ^ 和 M- 符号，除了 LFD 和 TAB 之外。
-E 或 --show-ends : 在每行结束处显示 $。
-T 或 --show-tabs: 将 TAB 字符显示为 ^I。
-A, --show-all：等价于 -vET。
-e：等价于"-vE"选项；
-t：等价于"-vT"选项；  
    
案例
	cat 命令还有一些高级用法，例如：

    cat file1 file2 > file3：将 file1 和 file2 的内容合并，输出到 file3 中。
    cat file1 >> file2：将 file1 的内容追加到 file2 的末尾。
    cat file | grep pattern：将 file 的内容传递给 grep 命令进行查找。
cat info.log：查看info.log的全部日志内容

cat info.log | grep  "java"：查看info.log的java关键字关联的全部内容

cat info.log | grep -A 5 "java"：查看info.log的java关键字后5行关联的全部内容

cat info.log | grep -B 10 "java"：查看info.log的java关键字前10行关联的全部内容

cat info.log | grep -C 20 "java"：查看info.log的java关键字前后20行关联的全部内容
```

## tac

```java
介绍
	区别是cat升序展示，tac倒叙展示
命令
	
参数
 	
案例
	

```

## less

```java
介绍
	当文件较大时，使用 cat 命令会一次性将整个文件内容加载到内存中，可能会导致内存不足。此时可以使用其他命令如 less 或 tail 命令进行分页查看或查看文件的部分内容。
命令
  
参数
 	-N：显示行号。
-S：禁用换行符，并将长行折叠成多行。
-i：忽略大小写进行搜索。
-w：高亮显示搜索结果。
-f：跟踪文件内容变化，类似于 tail -f 命令。
----
-b <缓冲区大小> 设置缓冲区的大小
-e 当文件显示结束后，自动离开
-f 强迫打开特殊文件，例如外围设备代号、目录和二进制文件
-g 只标志最后搜索的关键词
-i 忽略搜索时的大小写
-m 显示类似more命令的百分比
-N 显示每行的行号
-o <文件名> 将less 输出的内容在指定文件中保存起来
-Q 不使用警告音
-s 显示连续空行为一行
-S 行过长时间将超出部分舍弃
-x <数字> 将"tab"键显示为规定的数字空格    
==================
/字符串：向下搜索"字符串"的功能
?字符串：向上搜索"字符串"的功能
n：重复前一个搜索（与 / 或 ? 有关）
N：反向重复前一个搜索（与 / 或 ? 有关）
b 向上翻一页
d 向后翻半页
h 显示帮助界面
Q 退出less 命令
u 向前滚动半页
y 向前滚动一行
空格键 滚动一页
回车键 滚动一行
[pagedown]： 向下翻动一页
[pageup]： 向上翻动一页  
案例
	less info.log ：从头开始查看info.log日志内容    
less -b 1024 fileName ：设置缓冲区大小
less -e fileName ：当文件显示结束后，再往后翻页将会自动离开
less -f fileName ： 强迫打开特殊文件，例如外围设备代号、目录和二进制文件
less -i fileName ：搜索时忽略大小写，搜索命令在下面会提到
less -N fileName ：展示每行的行号
less -s fileName ： 当遇到有连续两行以上的空白行，就合并为一行的空白行
less -m fileName ：查看进度，以百分比的方式展示，和more命令最下面的百分比类似
```



## more

```java
介绍
	用于查看文本文件的内容。它可以一次性显示文件的一部分内容，并等待用户输入指令来继续显示文件的下一部分内容。
    空格键：space查看下一页，B键查看上一页；需要注意的是more命令不能直接定位到末尾开始翻页。
命令
	more [option] [file]

参数
 	-d：显示每一页的头部和尾部，以及文件的百分比。
-c：清屏后显示。
-p：指定文件中要显示的起始行数。
案例
   
    
more fileName：默认根据窗口大小，一页一页地显示文件内容；
more -10 fileName ： 翻页时每页显示10行
more +10 fileName：从第10行开始分页
more -d fileName ：提示，在画面下方显示 [Press space to continue, ‘q’ to quit.] ，如果你按错键了会提示： [Press ‘h’ for instructions.] ，按下H键会展示帮助信息，告诉你有哪些可以使用的命令；
more -l fileName ：取消遇见特殊字元 ^L（送纸字元）时会暂停的功能
more -f fileName：计算行数时，以实际上的行数，而非自动换行过后的行数（有些单行字数太长的会被扩展为两行或两行以上）
more -p fileName ：不以卷动的方式显示每一页，而是先清除萤幕后再显示内容（不加-p时下一页上一页都是追加在后面展示的）
more -c fileNme ：不以卷动的方式显示每一页，而是先显示内容后在清除萤幕（-c 跟 -p 相似，不同的是先显示内容再清除其他旧资料，肉眼看不出区别）
more -s fileName ： 当遇到有连续两行以上的空白行，就合并为一行的空白行
more +/exception fileName：在每个文档显示前搜寻该字串（exception），然后从该字串之后开始显示
more fileName1 fileName2 ： 展示多个文件内容，到达第一个文件末尾时，按下空格键将自动翻页到下一个文件的展示
more -u fileName ：不显示下引号输出，百度了下回车旁边的就是下引号，其实就是单引号；
    
more info.log：查看info.log的日志内容，按下方附加操作滚动日志内容

more info.log |grep "test"：查看全部关键字test关联内容
    
如果不指定该参数，则 more 命令会以交互式方式打开指定的文件，并显示文件的第一页内容。在 more 中，可以使用空格键来向下翻页，使用 b 键来向上翻页，使用 / 键来进行搜索，使用 q 键退出 more。

需要注意的是，当文件较大时，使用 more 命令会一次性将整个文件内容加载到内存中，可能会导致内存不足。因此，在处理较大的文本文件时，通常建议使用 less 命令或其他更高级的工具。
```

## nl

```java
介绍
	展示行号
命令
	
参数
 	
案例
nl -b a fileName： 无论是否空行，都展示出行号，和cat -n fileName命令一样
nl -b t fileName： 如果有空行，空的那一行不显示行号（默认值）
nl -n ln fileName：行号在命令行的最左边展示
nl -n rn fileName ：行号在最右边展示，且不加0
nl -w 2 fileName ：行号占用的位数；
nl -n rz fileName ：行号在最左边展示，加0 。如下图

```

## jps

```java
jps 命令用于查看当前系统中正在运行的 Java 进程信息，包括进程 ID 和进程名称。使用 jps 命令可以方便地查看 Hadoop 集群中的各个组件进程，如 NameNode 进程、DataNode 进程、ResourceManager 进程、NodeManager 进程、HiveServer2 进程等。

jps 命令的常用选项包括：

jps -m：显示正在运行的 Java 进程信息，包括进程 ID、进程名称和当前运行的主类。
jps -l：显示正在运行的 Java 进程信息，包括进程 ID、进程名称和完整的 Java 应用程序包名。
jps -v：显示正在运行的 Java 进程信息，包括进程 ID、进程名称和 Java 虚拟机的启动参数。
jps -q：仅显示进程 ID，不显示进程名称和其他详细信息。
jps -help：显示 jps 命令的帮助信息。



例如，要查看 NameNode 进程的进程 ID 和进程名称，可以在命令行中输入以下命令：
jps -m -l // 这将列出当前系统中正在运行的 Java 进程信息，找到 NameNode 进程，可以看到其进程 ID 和进程名称
```



## ===

## 循环查询日志

## tail+f

```java
tail -f location_of_log_file
tail -f log_file | grep search_term
tail -f log_file | grep -C 3 search_term
tail -f log_file | grep -C 3 -i - E 'search_term_1|search_term_2'

// 日志轮转： 日志都会轮转（rotation），即当日志文件达到一定大小后，就会重命名并压缩
// 按照日志文件的名称跟踪日志文件。这样，即使发生日志旋转，尾部也将指向当前日志文件（因为其名称从未更改）。
tail --follow=name log_file | grep -C 3 -i - E 'search_term_1|search_term_2'
// 使用 tail 命令同时监视多个日志文件，只需要提供文件的路径
tail -f log_file_1 -f log_file_2
```

## multitail 

```java
// 它可以在拆分视图中显示文件，甚至可以在不同的行和列中显示不同的文件
// multitail 在大多数Linux系统中没有被默认安装，所以在使用前需要先手动安装。

```



# ls

```
ls（英文全拼： list directory contents）命令用于显示指定工作目录下之内容（列出目前工作目录所含的文件及子目录)。

语法
	 ls [-alrtAFR] [name...]
	 name: 
	 	文件夹则显示当前文件夹下的文件
	 	文件则显示改文件
	 
含义
	查询 name 下的文件夹
参数
	-a 显示所有文件及目录 (. 开头的隐藏文件也会列出)
    -d 只列出目录（不递归列出目录内的文件）。
    -l 以长格式显示文件和目录信息，包括权限、所有者、大小、创建时间等。
    -r 倒序显示文件和目录。
    -t 将按照修改时间排序，最新的文件在最前面。
    -A 同 -a ，但不列出 "." (目前目录) 及 ".." (父目录)
    -F 在列出的文件名称后加一符号；例如可执行档则加 "*", 目录则加 "/"
    -R 递归显示目录中的所有文件和子目录。
```



# iptables 

```
请用Iptables写出只允许10.1.8.179 访问本服务器的22端口。
/sbin/iptables -A input -p tcp -dport 22 -s 10.1.8.179 -j ACCEPT
/sbin/iptables -A input -p udp -dport 22 -s 10.1.8.179 -j ACCEPT
/sbin/iptables -P input -j DROP

// ====================
这三个命令是关于 iptables 防火墙的命令，含义如下：

1. `/sbin/iptables -A input -p tcp -dport 22 -s 10.1.8.179 -j ACCEPT`：
   - 向 iptables 的 `input` 链（表示进入本机的数据包）添加一条规则
   - 规则允许 TCP 协议、目的端口为 22、来源 IP 地址为 10.1.8.179 的数据包通过防火墙（ACCEPT 表示允许通过）

2. `/sbin/iptables -A input -p udp -dport 22 -s 10.1.8.179 -j ACCEPT`：
   - 向 iptables 的 `input` 链添加一条规则
   - 规则允许 UDP 协议、目的端口为 22、来源 IP 地址为 10.1.8.179 的数据包通过防火墙

3. `/sbin/iptables -P input -j DROP`：
   - 设置 iptables 的 `input` 链的默认策略为 DROP（表示拒绝所有未明确允许的数据包通过）
   - `-P` 选项用于设置默认策略，`-j DROP` 表示默认拒绝数据包通过并将其丢弃（DROP 表示丢弃）
```



# sed

```shell
Linux sed 命令是利用脚本来处理文本文件。

sed 可依照脚本的指令来处理、编辑文本文件。

Sed 主要用来自动编辑一个或多个文件、简化对文件的反复操作、编写转换程序等。

语法
sed [-hnV][-e<script>][-f<script文件>][文本文件]
参数说明：

-e<script>或--expression=<script> 以选项中指定的script来处理输入的文本文件。
-f<script文件>或--file=<script文件> 以选项中指定的script文件来处理输入的文本文件。
-h或--help 显示帮助。
-n或--quiet或--silent 仅显示script处理后的结果。
-V或--version 显示版本信息。
动作说明：

a ：新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
c ：取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！
d ：删除，因为是删除啊，所以 d 后面通常不接任何东东；
i ：插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
p ：打印，亦即将某个选择的数据印出。通常 p 会与参数 sed -n 一起运行～
s ：取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正则表达式！例如 1,20s/old/new/g 就是啦！



案例
sed 修改  test.txt 的第 23 行 test 为 try
#行号 动作/ 动作的内容
sed -i '23s/test/try/g' test.txt

# 删除每个临时文件的最初三行
sed -i '1,3d' /tmp
```

# awk

```java
 AWK 是因为其取了三位创始人 Alfred Aho，Peter Weinberger, 和 Brian Kernighan 的 Family Name 的首字符。
Linux 命令大全 Linux 命令大全

AWK 是一种处理文本文件的语言，是一个强大的文本分析工具。

之所以叫 AWK 是因为其取了三位创始人 Alfred Aho，Peter Weinberger, 和 Brian Kernighan 的 Family Name 的首字符。

语法
awk [选项参数] 'script' var=value file(s)
或
awk [选项参数] -f scriptfile var=value file(s)
选项参数说明：

-F fs or --field-separator fs
指定输入文件折分隔符，fs是一个字符串或者是一个正则表达式，如-F:。
-v var=value or --asign var=value
赋值一个用户定义变量。
-f scripfile or --file scriptfile
从脚本文件中读取awk命令。
-mf nnn and -mr nnn
对nnn值设置内在限制，-mf选项限制分配给nnn的最大块数目；-mr选项限制记录的最大数目。这两个功能是Bell实验室版awk的扩展功能，在标准awk中不适用。
-W compact or --compat, -W traditional or --traditional
在兼容模式下运行awk。所以gawk的行为和标准的awk完全一样，所有的awk扩展都被忽略。
-W copyleft or --copyleft, -W copyright or --copyright
打印简短的版权信息。
-W help or --help, -W usage or --usage
打印全部awk选项和每个选项的简短说明。
-W lint or --lint
打印不能向传统unix平台移植的结构的警告。
-W lint-old or --lint-old
打印关于不能向传统unix平台移植的结构的警告。
-W posix
打开兼容模式。但有以下限制，不识别：/x、函数关键字、func、换码序列以及当fs是一个空格时，将新行作为一个域分隔符；操作符**和**=不能代替^和^=；fflush无效。
-W re-interval or --re-inerval
允许间隔正则表达式的使用，参考(grep中的Posix字符类)，如括号表达式[[:alpha:]]。
-W source program-text or --source program-text
使用program-text作为源代码，可与-f命令混用。
-W version or --version
打印bug报告信息的版本。
```

