# git配置

## == 配置 github

## 单账户配置-ssh

1. 生成秘钥

   ```
   ssh-keygen -t rsa -C "邮箱1" -f ~/.ssh/私钥名称1
   
   
   ssh-keygen: 这是一个用于生成 SSH 密钥对的命令。
   -t rsa: 指定生成的密钥类型为 RSA。
   -C "邮箱1": 在生成的密钥中添加注释，通常为邮箱地址，用于标识密钥的拥有者。
   -f ~/.ssh/私钥名称1: 指定生成的私钥的文件名和路径。~/.ssh/ 表示用户的 SSH 目录，私钥名称1 是私钥的文件名。
   ```

## 多账户配置 - 单个 ssh

1. 生成秘钥

   ```
   所有账户都使用同一对秘钥, 一路回车
   ssh-keygen -t rsa -C "你自己的唯一标识" -f ~/.ssh/私钥名称
   ```

2. 分别添加公钥和私钥

3. 你拉取下来的库中更改

   ```
   ```

   

## 多账户配置 - 多个ssh

1. 假设现在有两个账号，【邮箱1，账号1】，【邮箱2，账号2】

2. 分别给两个账号生成公钥和私钥

   ```java
    /*
    ssh-keygen -t rsa -C "邮箱" -f ~/.ssh/私钥名称
    -C 后跟邮箱账号
    -f 生成的私钥放置路径，注意： 需要是 ~/.ssh 下，
    私钥名称： 随意
    公钥名称： 私钥名称.pub
    */
     ssh-keygen -t rsa -C "邮箱1" -f ~/.ssh/私钥名称1  
     ssh-keygen -t rsa -C "邮箱2" -f ~/.ssh/私钥名称2
         
   进入 ~/.ssh 文件中找到对应的公钥和私钥   
       私钥名称1
       私钥名称1.pub
       私钥名称2
       私钥名称2.pub 
   ```

   

3. 在  ~/.ssh  中创建一个 config 文件，没有后缀

   ```java
   vim config
   =/*
   Host    　　主机别名
   	HostName　　服务器真实地址 === github.com
   	IdentityFile　　私钥文件路径
   	PreferredAuthentications　　认证方式
   	User　　用户名
   	
   git clone git@主机别名：仓库地址	
   
       */
   # 配置user1 
   Host ssl456
   	HostName github.com
   	IdentityFile C:\\Users\\孙书磊\\.ssh\\ssl456
   	PreferredAuthentications publickey
    
   
   # 配置user2
   Host user2.github.com
   	HostName github.com
   	IdentityFile C:\\Users\\lingh\\.ssh\\id_rsa2
   	PreferredAuthentications publickey
    
       
   ```

4. 秘钥添加

   ```bash
   1. 公钥： 直接放到github
   	和单个的 ssh 是一样的
   2. 私钥： 添加到ssh-agent的高速缓存中【重启会失效】
   	ssh-add -K ~/.ssh/996icu_id_rsa‘
   	
   2.1 防止 ssh 重启失效: 自己编写 shell 脚本, 假如开机自启
   	vim .ssh/ssh_add_private_keys.sh
       #! /bin/zsh
       # 添加 github 公钥
       ssh-add ~/.ssh/github_id_rsa
       # 添加 公司 gitlab 公钥
       ssh-add ~/.ssh/996icu_id_rsa
   
       // 赋予sh文件可运行权限
       chmod +x .ssh/ssh_add_private_keys.sh
   	
   	// 添加到自己的开机开机自启中
   	
   2.2
       vim ~/.zshrc
   
       # 添加以下内容，亦可添加多个密钥
       # 将GitHub的ssh密钥添加到ssh-agent
       ssh-add ~/.ssh/id_rsa_github
       # 然后保存退出
   ```

5. 已有项目添加多 ssh

   ```java
   注意：通常情况下我们将本地仓库与git远程仓库进行关联时的地址是ssh访问地址时，类似这种git@git仓库地址:用户名/项目名.git。一定要把这里的git仓库地址替换为ssh config里面设定的Host。
   scss复制代码git remote add origin  git@gitee.com:用户名/项目名.git 
   git remote add origin  git@gitee_two.com:用户名/项目名.git 
   ```

1. 