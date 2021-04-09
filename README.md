# docker-win-ubuntu-phpstudy
+ 初衷   
 php开发中经常因为windows和linux环境不同，导致奇怪的bug，用vm装linux虚拟机太繁琐，而且很占内存，无意间发现docker很火，也想学一下，研究很久，发现docker可以很方便的安装php+ngnix+mysql环境，可是单独安装php，ngnix，mysql容器比较费时，切换版本的时候也比较麻烦，因为本人之前本地开发环境一直用的phpstudy，发现phpstudy最近也推出了linux版本面板，由于没有时间去单独装一台linux系统，决定试试在docker ubuntu容器里安装一下，果然好使，借助phpstudy可以随意切换服务的版本，多个网站之间也可以单独设置，简直太适合我了。当然这个过程很痛苦，查了好多资料，docker也是初次使用，也许这个方法不是最好的，但是感觉很方便了，换个新电脑只需安装好docker，使用此方法即可快速搭建一套php开发环境

+ 要求  
  可以安装docker的win10 操作系统 
+ 安装步骤
  ```
        #构建镜像，拉取项目后，在根目录下执行下面的命令
        #docker build -t myubuntu:14 .
        
        #创建容器，挂载本机的D:\home\www目录 到ubuntu的www目录下，D:\home\www 即开发程序的目录，可自行修改成自己电脑的目录,
        #docker run -i -t -d --name ubuntu_phpstudy -p 22:22 -p 21:21 -p 80:80 -p 443:443 -p 30000:30000 -p 9080:9080 -p 30050:30050 --privileged=true -v D:\home\www:/www myubuntu:14
        
        #登录容器
        #docker exec -it ubuntu_phpstudy /bin/bash
        
        #查看小皮面板状态
        #xp 回车根据弹出的提示选择，容器创建好默认是需要手动启动一下的，启动成功后，不出意外根据登陆信息本机就可打开小皮面板
  ```
  #效果
  
    ![aa](https://yubinself123.gitee.io/docker-ubuntu-phpstudy/images/1.png)
    ![aa](https://yubinself123.gitee.io/docker-ubuntu-phpstudy/images/2.png)
