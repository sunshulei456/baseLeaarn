# 安装



## 介质

```java
安装顺序：
    jdk, mysql, redis, nginx[]
    
安装配置
   nacos, governor, nginx, getway, afcenter, bps, workspace

jdk  mysql  redis  nginx getway
     
 EOS_Platform_8.2LA2_Private_Medium_Service.tar.gz{
     nacos, governor, afcenter, bps, workspace
 }

EOS_Platform_8.2LA2_Private_Medium_Application.tar.gz {
    
}
===================

/*
nacos， governor, afcenter， bps, workspace
数据库
	db-scripts
配置文件
	// nacos, mysql, redis, 系统编码
	conf/application.properties
	application-nacos.properties, bootstrap.properties
	conf/workpace/config/user-config.xml

*/



// application
/opt/idc/apps/eos-8.2-app 【
    nacos
    filebeat
    server: {
      afcenter  
      bps  
      gateway 
      governor   
      workspace

    }

】


/*
nacos
数据库
配置文件
	conf/application.properties

*/
```



## nacos

```
数据库脚本
配置
	nacos/conf/application.properties
启动
	nacos/bin/startup.sh -m standalone
	
访问
	nacos (http://127.0.0.1:8848/nacos 账号/密码 nacos/nacos)	
```

## Nginx

```java




/conf/nginx.conf
	include /opt/idc/apps/eos-8.2-app/web/conf/*.conf;
	
	文件路径/opt/idc/apps/eos-8.2-app/web/conf 默认解压路径为/opt/idc/apps/eos-8.2-app 默认解压无需任何文件修改 非默认路径解压需修改以下文件配置
	
验证
开启

```



## Governro -- 系统编码

```java



数据库脚本
	server/governor/db-scripts/mysql,server/governor/app-db-scripts)
配置
	governor/config/application.properties
启动
	server/governor/bin/startup.sh
	
	上图中29898为governor应用端口，31198为nginx代理governor的端口

	访问Governor登录地址(http://127.0.0.1:31198 sysadmin/000000)
	
访问
	nacos (http://127.0.0.1:8848/nacos 账号/密码 nacos/nacos)	
```

## web 不用管理

```
后续新项目完成后，在本地打包完成后，均部署在后端web目录下，通过web/conf/eos8.conf文件实现Nginx代理访问静态资源，配置文件修改完成后，需重启nginx服务。
```

## afcenter

```java




数据库脚本
	server/afcenter/db-scripts，
	执行该目录下afcenter,bfp,eos,lowcode对应目录下的脚本，安装数据库选择对应的目录，
	执行数据库类型目录下的all.sql 数据库名称 afcenter4eos82
配置
	nacos: application-nacos.properties, bootstrap.properties
	//// eos.application.sys-key
	系统编码： web/conf/eos8.conf
	数据库： server/afcenter/config/AFCENTER/config/user-config.xml
启动
	server/afcenter/bin/startup.sh
	
	上nacos验证(http://127.0.0.1:8848/nacos nacos/nacos) 
	
访问
	登录afcenter(http://127.0.0.1 sysadmin/000000)	
```

## BPS

```java

数据库脚本
	server/bps/db-scripts 执行该目录下对应数据类型目录下的all.sql,
配置
	// eos.application.sys-key , 数据库信息
	nacos: application-nacos.properties, bootstrap.properties
	系统编码： web/conf/eos8.conf 
启动
	server/bps/bin/startup.sh
	
	nacos验证 访问Nacos登录地址(http://127.0.0.1:8848/nacos nacos/nacos)
	
访问
	
```

## Gateway

```java

 
配置
	// eos.application.sys-key , redis
	nacos: server/gateway/conf/application-nacos.properties, bootstrap.properties 
        
启动
	server/gateway/bin/startup.sh
	
	访问Nacos登录地址(http://127.0.0.1:8848/nacos nacos/nacos)
	
访问
	
```

## WorkSpace

```java


数据库脚本
	 server/workspace/db-scripts 
配置
	// eos.application.sys-key , 数据库信息
    修改配置文件(server/workspace/conf):
		nacos: application-nacos.properties, bootstrap.properties
		系统编码： web/conf/eos8.conf 
     数据库连接信息
            (server/workspace/conf/workpace/config/user-config.xml)
启动
	server/workspace/bin/startup.sh
	
	nacos验证 访问Nacos登录地址(http://127.0.0.1:8848/nacos nacos/nacos)
    登录验证 访问Workspace登录地址(http://127.0.0.1:31199 sysadmin/000000)选择BPS流程引擎服务及BPS默认租户(首次加载页面需刷新)                        
	
访问
	
```



























































