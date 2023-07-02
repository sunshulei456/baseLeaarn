#!/bin/bash


# baseInfo ======================================
# mysql
mysql_dbtype=Mysql
mysql_name='root'
mysql_password='priemton'
mysql_url='jdbc:mysql://127.0.0.1:3306/bft75ga'
mysql_dirver='com.mysql.jdbc.Driver'

agent_dir=""

# baseInfo [end]======================================


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
# ================================================================================


















# 先比较配置文件， 有过有差异则停止执行
# application.properties

old_application.properties
if diff -q a.txt b.txt > /dev/null; then  
    echo "a.txt and b.txt are identical"  
else  
    echo "a.txt and b.txt are different"  
    exit 1  
fi  






 
 
# setup.sh 所在的目录
testHome=$(dirname "$0")
testHome=$(cd $testHome && pwd)
echo ${testHome}






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