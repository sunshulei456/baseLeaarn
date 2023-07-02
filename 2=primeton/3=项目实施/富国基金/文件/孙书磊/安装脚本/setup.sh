#!/bin/bash

# baseInfo
# mysql
mysql_dbtype=Mysql
mysql_name='root'
mysql_password='priemton'
mysql_url='jdbc:mysql://127.0.0.1:3306/bft75ga'
mysql_dirver='com.mysql.jdbc.Driver'
 
 
# setup.sh 所在的目录
testHome=$(dirname "$0")
testHome=$(cd $testHome && pwd)
echo ${testHome}




# 数据库初始化================================================================================
/*
：mysql的例子
btfconsole/dbscripts   
执行脚本：
	mysql -h 127.0.0.1 -P 3306 -u root -pprimeton afcenter4eos82 < all.sql


0.bftconsole_drop_mysql.sql	删除原表脚本
1.bftconsole_create_mysql.sql	初始化BFT相应表脚本
2.bftconsole_upgrade.sql	向BFT相应表中初始化数据
3.coframe-table-mysql.sql	创建Conframe脚本
4.coframe-data-mysql.sql	写入Conframe数据脚本
*/

mysql_sql_setup = (
	bftconsole_drop_mysql.sql
	bftconsole_create_mysql.sql
	bftconsole_upgrade.sql
	coframe-table-mysql.sql
	coframe-data-mysql.sql
)

exe_mysq=mysql_sql_setup
for ((i=0; index le ${#exe_mysq[@]}; i++))
do
    mysql -h 127.0.0.1 -P 3306 -u root -pprimeton afcenter4eos82 < ${exe_mysq[i]}
done
#================================================================================


# =========================== 
# bftconsole 安装目录, 
console_dir=''
application.properties_path=''
# 数据库驱动, libs

# 配置文件 application.properties
/*

spring.jpa.database=mysql
---- 数据库方言，详情参考安装须知
---- 如果BFT Console安装成功启动一次后，再需要修改数据库时，需要修改“/root/BFT7.5LA/conf/application.properties”下的数据库连接。
spring.jpa.hibernate.ddl-auto=none
spring.jpa.database-platform=org.hibernate.dialect.MySQL5InnoDBDialect

spring.datasource.username=root
spring.datasource.password={3DES}PTYuw43evG6J3SolWKSyDvo=
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/bft75ga
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
 

console_org_config=(
	'^spring.datasource.username=.*'
	'^spring.datasource.password=.*'
	'spring.datasource.url=jdbc:mysql:.*'
	'spring.datasource.driver-class-name=.*'
)

console_used_config=(
	'^spring.datasource.username=${mysql_name}'
	'^spring.datasource.password=${mysql_password}'
	'spring.datasource.url=${mysql_url}'
	'spring.datasource.driver-class-name=${mysql_dirver}'
)


*/

console_config_size=${#console_org_config[@]}
for ((index=0; index le console_config_size; index++ ))
do
	echo "测试sed:  "
	sed -i 's/${console_org_config[index]}/${console_used_config[index]\r/' ${application.properties_path}
done


# console 启动
nohup ./startBFTConsole.sh &
# 启动成功查看 
tail -f nohup.out


# ===============
# bft-server 安装
# 数据库驱动配置
# 配置文件 bft-server-config.xml
/*

----数据库

  
  <dbconfig>
    <dbtype>Mysql</dbtype>
    <driver>com.mysql.jdbc.Driver</driver>
    <connectionurl>jdbc:mysql://127.0.0.1:3306/bft70ga</connectionurl>
    <user>root</user>
    <password>{3DES}PTYuw43evG6J3SolWKSyDvo=</password>
  </dbconfig>
  
  
    
  <dbconfig>
    <dbtype>Mysql</dbtype>
    <driver>${mysql_dirver}</driver>
    <connectionurl>${mysql_url}</connectionurl>
    <user>${mysql_name}</user>
    <password>${mysql_password}</password>
  </dbconfig>
  
  ----c3p0的参数
  
  
  ip Server服务器ip，Netty通信ip,即与BFTAgent通信ip
  port  Server Netty通信端口,即与BFTAgent通信端口
  <nettyconfig>
    <ip>127.0.0.1</ip>
    <port>8091</port>
    <reConnectTime>5</reConnectTime>
  </nettyconfig>
  
  
  host  Server服务器ip，与BFTConsolejmx通信ip
  port  Server服务器jmx端口，与BFTConsolejmx通信端口
  <jmxconfig>
    <host>127.0.0.1</host>
    <port>6210</port>
  </jmxconfig> 
  
  ---
  
*/

server_config_old




# ===server 启动
nohup ./startBFTServer.sh &

# -- 启动成功查看
tail -f nohup.out


#==== agent 配置
# bftagent/config/ bft-agent-config.xml
/*
  <agent>
    <name>DefaultAgent</name>  代理服务器名称
    <password>{3DES}9xLFZLEqToTxIzJJvts1SlTzAJvh5kNPqA==</password> 代理服务器密码
    <ip>127.0.0.1</ip>   BFT Server服务器ip地址
    <!-- file transfer port-->   BFT Agent接收文件监听端口
    <receiveport>7081</receiveport>
    <!-- Agent version -->
    <version>7.5.0.0</version>
    <!-- Agent Http internet port --> HTTP端口
    <httpPort>8183</httpPort>
  </agent>
  
  <servers>
    <server>127.0.0.1:9091</server>  BFT Server服务器IP地址及端口
    <reConnectTime>60</reConnectTime>
  </servers>

  <client>
    <!-- Enable communication with client -->
    <clientstart>false</clientstart>
    <clientpoolsize>10</clientpoolsize>
    <clientsocketport>8666</clientsocketport>  客户端文件传输监听端口
  </client>

*/






