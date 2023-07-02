# 安装java

## 配置环境变量

- 配置环境变量

  ```bash
  vi /etc/profile
  ```

  文件中增加以下内容

  ```bash
  JAVA_HOME=/opt/primeton/java/jdk1.8.0_371
  PATH=$JAVA_HOME/bin:$PATH
  CLASSPATH=$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar
  export PATH JAVA_HOME CLASSPATH
  ```

  配置文件生效

  ```
  source /etc/profile
  ```

  #### 安装验证

- jdk环境验证

  ```bash
  #同windows系统验证一样java-version
  [root@localhost/]#java-version
  openjdkversion"1.8.0_262"
  OpenJDKRuntimeEnvironment(build1.8.0_262-b10)
  OpenJDK64-BitServerVM(build25.262-b10,mixedmode)
  ```





## java 环境查看

````
java -XshowSettings:properties -version


    awt.toolkit = sun.awt.X11.XToolkit
    file.encoding = UTF-8
    file.encoding.pkg = sun.io
    file.separator = /
    java.awt.graphicsenv = sun.awt.X11GraphicsEnvironment
    java.awt.printerjob = sun.print.PSPrinterJob
    java.class.path = .
    java.class.version = 52.0
    java.endorsed.dirs = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-1.el7.x86_64/jre/lib/endorsed
    java.ext.dirs = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-1.el7.x86_64/jre/lib/ext
        /usr/java/packages/lib/ext
    java.home = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-1.el7.x86_64/jre
    java.io.tmpdir = /tmp
    java.library.path = /usr/java/packages/lib/amd64
        /usr/lib64
        /lib64
        /lib
        /usr/lib
    java.runtime.name = OpenJDK Runtime Environment
    java.runtime.version = 1.8.0_262-b10
    java.specification.name = Java Platform API Specification
    java.specification.vendor = Oracle Corporation
    java.specification.version = 1.8
    java.vendor = Oracle Corporation
    java.vendor.url = http://java.oracle.com/
    java.vendor.url.bug = http://bugreport.sun.com/bugreport/
    java.version = 1.8.0_262
    java.vm.info = mixed mode
    java.vm.name = OpenJDK 64-Bit Server VM
    java.vm.specification.name = Java Virtual Machine Specification
    java.vm.specification.vendor = Oracle Corporation
    java.vm.specification.version = 1.8
    java.vm.vendor = Oracle Corporation
    java.vm.version = 25.262-b10
    line.separator = \n
    os.arch = amd64
    os.name = Linux
    os.version = 3.10.0-1160.el7.x86_64
    path.separator = :


````





