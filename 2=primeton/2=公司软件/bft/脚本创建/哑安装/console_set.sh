#!/bin/bash

/*
上传准备： 文件夹层次
btf7.5
	数据库驱动.jar
	primeton-installer-xxx.tar
	Primeton_BFT_xxx_Console.tar

	-- 安装文件夹
	installer


*/

# ls | grep -i primeton-installer
# ls | grep -i Console.tar
installer_name='';
console_name='';
db_driver_name=''


installer_dir
installer_


mkdir install_dir
tar -xvf installer_name -C install_dir

# 放驱动
cp db_driver_name installer_dir/drivers


# 移动配置文件
cp install_dir/configs/consoleConfig/application.yml install_dir/config
cp install_dir/configs/consoleConfig/install.properties install_dir/config


# 修改配置文件  install.properties”



# 启动install

# 启动成功标志



# 启动consoleS

# 启动成功标志