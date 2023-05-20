

# 待整理

* http://c.biancheng.net/view/7764.html
* https://blog.csdn.net/nmb_jiang/article/details/105436501
* https://blog.csdn.net/weixin_49472648/article/details/125824697?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-125824697-blog-105436501.235^v36^pc_relevant_anti_vip_base&spm=1001.2101.3001.4242.2&utm_relevant_index=4
* 

# mysq 日志

## 分类

* 错误日志
* 查询日志  **select 查询语句**
* 慢查询日志    **查看执行时间长的sql，可开启慢日志查询**
* 事务日志(Redo log)
* 二进制日志
* 中继日志

## 语法

```mysql
# 查询全局日志存储的方式，注意是所有日志的存储方式
show variables like 'log_output'

# 设置
set global log_output='xxx';
	FILE：表示日志将输出到文件中。
    TABLE：表示日志将输出到 MySQL 的系统表中，如 mysql.general_log 表和 mysql.slow_log 表。
    NONE：表示禁用日志输出。
    
log_output='file'
	-- 日志输出至table模式，查看日志记录
    SELECT * from mysql.general_log ORDER BY event_time DESC; 
 
 
 -- table 模式日志清楚： 不允许使用delete删除mysql.general_log ，只能用truncate
truncate table mysql.general_log;
```



# 正在执行的语句查看

```mysql
-- 切换数据库
use information_schema;
-- 查看正在执行的SQL语句
show processlist;

-- 或者直接使用SQL语句查询
select * from information_schema.`PROCESSLIST` where info is not null;
————————————————
版权声明：本文为CSDN博主「csd_nuser」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/csd_nuser/article/details/121236625
```



# 错误日志

### 介绍

* 作用：记录启动\关闭\日常运行过程中,状态信息,警告,错误
* 位置： 默认开启， 位于 datadir/hostname.err

## 语法配置

```mysql
-- 通过 SHOW 命令可以查看错误日志文件所在的目录及文件名信息。
SHOW VARIABLES LIKE 'log_error';

-- 可以使用 mysqladmin 命令来开启新的错误日志，以保证 MySQL 服务器上的硬盘空间
-- MySQL 服务器首先会自动创建一个新的错误日志，然后将旧的错误日志更名为 filename.err-old。
mysqladmin -uroot -p flush-logs
```





### 手动配置

```mysql
默认就是开启的:  /数据路径下/hostname.err
-- 查询
select @@log_error;
-- 手工设定:
vim /etc/my.cnf
log_error=/var/log/mysql.log
log_timestamps=system

-- 重启生效
show variables like 'log_error';
```



# 查询日志-general

## 语法

```mysql
# 查询是否开启普通日志功能
show variables like 'general_log';

# 开启
set global general_log=on;

# 关闭
set global general_log=off;

-- 查看日志输出文件的保存路径
show variables like 'general_log_file';

-- 修改日志输出文件的保存路径
set global general_log_file='tmp/general.log'; 

#===========================================

#===========================================
```



# 二进制日志(binarylog)

### 介绍

```
(1)备份恢复必须依赖二进制日志
(2)主从环境必须依赖二进制日志

二进制日志（Binary Log）也可叫作变更日志（Update Log），是 MySQL 中非常重要的日志
主要用于记录数据库的变化情况，即 SQL 语句的 DDL 和 DML 语句，【不包含】数据记录查询操作。


binlog是SQL层的功能。记录的是变更SQL语句，不记录查询语句。
    DDL ：原封不动的记录当前DDL(statement语句方式)。
    DCL ：原封不动的记录当前DCL(statement语句方式)。
    DML ：只记录已经提交的事务DM
```

### my.cnf 配置

* mysqld -- 二进制日志

## 语法配置

```mysql


-- 默认情况下，二进制日志功能是关闭的。
show variables like '%log_bin%'

# 查看一共多少个binlog
show binary logs;  
 
# 查看正在使用的二进制日志， 
# file：当前MySQL正在使用的文件名， Position：最后一个事件的结束位置号
show master status

# 查看二进制事件日志
show binlog events in 'mysql-bin.000004'
```



## 记录内容

```mysql
L
    
位置

```

### 记录单元 -event

```
介绍
	二进制日志记录的最小单元是 event
实例
	对于DDL,DCL,一个语句就是一个event
    对于DML语句来讲:只记录已提交的事务。
    例如以下列子,就被分为了4个event
    --- 
    begin  事件1
    a      事件2
    b      事件3
    commit 事件4
    -- 下面的要结合下面的 event 日志
    begin;      120  - 340
    DML1        340  - 460
    DML2        460  - 550
    commit;     550  - 760
```

### event - 日志

#### 基础

```mysql
Master [binlog]>show binlog events in 'mysql-bin.000003';
+------------------+-----+----------------+-----------+-------------+----------------------------------------+
| Log_name         | Pos | Event_type     | Server_id | End_log_pos | Info                                   |
+------------------+-----+----------------+-----------+-------------+----------------------------------------+
| mysql-bin.000003 |   4 | Format_desc    |         6 |         123 | Server ver: 5.7.20-log, Binlog ver: 4  |
| mysql-bin.000003 | 123 | Previous_gtids |         6 |         154 |                                        |
| mysql-bin.000003 | 154 | Anonymous_Gtid |         6 |         219 | SET @@SESSION.GTID_NEXT= 'ANONYMOUS'   |
| mysql-bin.000003 | 219 | Query          |         6 |         319 | create database binlog                 |
| mysql-bin.000003 | 319 | Anonymous_Gtid |         6 |         384 | SET @@SESSION.GTID_NEXT= 'ANONYMOUS'   |
| mysql-bin.000003 | 384 | Query          |         6 |         486 | use `binlog`; create table t1 (id int) |
+------------------+-----+----------------+-----------+-------------+----------------------------------------+

# 文件介绍
mysql-bin.000003
	这个不是普通的问题， 你直接使用 vim  查看得到的是乱码
	-- 文件属性查看： file mysql-bin.000003
	-- 文件查看： mysqlbinlog mysql-bin.000003
# 参数介绍
    Log_name：binlog文件名
    Pos：开始的position    *****
    Event_type：事件类型
    Format_desc：格式描述，每一个日志文件的第一个事件，多用户没有意义，MySQL识别binlog必要信息
    Server_id：mysql服务号标识
    End_log_pos：事件的结束位置号 *****
    Info：事件内容*****
    补充:
    SHOW BINLOG EVENTS
       [IN 'log_name']
       [FROM pos]
       [LIMIT [offset,] row_count]
    [root@db01 binlog]# mysql -e "show binlog events in 'mysql-bin.000004'" |grep drop
    


```



#### 截取信息进行恢复

```mysql

```



#### == gtid 

#### gtid 记录模式

```mysql
介绍
	GTID(Global Transaction ID)
	是对于一个已提交事务的编号，并且是一个全局唯一的编号。
版本改变
    5.6 版本新加的特性,不开启,没有这个功能.
    5.7 中的GTID,即使不开也会有自动生成， 十分完善了
    SET @@SESSION.GTID_NEXT= 'ANONYMOUS'
案例
	DDL、DCL 中的一个 event 就是一个事务， 就会有一个 GTID 号
	DML 语句中从 begin 到 commit 就是一个事务， 就有一个 GTID 号
配置
	配置文件中
	
构成
	GTID = source_id ：transaction_id
	dff98809-55c3-11e9-a58b-000c2928f5dd:1-6 ： 该gtid中有6个事务，编号是1-6
	
幂等性
	开启GTID后,MySQL恢复Binlog时,重复GTID的事务不会再执行了
	会影响到 binlog 恢复和主从复制

```

#### gtid查看

```mysql
具备GTID后,截取查看某些事务日志:
--include-gtids: 截取的事务
--exclude-gtids： 截取的时候， 需要抛出的事务
mysqlbinlog 
	--include-gtids='dff98809-55c3-11e9-a58b-000c2928f5dd:1-6'  
	--exclude-gtids='dff98809-55c3-11e9-a58b-000c2928f5dd:4'  
	/data/binlog/mysql-bin.000004

---------------------




Master [(none)]>create database gtid charset utf8;  # 创建表 gtid
Query OK, 1 row affected (0.01 sec)

Master [(none)]>show master status ;
+------------------+----------+--------------+------------------+----------------------------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set                      |
+------------------+----------+--------------+------------------+----------------------------------------+
| mysql-bin.000004 |      326 |              |                  | dff98809-55c3-11e9-a58b-000c2928f5dd:1 |
+------------------+----------+--------------+------------------+----------------------------------------+
1 row in set (0.00 sec)

-- 中间还有其他的内容

Master [gtid]>begin;
Query OK, 0 rows affected (0.00 sec)

Master [gtid]>insert into t2 values(1);
Query OK, 1 row affected (0.00 sec)

Master [gtid]>commit;
Query OK, 0 rows affected (0.01 sec)

Master [gtid]>show master status ;
+------------------+----------+--------------+------------------+------------------------------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set                        |
+------------------+----------+--------------+------------------+------------------------------------------+
| mysql-bin.000004 |     1321 |              |                  | dff98809-55c3-11e9-a58b-000c2928f5dd:1-6 |
+------------------+----------+--------------+------------------+------------------------------------------+
1 row in set (0.00 sec)

```



### 日志清理

```
# 自动清理
show variables like '%expire%';
expire_logs_days  0   
自动清理时间,是要按照全备周期+1
set global expire_logs_days=8;
永久生效:
my.cnf
expire_logs_days=15;
企业建议,至少保留两个全备周期+1的binlog

# 手动清理
PURGE BINARY LOGS BEFORE now() - INTERVAL 3 day;
PURGE BINARY LOGS TO 'mysql-bin.000010';

# 注意
1. 主库永远不要使用 reset master, 因为这样会导致从库出现问题
注意:不要手工 rm binlog文件
1. my.cnf binlog关闭掉,启动数据库
2.把数据库关闭,开启binlog,启动数据库
删除所有binlog,并从000001开始重新记录日志



```

### 生成新的日志

```k
日志滚动: 就是所谓的生成新的日志
1. flush logs; 
2. 重启mysql也会自动滚动一个新的
3. 日志文件达到1G大小(max_binlog_size)
# show max_binlog_size
| max_binlog_size                          | 1073741824     
备份时,加入参数也可以自动滚动
```



### 数据恢复

#### 基础恢复

```mysql
# 注意
	mysql 只能做过滤一个库的操作
# 文件信息截取
	1. 一个 at 到下一个临近的 at 就是一个事件
# 核心就是找截取的起点和终点,查看并截取
--start-position=321
--stop-position=513
 mysqlbinlog 
 	--start-position=219 
 	--stop-position=1347
    /data/binlog/mysql-bin.000003 
    >/tmp/bin.sql

案例: 使用binlog日志进行数据恢复
模拟:
1. 
[(none)]>create database binlog charset utf8;
2. 
[(none)]>use binlog;
[binlog]>create table t1(id int);
3. 
[binlog]>insert into t1 values(1);
[binlog]>commit;
[binlog]>insert into t1 values(2);
[binlog]>commit;
[binlog]>insert into t1 values(3);
[binlog]>commit;
4. 
[binlog]>drop database binlog;


恢复: ===
[(none)]>show master status ;   # 确认使用的哪一个日志
[(none)]>show binlog events in 'mysql-bin.000004'; # 查看事件
[root@db01 binlog]mysqlbinlog --start-position=1227 --stop-position=2342 /data/binlog/mysql-bin.000004 >/tmp/bin.sql # 找到起点和终点， 进行截取
[(none)]>set sql_Log_bin=0;  # 临时关闭恢复生产时产生的新日志，因为没必要相同的日志，记录两遍
[(none)]>source /tmp/bin.sql # 日志恢复命令
[(none)]>set sql_Log_bin=1; # 改回设置

面试案例:
1. 备份策略每天全备,有全量的二进制日志
2.业务中一共10个库,其中一个被误drop了
3. 需要在其他9个库正常工作过程中进行数据恢复

```



#### gtid 数据恢复

```mysql
幂等性
	开启GTID后,MySQL恢复Binlog时,重复GTID的事务不会再执行了
	会影响到 binlog 恢复和主从复制
	-- 数据恢复操作

    mysqlbinlog 
	    --skip-gtids  # 忽略援用的 gtid 信息，恢复时生成最先的 gtid 信息
        --include-gtids='dff98809-55c3-11e9-a58b-000c2928f5dd:1-6'  
        --exclude-gtids='dff98809-55c3-11e9-a58b-000c2928f5dd:4'  
        /data/binlog/mysql-bin.000004 
        >/temp/gtid.sql
    set sql_log_bin=0;  # 临时关闭恢复生产时产生的新日志，因为没必要相同的日志，记录两遍
    source /tmp/binlog.sql # 日志恢复命令
    set sql_log_bin=1; # 改回设置
```





# 慢查询日志

## 介绍

```mysql
介绍
	mysql 提供的一种日志记录， 主要用于记录响应时间超过阀值(默认10)的 sql 语句

标准
    执行时间大于 long_query_time 的语句。
    默认(10s)
设置
    默认关闭。
    不是调优， 不要开启，有性能问题
 

```

## 语法

```mysql
-- 查看
SHOW VARIABLES LIKE '%slow_ query_ log%';
-- 开启了慢查询日志只对前数据库生效，sql 重启失效
set global slow_query_log=1



-- 永久开启, 配置后，重启mysql。
修改配置文件 my.cnf
	log_output=file
	slow_query_log=on
	slow_query_log_file = tmp/mysql-slow.log
	log_queries_not_using_indexes=on
	long_query_time = 1	
```



### 查看

```mysql
mysqldumpslow -s c -t 10 /data/mysql/slow.log

# 第三方工具(自己扩展)
https://www.percona.com/downloads/percona-toolkit/LATEST/
yum install perl-DBI perl-DBD-MySQL perl-Time-HiRes perl-IO-Socket-SSL perl-Digest-MD5
toolkit工具包中的命令:
./pt-query-diagest  /data/mysql/slow.log
Anemometer基于pt-query-digest将MySQL慢查询可视化
```



### mysqldumpslow

#### 基础

```java
是mysql提供可以用来分析当前会话中语句执行的资源消耗情况。可以用于SQL的调优的测量
默认情况下，参数处于关闭状态，并保存最近15次的运行结果

```





#### 参数配置

```java
得到返回记录集最多的10个SQL
mysqldumpslow -S r-t 10 /var/lib/mysql/atguigu-slow.log
得到访问次数最多的10个SQL
mysqldumpslow -s C -t 10 /var/lib/mysql/atguigu-slow.log
得到按照时间排序的前10条里面含有左连接的查询语句
mysqldumpslow -s t-t 10 -g "left join" /var/lib/mysql/atguigu-slow.log
另外建议在使用这些命令时结合|和more使用，否则有可能出现爆屏情况
mysqldumpslow -S r -t 10 /var/lib/mysql/atguigu-slow.log| more

    
s:是表示按照何种方式排序:
c:访问次数
|:锁定时间
r:返回记录
t:查询时间
al:平均锁定时间
ar:平均返回记录数
at:平均查询时间
t:即为返回前面多少条的数据:
g:后边搭配。 个正则匹配模式，大小写不敏感的:
    
```

## 使用

```java
1.是否支持， 查看当前 mysql 版本是否支持
    Show variables 1ike 'profiling';
2.开启功能，默认是关闭，使用前需要开启 
    set profil ing=on;
3.运行SQL
4.查看结果，show profiles;
5.诊断SQL, show profile cpu,block io for query上一步前面的问题SQL数字号码;数备注国
6.日常开发需要注意的结论+

```



## 文档分析

```java
converting HEAP to MyISAM查询结果太大，内存都不够用了往磁盘上搬了。
Creating tmp table创建临时表圜
	拷贝数据到临时表
	用完再删除
Copying to tmp table on disk把内存中临时表复制到磁盘，危险! ! !
locked

```

