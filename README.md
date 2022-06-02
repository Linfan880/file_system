# 基于FastDFS的分布式云盘系统

## 一、系统背景

提供一种高性能、高负载的分布式存储解决方案。分布式存储简单的来说，就是将数据分散存储到多个存储设备(服务器)上。传统的网络存储系统采用集中的存储服务器存放所有数据，存储服务器成为系统性能的瓶颈，也是可靠性和安全性的焦点，不能满足大规模存储应用的需要。分布式网络存储系统采用可扩展的系统结构，利用多台存储服务器分担存储负荷，利用位置服务器定位存储信息，它不但提高了系统的可靠性、可用性和存取效率，还易于扩展。

## 二、技术架构

![system](https://github.com/Linfan880/file_system/tree/master/pic/system.jpg)

**1.基于Nginx反向代理作为轻量级的Web服务器。**

**2.FastCGI作为中间件，处理Nginx的转发的动态请求**。

**3.以FastDFS作为分布式的存储方案。（https://github.com/happyfish100/fastdfs.git）**

**4.以redis作为内存数据库，存储用户token等信息。（项目中采用hiredis的开源框架编写cgi程序）**

**5.采用Mysql数据库存储文件、用户、共享文件等信息。**

**6.前端采用QT作为客户端，前后端采用的通信格式为JSON格式，后端通过C_JSON开源库进行解析，数据处理完毕后相应给前端对应的状态码判断是否请求成功。**

## 三、系统展示

首先后端需要将conf目录下对应的配置写好，比如cfg.json是配置服务器和数据库相关信息的，storage.conf、tracker.conf、client.conf分别对应fastDFS的三大角色，同样需要配置相应的信息，然后可以启动start.sh，该执行程序是分别启动了Nginx、fastDFS、redis以及Mysql，为每一个CGI程序分配对应的端口信息，输出如下：

![start_sh](https://github.com/Linfan880/file_system/tree/master/pic/start_sh.jpg)

紧接着启动Qt前端程序，登录界面如下：

![login](https://github.com/Linfan880/file_system/tree/master/pic/login.jpg)

设置界面需要写入需要连接的主机IP地址和端口号，IP地址需要核对待连主机的IP，可以采用ifconfig查看，端口默认是80，因为所有的请求都会先经过Nginx，而Nginx的默认端口是80：

![setting](https://github.com/Linfan880/file_system/tree/master/pic/setting.jpg)

成功登录后可以进入主界面，主界面首先会显示自己已经上传的文件信息，都会存储到后端的fastDFS中，也可以对某一个文件下载到本地（此处没有上传很多文件，虚拟机快没空间了……）：

![upload](https://github.com/Linfan880/file_system/tree/master/pic/upload.jpg)

同时也可以对文件进行共享，右击文件的属性，可以看到共享字段，点击即可，然后可以在共享列表中查看到刚才分享的文件：

![share](https://github.com/Linfan880/file_system/tree/master/pic/share.jpg)
