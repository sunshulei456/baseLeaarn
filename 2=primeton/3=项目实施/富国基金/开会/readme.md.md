# 

* # 06-15

```
剑之风情:
ALTER TABLE ft_agent ADD COLUMN `cluster_config_status` SMALLINT DEFAULT 0 COMMENT '代理集群配置状态, 0: 多活, 1:主, 2:备';
ALTER TABLE ft_agent ADD COLUMN `cluster_running_status` SMALLINT DEFAULT 0 COMMENT '代理集群运行状态, 0: 多活, 1:主, 2:备';

剑之风情:
-- ft_sys.type int DEFAULT '1' : 节点类型: 0:主备, 1:多活 

```





# 06-15

```
1. 日历名称， 
1. 被策略关联，不能删除年



调度策略， 传输类型， 会计日： 可以隐藏， 显示发送和接收目录即可
国外的年月日： 顺序和国内不一样， 比如 月，日， 年



接口问题
1. 密码不用加密



===
1. 接口策略： 直接账号密码就行， 能登录就行
2. 接口查询，返回数组，是多个策略， 
3. id 改为名称最好， 


console, server 
	重新部署
agent: 
logCenter: x

```



