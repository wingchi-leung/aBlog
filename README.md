### 简介

基于Springboot+thymeleaf+mybaits搭建的个人博客系统，用于个人学习交流。

更新中 

### 技术栈

后端：

- SpringBoot
- SpringSecurity
- Mybatis
- mysql

前端：

- html,js,css
- thymeleaf 
- editor.md

### 架构

数据库表一览
![image-dbtable](https://github.com/wingchi-leung/aBlog/blob/main/assert/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20220210105010.png)


### 项目效果图
前台
![image-20220210102800614](https://github.com/wingchi-leung/aBlog/blob/main/assert/image-20220210102800614.png)

管理后台
![image-20220215110400614](https://raw.githubusercontent.com/wingchi-leung/aBlog/main/assert/a43e5f55953daca4e5f96b5b8c93e67.png)
### 快速运行

1. 克隆项目到本地 
2. 根据本地情况，修改项目中数据库的配置，配置文件位置为`src/main/resources/application.properties`
3. 将resources目录下的blog.sql文件在Mysql数据库中执行。 
4. 配置完后，通过主程序即可启动。 

### 项目信息

本项目前端使用了https://github.com/Kudaompq/Blog-template 提供的模板。在这里表示感谢🙇‍，如有侵权，联系立即删除。

后端设计思路参考了 Vblog项目 https://github.com/lenve/VBlog ，感谢🙇‍

