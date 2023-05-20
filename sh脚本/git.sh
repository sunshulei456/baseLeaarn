#! /bin/bash
# 配置项目的提交人的姓名和邮箱，本地优先级大于全局
git config --local user.name "sunshulei"
git config --local user.email "sunshulei163mail@163.com" 

# 配置回车符号转换
# 	Dos和Windows平台： 使用回车（CR）和换行（LF）两个字符来结束一行，回车+换行(CR+LF)，即“\r\n”；
# 	Mac 和 Linux平台：只使用换行（LF）一个字符来结束一行，即“\n”；
# 	最早Mac每行结尾是回车CR 即'\r'，后mac os x 也投奔了 unix。
# true  提交时转换为LF，检出时转换为CRLF
# false  提交检出均不转换
# input 提交时转换为LF，检出时不转换
# warn 提交包含混合换行符的文件时给出警
git config --local core.autocrlf true

# git是不会提交空文件夹的，所以你想提交空文件夹就需要在空文件内部创建一个占位文件
# 比如 nginx/a.gitignore, 过滤掉 .gitignore 然后就有一个空的文件夹了

