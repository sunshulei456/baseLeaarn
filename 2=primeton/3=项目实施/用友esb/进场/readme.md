```
操作系统： centos7.5 1804
数据库：sqlserver 2016   
username: sa
password: primeton000000
url: jdbc:sqlserver://192.168.16.97:1433;SelectMethod=cursor;DatabaseName=esb86_pk
driver-class-name: com.microsoft.sqlserver.jdbc.SQLServerDriver
安装机器：192.168.16.28　账号/密码：root/primeton



```

# 账号解读

```
ESB管理员身份（esbadmin/000000）
系统管理员[用户管理] ：sysesbadmin/000000
	创建账号，
安全管理员 [角色管理]：security/000000
	权限，创建账号
安全审计员 [日志管理]：audit/000000
esbadmin / zgmk@2023
```



# 只读账号

```
访问地址： http://192.168.187.32:8080/
访问账号： [账号：read 密码：zmkg@2023]
 
1. 角色编码规范
	编码： esb-only-read-manager
	名称： esb 只读账号
```





# 编码规范

```

```

