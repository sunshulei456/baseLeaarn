# nginx

## 问题

```
为什么 nginx 要安装到 opt 目录下面？，而不是 /usr/local/下
```

## 介绍

```java
yum install gcc
yum install pcre-devel
yum install zlib zlib-devel
yum install openssl openssl-devel

 // yum -y install gcc zlib zlib-devel pcre-devel openssl openssl-devel

```

## 安装命令

```java
// 将会编译和安装 Nginx，并将其安装到 /opt/primeton/nginx 目录下
// 注意使用 --prefix 更改自己的安装目录，
./configure --prefix=/opt/primeton/nginx && make &&make install
    configure：做大量幕后工作，检测系统内核及必备软件、参数的解析、中间目录生成、生成C源码文件、Makefile文件等 
    make ：根据configure命令生成的Makefile文件编译Nginx工程，并且生成目标文件及最终二进制文件。 
    make install ： 根据configure执行时的参数将Nginx部署到指定的安装目录，包括相关文件目录的建立和二进制文件、配置文件的复制
    
    
    

这个命令用于编译和安装 Nginx，并将其安装到 /opt/primeton/nginx 目录下。下面是对每个步骤的解析：

./configure --prefix=/opt/primeton/nginx：这是配置阶段，使用 ./configure 脚本为 Nginx 进行配置。--prefix=/opt/primeton/nginx 参数指定了安装目录为 /opt/primeton/nginx。这意味着编译完成后，Nginx 将安装到指定的目录下。

make：这是编译阶段，执行 make 命令会根据配置生成 Nginx 的可执行文件和相关的库文件。make 命令会读取当前目录下的 Makefile 文件，并根据其中的规则和依赖关系进行编译。

make install：这是安装阶段，执行 make install 命令会将编译好的 Nginx 文件安装到指定的目录中，也就是之前在配置阶段指定的 /opt/primeton/nginx 目录。这个命令将复制 Nginx 的可执行文件、配置文件和其他相关文件到指定目录中，完成安装过程。

 
    
//
 。
```



## 验证

* 安装目录

  | Nginx安装目录  |            /opt/primeton            |
  | :------------: | :---------------------------------: |
  | 二进制文件路径 |   /opt/primeton/nginx/sbin/nginx    |
  |  配置文件路径  | /opt/primeton/nginx/conf/nginx.conf |

* 验证

  ```
  启动验证Nigix
  $cd /opt/primeton/nginx/
  $./sbin/nginx -t
  nginx: the configuration file /opt/primeton/nginx/conf/nginx.conf syntax is ok
  nginx: configuration file /opt/primeton/nginx/conf/nginx.conf test is successful
  
  $cd /opt/primeton/nginx/sbin
  $./nginx
  ```

  ![image-20230519090531269](image-20230519090531269.png)

## 命令

```
# 常用命令
./nginx 开启
./nginx -s stop 停止
./nginx -s reload 重启(每次修改完nginx配置文件需要重启)
```

