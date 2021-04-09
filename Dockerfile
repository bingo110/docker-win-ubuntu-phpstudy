FROM ubuntu:14.04
MAINTAINER xiaoyu(977856041@qq.com)

#设置root账户密码，安装ssh服务
RUN echo "root:123456" | chpasswd
RUN apt-get update
RUN apt-get install -y openssh-server wget curl libxml2 xz-utils
ADD sshd_config /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A

#给宿主机开放端口
EXPOSE 20
EXPOSE 21
EXPOSE 22
EXPOSE 80
EXPOSE 8010
EXPOSE 443
EXPOSE 9080
EXPOSE 30000
EXPOSE 30050
CMD ["/usr/sbin/sshd", "-D"]

#安装phpstudy小皮面板
RUN wget -O install.sh https://notdocker.xp.cn/install.sh && bash install.sh

#构建镜像
#docker build -t myubuntu:14 .

#创建容器，挂载本机的D:\home\www目录 到ubuntu的www目录下，D:\home\www 即开发程序的目录，可自行修改成自己电脑的目录,
#docker run -i -t -d --name ubuntu_phpstudy -p 22:22 -p 21:21 -p 80:80 -p 443:443 -p 30000:30000 -p 9080:9080 -p 30050:30050 --privileged=true -v D:\home\www:/www myubuntu:14

#登录容器
#docker exec -it ubuntu_phpstudy /bin/bash

#查看小皮面板状态
#xp 回车根据弹出的提示选择，容器创建好默认是需要手动启动一下的，启动成功后，不出意外根据登陆信息本机就可打开小皮面板
