# 安装配置

* 编译安装

  ```
  编译， cd 到 安装目录，就是 bin 文件夹的父文件夹
  make
  安装： 还是在此文件夹
  make install PREFIX=/usr/local/redis/ 后面的是你想要安装的路径
  
  ```

* 配置

  ```yaml
  # redis配置文件修改，文件路径为安装目录下redis/redis.conf
  # ==================
  # 注意： 你不配置 redis 的访问密码，就不要在spring的配置文件中写上 redis 密码字段，否则异常
  #  内网无所谓密码，外网一定要设置密码，如果不设置密码又开放了6379，大概5分钟就会被植入木马
  # ==================
  
  bind 127.0.0.1, 改为 0.0.0.0
  说明：bind属性为:绑定的IP。与protected-mode属性关联使用，此处暂且取消IP绑定，可根据实际情况而定！
  
  将notify-keyspace-events属性的值改为K$g
  说明：notify-keyspace-events属性为:事件通知
  
  将protected-mode属性的值由yes改为no
  说明：protected-mode属性为:是否开启保护模式。如关闭，则外部网络可直接访问；如开启，则需配置bind ip或者设置访问密码。此处暂且关闭，可根据实际情况而定！
  
  
  将daemonize属性的值由no改为yes
  说明：daemonize属性为:是否开启后台启动。开启后可确保控制台关闭后，进程在后台继续正常运行！
  
  # 日志最好放在 redis 安装目录下的位置
  将logfile属性的值改为本机日志存放路径
  此路径需要先创建，只需创建到log即可 log
  
  将dir属性的值改为本机rdb/AOF文件的存放路径
  ```

* 启动

  ```
  ./bin/redis-server ./redis.conf
  ```

# 密码设置

```java
// 方式一： 配置文件中 redis.config, 需要重启 redis
requirepass root

// 方式二： 连接 redis 后设置， 不需要重启
// 通过命令行修改了密码之后，配置文件的requirepass字段后面的密码是不会随之修改的。
config set requirepass 123456
config get requirepass
```



# 命令

```
bin/redis-server redis.conf 根据配置文件启动
bin/redis-cli shutdown 停止
```





# == 待整理

# redis

## 问题

```
mv redis-6.2.5 redis /usr/local/redis  这个命令怎么不起效果？？
```

## 安装

```
make install PREFIX=/usr/local/redis/ 后面的是你想要安装的路径
注意
	1. 文档中出现 的 cd src & install 是运行的记录，不是输入的命令
	2. 这个在原安装包的基础上多了一个 bin 文件夹，其他都是具体的

REFIX= 这个关键字的作用是编译的时候用于指定程序存放的路径。比如我们现在就是指定了redis必须存放在/usr/local/redis目录。
假设不添加该关键字
	Linux会将可执行文件存放在/usr/local/bin目录，
	库文件会存放在/usr/local/lib目录。
	配置文件会存放在/usr/local/etc目录。
	其他的资源文件会存放在usr/local/share目录。
这里指定号目录也方便后续的卸载，后续直接rm -rf /usr/local/redis 即可删除redis。
```

## 启动

```
/etc/init.d/redis-server start 启动redis服务
/etc/init.d/redis-server stop 停止redis服务
/etc/init.d/redis-server restart 重启redis服务
```



## 处理

* 6379 端口被占用

  ```
  可能启动的时候，配置文件出错，但是启动成功了了
  ```

* WARNING overcommit_memory is set to 0! Background save may fail
  under low memory condition. To fix this issue add ‘vm.overcommit_memory = 1’ to > > > /etc/sysctl.conf and then reboot or run the command ‘sysctl vm.overcommit_memory=1’ > for this to take effect. 

  ```
  该警告表示 Redis 服务器的 overcommit_memory 参数被设置为 0，这可能会导致在低内存条件下后台保存失败。为了解决这个问题，可以按照以下步骤进行操作：
  
  编辑 /etc/sysctl.conf 文件：
  
  打开 /etc/sysctl.conf 文件，可以使用文本编辑器如 vi 或 nano。
  添加配置项：
  
  在文件的末尾添加一行配置项：vm.overcommit_memory = 1
  保存并关闭文件：
  
  保存对文件的修改，并关闭编辑器。
  重启系统（可选）：
  
  重启系统以使新的配置生效。这样 Redis 服务器在启动时会使用新的 overcommit_memory 参数设置
  ```

  

