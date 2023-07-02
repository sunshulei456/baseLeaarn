```
# 方式一
find db-scripts/ -name "all.sql" | grep -i "mysql"

# 方式三
grep "mysql" db-scripts/all.sql | sed 's/^/myall-/'
将查询到的语句前面添加个前缀



# 方式二
找出所有名称为 all.sql 的文件
find / -type d -name "app" -exec find {} -mame "all.sql" \;


find: 命令名，用于在文件系统中搜索文件和目录。
/: 要搜索的起始路径，这里指的是根目录。
-type d: 选项，表示只搜索目录（文件夹）。
-name "app": 选项，表示搜索名为 "app" 的目录。
-exec: 选项，用于执行指定的命令。
find {} -name "all.sql": -exec 后面跟着要执行的命令。在这个命令中，{} 是一个占位符，表示外部的 find 命令找到的每个 "app" 目录的路径。内部的 find 命令将在这个路径下执行，并搜索名为 "all.sql" 的文件。
\;: 命令结束符，表示 -exec 命令的结束。
```

