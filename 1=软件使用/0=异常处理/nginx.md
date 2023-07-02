## nginx: [error] invalid PID number “” in “/run/nginx.pid”

```
方法1：
重新加载配置文件 nginx.conf，然后再执行 reload
[MyHome@MyMachine ~]$ # nginx.conf 可能不在 /etc/nginx/ 下，具体视 nginx 的安装路径而定
[MyHome@MyMachine ~]$ sudo nginx -c /etc/nginx/nginx.conf
[MyHome@MyMachine ~]$ sudo nginx -s reload


方法2：
直接将 nginx 主进程的 PID 写入 "/run/nginx.pid"
[MyHome@MyMachine ~]$ # 下面的命令得到 nginx 主进程的PID：19386
[MyHome@MyMachine ~]$ ps -aux | grep "nginx: master process"
root     19386  0.0  0.0  70060  7308 ?        Ss   15:36   0:00 nginx: master process nginx
[MyHome@MyMachine ~]$ sudo echo 19386 > /run/nginx.pid
[MyHome@MyMachine ~]$ sudo nginx -s reload


杀掉 nginx 的主进程，然后重启 nginx
[MyHome@MyMachine ~]$ sudo killall nginx
[MyHome@MyMachine ~]$ sudo nginx
 
```

