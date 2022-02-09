
DROP   DATABASE   IF EXISTS `myblog`;
CREATE DATABASE `myblog` default character set utf8;

use `myblog`;
set  FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS  `user`;
CREATE TABLE `user` (
  `id` int(10) PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `createTime` datetime,
  `lastLoginTime` datetime,
  `enabled` boolean NOT NULL
)ENGINE=InnoDB CHARSET=utf8;

insert into user values(1,'wingchi','123000',null,null,true) ;
insert into user values(2,'hk','345612',null,null,true) ;

-- ------------------------------------------------------------COLUMN表-----------------------------
DROP TABLE IF EXISTS  `column`;
CREATE TABLE `column` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` text NOT NULL,
  `author_id` int,
  `summary` varchar(50)
)ENGINE=InnoDB CHARSET=utf8;
insert into `column` values ('1001','Dubbo','1','Duboo简明教程');
insert into `column` values ('1002','Java','1','Java大杂烩');




-- ------------------------------------------------------------文章表-------------------------------------------
DROP TABLE IF EXISTS  `article`;
CREATE TABLE `article` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `html_content` text,
  `md_content` text,
  `author_id` int,
  `publish_time` datetime NOT NULL,
  `last_modify` datetime,
  `summary` varchar(50),
  `column_id` int,
  `state` int NOT NULL DEFAULT 1  COMMENT '0:草稿箱，1:已发表，2：已删除',
   `pv` int(5) NOT NULL DEFAULT 0
)ENGINE=InnoDB auto_increment=5 CHARSET=utf8;

insert into `article` values('1','Dubbo快速入门','NULL','# Dubbo ## 分布式系统RPC(Remote Procedure Call远程过程调用)：不同主机的进程互相通信，它允许程序调用另一个地址空间（通常指共享网络的另一台机器上）的过程或函数，而不用程序员显示编码这个远程调用的细节。影响RPC框架性能的两个关键点： 1. socket的建立 （通信） 2. 对象的序列化和反序列的速度 （序列化） 流动计算架构：基于访问压力的实时管理集群容量调度中心，提高集群利用率\
### dubbo环境搭建 #### 安装zookeeper zookeeper是dubbo推荐使用的注册中心（Registry）。#### 安装dubbo控制台  https://github.com/apache/dubbo-admin 克隆整个git项目（学会看文档） 1. Clone source code on develop branch`git clone https://github.com/apache/dubbo-admin.git`  2. Specify registry address in `dubbo-admin-server/src/main/resources/application.properties` 3. Build\
> - `mvn clean package -Dmaven.test.skip=true`\
> - 这里要跳过测试，否则报错' ,1,'2022-02-06 22:45:20', '2022-02-06 22:45:20','RPC(Remote Procedure Call远程过程调用)： 不同主机的进程互相通信',1001,1,0);

insert into  `article` values('2','java注解','NULL','## JAVA进阶 ### 注解 Java.Annotation JDK5.0 引入 不是程序本身，但可以对程序做出解释，这一点和注释一样可以被其他程序（如：编译器等读取）  格`@注释名`  类、方法、变量、参数和包等都可以被标注。和 Javadoc 不同，Java 标注可以通过反射获取标注内容。在编译器生成类文件时，标注可以被嵌入到字节码中。Java 虚拟机可以保留标注内容，在运行时可以获取到标注内容 。 当然它也支持自定义 Java 标注。 #### 内置注解：- @Override - 检查该方法是否是重写方法。如果发现其父类，或者是引用的接口中并没有该方法时，会报编译错误。- @Deprecated - 标记过时方法。如果使用该方法，会报编译警告。- @SuppressWarnings - 指示编译器去忽略注解中声明的警告。#### 元注解用来负责注解其他注解，meta-annotation； - @Retention - 标识这个注解怎么保存，是只在代码中，还是编入class文件中，或者是在运行时可以通过反射访问。- @Documented - 标记这些注解是否包含在用户文档中。- @Target - 标记这个注解应该是哪种 Java 成员。- @Inherited - 标记这个注解是继承于哪个注解类(默认 注解并没有继承于任何子类)#### 自定义注解使用`@interface`，自动继承了java.lang.annotation.Annotation 接口'
,1,'2022-02-07 15:34:10','2022-02-07 15:34:10','java注解可以做许多事情',1002,1,0) ;

insert into `article` values(3,'Duboo初体验',NULL, '相信有很多小伙伴都知道，dubbo是一个分布式、高性能、透明化的RPC服务框架，提供服务自动注册、自动发现等高效服务治理方案，dubbo的中文文档也是非常全的，中文文档可以参考这里**[dubbo.io](http://dubbo.io/)**。由于官网的介绍比较简洁，我这里打算通过Maven多模块工程再给小伙伴们演示一下用法。\n\n\n![Image 003.png](http://localhost:80/blogimg/20171224/f301f919-f191-4e12-9a19-bce8f82a00f0_Image003.png)\n\n---\n环境：IntelliJ IDEA2017.1\n\n---\n关于如何在IntelliJ IDEA中创建Maven多模块项目，小伙伴们可以参考之前的博客[ IntelliJ IDEA中创建Web聚合项目(Maven多模块项目) ](http://blog.csdn.net/u012702547/article/details/77431765)，这里我就不再赘述。\n这里我还是以dubbo官方文档中的例子作为基准，我们来详细的看看运行过程。\n# 创建一个Maven工程\nIntelliJ中创建Maven工程的方式我这里就不再多说了，这里只说一点，工程创建成功之后，将src目录删除，因为我们不需要在这个工程下面写代码，我们将以这个工程为父工程，然后给它创建多个模块。\n# 向创建好的工程中添加模块\n当我们第一步成功创建了要给Maven工程之后，第二步我们就向这个Maven工程中添加三个模块，分别是common，provider和consumer三个模块，添加完成之后效果如下：\n![这里写图片描述](http://img.blog.csdn.net/20170826153752910?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMjcwMjU0Nw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n\nprovider将作为我们的服务提供者，consumer将作为服务消费者，这两个好理解，除了这两个之外我们还需要要给common模块，common模块主要是提供公共接口，供服务提供者和服务消费者使用。\n\n# 向common模块中添加接口\n\n在common模块中，添加一个SayHello接口，如下：\n\n![这里写图片描述](http://img.blog.csdn.net/20170826154808445?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMjcwMjU0Nw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n\n# provider模块依赖common并提供服务\n\n1.首先打开provider的pom.xml文件，在其中添加依赖，要添加的依赖有如下四个小类：\n>1.添加对common模块的依赖\n>2.添加对spring的依赖\n>3.添加对dubbo的依赖\n>4.添加对zookeeper的依赖\n\n如下：\n\n```\n<dependencies>\n        <dependency>\n            <groupId>org.sang</groupId>\n            <artifactId>common</artifactId>\n            <version>1.0-SNAPSHOT</version>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework</groupId>\n            <artifactId>spring-web</artifactId>\n            <version>4.3.10.RELEASE</version>\n        </dependency>\n        <dependency>\n            <groupId>com.alibaba</groupId>\n            <artifactId>dubbo</artifactId>\n            <version>2.5.3</version>\n            <exclusions>\n                <exclusion>\n                    <groupId>org.springframework</groupId>\n                    <artifactId>spring</artifactId>\n                </exclusion>\n                <exclusion>\n                    <artifactId>netty</artifactId>\n                    <groupId>org.jboss.netty</groupId>\n                </exclusion>\n            </exclusions>\n        </dependency>\n        <dependency>\n            <groupId>org.apache.zookeeper</groupId>\n            <artifactId>zookeeper</artifactId>\n            <version>3.4.10</version>\n        </dependency>\n        <dependency>\n            <groupId>com.101tec</groupId>\n            <artifactId>zkclient</artifactId>\n            <version>0.10</version>\n        </dependency>\n    </dependencies>\n```\n然后在provider中实现common模块的接口，如下：\n```\npublic class SayHelloImpl implements SayHello {\n    public String sayHello(String name) {\n        return \"Hello \"+name;\n    }\n}\n```\n\n然后我们需要在provider的spring配置文件中暴露服务，如下：\n```\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:dubbo=\"http://code.alibabatech.com/schema/dubbo\"\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://code.alibabatech.com/schema/dubbo http://code.alibabatech.com/schema/dubbo/dubbo.xsd\">\n<dubbo:application name=\"hello-world-app\"></dubbo:application>\n    <!--<dubbo:registry address=\"multicast://224.5.6.7:2181\"/>-->\n    <dubbo:registry address=\"zookeeper://192.168.248.128:2181\"/>\n    <dubbo:protocol name=\"dubbo\" port=\"20880\"/>\n    <dubbo:service interface=\"org.sang.SayHello\" ref=\"sayHelloImpl\"/>\n    <bean id=\"sayHelloImpl\" class=\"org.sang.SayHelloImpl\"/>\n</beans>\n```\n\n这里我采用了dubbo推荐的注册中心zookeeper，关于Linux上zookeeper的安装小伙伴们可以参考[Linux上安装Zookeeper以及一些注意事项](http://blog.csdn.net/u012702547/article/details/77569325)。\n注册地址就是你安装zookeeper的服务器地址，然后将服务的接口暴露出来即可。\n\n最后我们采用一个main方法将provider跑起来，如下：\n```\npublic class Main {\n    public static void main(String[] args) throws IOException {\n        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(\"applicationContext.xml\");\n        ctx.start();\n        System.in.read();\n    }\n}\n```\n\nOK,如此之后我们的provider模块就算开发完成了。\n\n# 在consumer模块中消费服务\n\n首先在consumer模块中添加相关依赖，要依赖的东西和provider的依赖一样，这里我就不再重复贴出代码。\n然后我们在consumer的spring配置文件中订阅服务，订阅方式如下：\n```\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:dubbo=\"http://code.alibabatech.com/schema/dubbo\"\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://code.alibabatech.com/schema/dubbo http://code.alibabatech.com/schema/dubbo/dubbo.xsd\">\n    <dubbo:application name=\"consumer-of-helloworld-app\"/>\n    <!--<dubbo:registry address=\"multicast://224.5.6.7:2181\" check=\"false\"/>-->\n    <dubbo:registry address=\"zookeeper://192.168.248.128:2181\" check=\"false\"/>\n    <dubbo:reference id=\"sayHello\" interface=\"org.sang.SayHello\" check=\"false\"/>\n</beans>\n```\n首先订阅地址依然是zookeeper的地址，然后注册一个SayHello的bean，这个bean可以直接在我们的工程中使用。\n一样，我们还是通过一个main方法来启动服务消费端：\n```\npublic class Main {\n    public static void main(String[] args) {\n        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(\"applicationContext.xml\");\n        SayHello sayHello = (SayHello) ctx.getBean(\"sayHello\");\n        String s = sayHello.sayHello(\"张三\");\n        System.out.println(s);\n    }\n}\n```\n运行结果如下：\n![这里写图片描述](http://img.blog.csdn.net/20170826173218470?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMjcwMjU0Nw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n\nOk，至此，一个简单的案例就完成了，有问题欢迎小伙伴留言讨论。\n\n案例下载：[-----------]()（CSDN下载必须设置积分，如果小伙伴们没有积分，留下邮箱我私发你）\n\n参考资料：http://dubbo.io\n\n更多JavaEE资料请关注公众号：\n\n![这里写图片描述](http://img.blog.csdn.net/20170826173440218?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMjcwMjU0Nw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n\n以上。\n\n'
                             ,1,'2022-02-07 15:45:20','2022-02-07 15:45:40','一个简单示例入门dubbo',1001,1,0);

-- ------------------------------------------------------------角色表-------------------------------------------
DROP TABLE IF EXISTS  `role`;
CREATE TABLE `role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(10) NOT NULL
)ENGINE=InnoDB CHARSET=utf8;
insert into role values(1,'visitor');
insert into role values(2,'user');


DROP TABLE IF EXISTS  `user_role`;
CREATE TABLE `user_role` (
  `user_id` int,
  `role_id` int,
  PRIMARY KEY (`user_id`, `role_id`)
)ENGINE=InnoDB CHARSET=utf8;

insert into user_role values(1,1);
insert into user_role values(2,2);

-- ------------------------------------------------------------评论表-------------------------------------------
DROP TABLE IF EXISTS  `comment`;
CREATE TABLE `comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `article_id` int,
  `content` text NOT NULL,
  `createTime` datetime,
  `like` int DEFAULT 0
)ENGINE=InnoDB CHARSET=utf8;


-- ------------------------------------------------------------标签表-------------------------------------------
DROP TABLE IF EXISTS  `tag`;

CREATE TABLE `tag` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
   `author_id` integer NOT NULL

)ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS  `tag_article`;

CREATE TABLE `tag_article` (
  `tag_id` int,
  `article_id` int,
  PRIMARY KEY (`tag_id`, `article_id`)
)ENGINE=InnoDB CHARSET=utf8;

insert into tag values (1001,'Dubbo',1);
insert into tag values (1002,'Java',1);
insert into `tag` values(1003,'并查集','1') ;
insert into `tag` values(NULL,'Golang','1') ;
insert into `tag` values(NULL,'SpringBoot','1') ;
insert into `tag` values(NULL,'数据库','1') ;

insert into tag_article values (1001,'1') ;
insert into tag_article values (1001,'3') ;
insert into tag_article values (1002,'1') ;


ALTER TABLE `column` ADD FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

ALTER TABLE `article` ADD FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

ALTER TABLE `article` ADD FOREIGN KEY (`column_id`) REFERENCES `column` (`id`);

ALTER TABLE `user_role` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_role` ADD FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

ALTER TABLE `tag_article` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

ALTER TABLE `tag_article` ADD FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

ALTER TABLE `tag` ADD FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);