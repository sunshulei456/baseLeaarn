### 判断两台主机是否 ping 通

```java
// ping 命令查询
ping --help
  
read -p "请输入要输入ping的主机IP:"  IP
ping -cl $ip &> /dev/null
if [ $? -eq 0]  
then
  echo "互通"
else
  echo "不通"
fi  
  
```



### 判断进程是否存在

```java
ps top pgrep
  
#!/bin/env bash
# 判断成U型的进程
pgrep httpd $>/dev/null
if [$? -ne 0 ]  
then
  echo "httpd 进程不存在"
else
  echo "httpd 进程存在"
fi  
```





## 服务是否正常

```java
1. 可以判断进程是否存在
2. 直接访问
  
wget curl elinks --dump
  
  
#!/bin/dev bash
web=www.itcast
wget $web &>/dev/null
[ $? -eq 0 ] && echo "网站正常" || echo "网站不正常"
```







## **将A 、B、C目录下的文件A1、A2、A3文件，改名为AA1、AA2、AA3.使用shell脚本实现**

```shell
files = 'ls [ABC]/A[123]'
for file in $files
do
	mv $file ${file?/*}/A${file#*/}
done	
```

* **脚本（如：目录dir1、dir2、dir3下分别有file1、file2、file2，请使用脚本将文件改为dir1_file1、dir2_file2、dir3_file3）**

  ```shell
  files = `ls dir[123]/file[123]`
  for file in $files
  do
  	mv $file ${file%/*}${file%%/*}_${file##*/}
  done	
  ```

* **找出系统内大于50k，小于100k的文件，并删除它们**

  ```shell
  files = `find ./ -size +50k -size -100K`
  for file in $files
  do
  	rm -rf $file
  done
  ```

**1到10数字相加，写出shell脚本**

```shell
#!/bin/bash
res=0
for((i=1;i<11;i++))
do
	res=$[res+i]
done
echo $res
```

## 文档操作

**17、 有文件file1**
\1) 查询file1里面空行的所在行号
grep -n ^$ file1
\2) 查询file1以abc结尾的行
grep abc$ file1
\3) 打印出file1文件第1到第三行
head -n3 file1
sed "3q" file1
sed -n "1,3p" file1























