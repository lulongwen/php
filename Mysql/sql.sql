# 数据库建表思路

    ```
    // 1 进入 mysql
    mysql -u root -p

    // 2 创建数据库
    create database dbName character set utf8 collate utf8_general_ci;

    // 3 使用这个数据库
    use message;


    // 4 创建表
    create table message_info(
        id int auto_increment comment 'id',
        title varchar(90) not null comment '标题',
        content text not null comment '内容',
        addtime varchar(30) not null comment '添加时间',
        primary key(id)
    ) charset= utf8;

    // 5 查看数据库所有的表
    show tables;

    // 查看表的结构
    desc tablesName;
        - desc message_info; // 查看 message_info表的结构
    ```

// 更改为第一列
alter table `employee` change `id` `id` int unsigned first;

// 字段后面插入
alter table `employee` change `name` `name` varchar(32) not null comment '名字' after id;

// 自增长 id
alter table `employee` change `id`  `id` int unsigned auto_increment primary key;



## 命令行链接 mysql
- 先创建数据库，在创建表
    ```
    mysql -h主机名 -u用户名 -p端口 密码

    mysql -u root -p
        mysql 是一个指令
        -h 你要链接到那个主机上的mysql，默认就是本地 localhost，
          + 一般不允许其它的客户端链接到我们的 mysql
        -u 用户
        -p 端口，表示mysql 的端口，默认 3306

     // 直接写密码，密码和p之间不要有空格
     mysql -h localhost -u root -p123456

    ```



## 创建数据库
- 开发中，数据库的命令要大写
- 结束要加分号，分号代表结束创建
- 数据库不区分大小写

    ```
    create database db_name;

    //1 创建一个 db1的数据库
    create database db1;

    //2 创建一个使用utf-8字符集的 db2 数据库
    create database db2 character set utf8;

    //3 创建一个使用 utf-8 字符集，并带校对规则 utf8_general_ci 的 db3数据库
        - 校对规则可以理解为 排序规则，默认使用是的 utf8_general_ci

    create database db3 character set utf8 collate utf8_general_ci;
    ```

## 操作数据库

    ```
    // 查看当前所有数据库
    show databases;


    // 查看数据库创建的语法
    show create database db_name;


    // 删除数据库
    drop databse db_name;
        drop database db1;
    ```


## 创建表
- 创建表之前，要选择数据库
    + use db_name;

    ```
    // 使用哪个数据库，使用use db_name;  指定我要在哪个数据库中创建表
    use db_name;


    // 修改表的字段名
    alter tabl table_name change 旧字段名 新字段名 新数据类型;
        alter table employee change brithday birthday date;

    // 追加字段
    alter table table_name add 列名称 int not null comment '注释说明';


    1：删除列
    alter table 【表名字】 drop 【列名称】

    2：增加列
    alter table 【表名字】 add 【列名称】 INT NOT NULL  COMMENT '注释说明'

    3：修改列的类型信息
    alter table 【表名字】 change 【列名称】【新列名称（这里可以用和原来列同名即可）】 BIGINT NOT NULL  COMMENT '注释说明'

    4：重命名列
    alter table 【表名字】 change 【列名称】【新列名称】 BIGINT NOT NULL  COMMENT '注释说明'

    5：重命名表
    alter table 【表名字】 RENAME 【表新名字】

    6：删除表中主键
    alter table 【表名字】 drop primary key

    7：添加主键
    alter table sj_resource_charges ADD CONSTRAINT PK_SJ_RESOURCE_CHARGES PRIMARY KEY (resid,resfromid)

    8：添加索引
    alter table sj_resource_charges add index INDEX_NAME (name);

    9: 添加唯一限制条件索引
    alter table sj_resource_charges add unique emp_name2(cardnumber);

    10: 删除索引
    alter table tablename drop index emp_name;
    ```

## insert into 增加数据 添加数据
    ```
     // 创建表
     create table table_name(field1 datatype, field2 datatype) character set 字符集 collate 校对规则 engine 存储引擎
        - filed 指定字段 ， 列
        - datatype 指定字段的类型
     create table db2(id int, salary decimal(4, 2),)；


     // desc table_name; 查看表的各个字段信息
     desc table_name;
        desc employee;


     // 设置 编码一致
     set names gbk;


     // 表中插入数据，保证前面的字段和后面添加的 values 对应
     insert into tables_name() values();


     // 全部添加，可以省略前面的字段的列表
     insert into tables_name values();


     // 部分添加，不能省略前面的字段，前面的字段要和后面的 values() 对应
     insert into tables_name(id, name, sex) values('2', 'Lily', '女');

    ```


## update 更新数据 修改数据
- 更新数据一般都带限制条件 where，不带 where条件的将修改整个表的字段，这种需求很少

    ```
     update tables_name set key = value, key1 = value1  where条件;

     // 如果不写update的 where条件，表的所有记录都修改
     update employee set salary=5000;

     // where 条件
     update employee set salary=12000 where name='安海音';

     // 修改多个字段
     update employee set salary=15000, job='friend' where name='安海音';
    ```


## select 查询数据
-

    ```
    // 查询表的所有字段
    select * from table_name;

    // 查询单个字段
    select 字段1, 字段2, 字段3 from table_name;


    // 分页，select * from table_name limit 偏移量, 显示的数量;
    // 查询3条数据
    select * from table_name limit 0, 3;

    ```



## delete from 删除数据
- delete 如果没有 where条件，会删除整个表的数据
- delete 删除之后，表仍然存在，drop table 将删除表

- truncate 不能带 where条件，因此建议使用 delete
    + truncate 没有返回值，执行速度快
    + delete 有返回值

    ```
    //
    delete from table_name  where条件;
        delete from employee where name='Lucy'；
    ```


/*
接口编程
    接口可以体现多态
    我们定义一个接口后，这个接口可以接受实现了这个接口的任何一个类的对象实例


    1. 这个东西是什么？ 先解释清除，然后怎么用
    2. 如何使用？


先解释什么是继承？ 什么是接口？ 再说实现形式上的区别

继承是 一个子类可以把一个父类的 public方法和属性， protacted 属性和方法 继承下来，可以直接使用。

实现接口是：我们把一个方法封装在一个抽象接口里面，当我们要用的时候，我们将其实现
区别：
    集成一个类，不需要去实现，继承下来可以直接使用
    实现一个接口要自己重写一把


    内置标准类
    traits

    只听不练，是学不到真功夫的


# mysl 链接数据库
```
mysql -u root -p
  root 密码

  select version(); 查看版本
  select @@version; 
```

## 显示数据库
```
show databases; 显示所有的数据库

use mysql; 使用数据库
show tables; 显示表名

```













    
cmd> mysql -u 用户名 -p 密码 -H 主机名 -P 端口
    mysql -u root -p  // root 用户名

    -H 主机名 默认localhost
    -P 端口 默认 3306 如果不是 3306 要写出来


sql语句发送给 DBMS



mysql的重要点
    mysql 最重要的是 sql语句
    mysql的管理
        让用户看到某些表

        数据库说到底也是文件，所有数据都是文件

        drop 删除表结构
        delete 删除数据

        select语句 重点
            多表，7表联查
            表和表之间的关系

    库 下面是 表
    database
        table


一行就是一条记录 row

    [] 号内的内容是可选的，可写，可不写
    sql语句关键字大写，但不是必须的，规范推荐
    ` ` 反引号，避免关键字

    drop table use1; // 删除 use1的表
*/


# 创建数据库
    create database db_name;

# 创建一个DB1的数据库
    CREATE DATABASE `db1`;

# 创建一个 utf8字符集的db2 数据库
    CREATE DATABASE `db2` character set utf8;

# 创建要给utf8字符集，并带校对规则的 mydb3数据库
    CREATE DATABASE `db3` character set utf8 collate utf8_general_ci;

    CREATE DATABASE `db3`
        character set utf8  // 设置字符集
        collate utf8_general_ci; // 校验规则，不区分大小写  utf8_bin 区分大小写
                                                ascii 码排序


show character set; // 显示字符集

show collation; // 显示 校验规则

select * from `user` where id="qq";

select * from `user` order by `name`;


显示数据库
    show databases;

显示数据库创建语句
    show create database db_name;

删除数据库
    drop database if exists db_name;

# 修改字符集
alter database `dn_name` character=utf8mb4;

alter database `db_name` charset=lartin1 collate=utf8mb4; # 也是对的

# 修改校验规则
alter database `db_name` collate utf8_general_ci;



set names gbk; # 是针对 cmd界面的字符集设置的，仿制出现乱码



# 单库的备份和还原
    mysqldump -u root -p `db_name` > d:/db_name.bak;

# 恢复单个数据库
#1. 先创建一个新的数据库 空库
    create database `db_name`;
#2. use 表
    use `db_name`;
#3. 执行恢复指令
    source `备份文件的绝对路径`;




/*

# 查看多少人链接数据库，数据库的并发量，查看非法用户登录
    show processlist;

netstat -anb more;

    ps -aux; 查看pid




table 表示学习mysql 的重点

创建表的基本语法

create table table_name(
    field1 datatype,
    field1 datatype,
)character set 字符集 collate 校对规则 engine 存储引擎

推荐使用下划线命名，次选 驼峰命名法

    desc ecs_goods; 查看表的字段


create table `user`(
    id int not null default 0 comment 'id',
    name varchar(32) not null default '' comment '名字',
    password char(32) not null default '' comment '密码',
    birthday date comment '生日'
)charset=utf8 collate=utf8_general_ci engine=myISAM;

signed 默认有符号
unsigned 无符号

zerofill 0 填充
    默认 10
        int(10)

create table `test`(
    num int,
    num2 int(4) zerofill,
    num3 int(3) unsigned zerofill
)

 bit 位类型
    bit全部都是无符号的 unsigned


    有符号 和 
    无符号的区别





接口编程
API
  前端和后端数据的传递
  数据的一种传递和处理
  

接口
  数据的一种类型
  接口体现出多态
    当用语言表达不清楚，就用例子说明，比如 ** 就是多态

接口怎么实现多态
  我们定义了一个接口，那么这个接口可以接收实现了这个接口的任何一个类的对象实例


继承类和接口实现区别
  继承类是一个子类可以把父类的 pubic 和 protact方法和属性继承下来
  接口，把一个抽象方法封装在一个方法里，当我们要用的时候，我们将其实现

  继承 可以直接使用，
  实现接口就要重新写一把

先解释什么是继承，然后说什么是接口，再说实现形式的区别

1 简单的介绍一下是什么
2 使用的注意事项
    特点，经验
  回答个1,2,3
  1
  2
  3




final防止一个方法被重写


PHP 内置标准类
  PHP系统自己定义的类 STD class Standard Class

对象的序列化和反序列化
  会调用 weekup
  达到多个文件共享一个对象

traits
  需要的时候， use 进来

反射技术 new ReflectionClass()
  用在 写底层的框架
    管理大量未知的类
    对类的功能的扩展



mysql数据类型

数值类型
  bit
  tinyint
  int
  float
  decimal


zerofill
bit
float
decimal



整型 Integer
  保存整数的数据类型
  以下数值是逐渐变大的
  bit  1 - 64
  tinyint   1个字节
  smallint  2个字节
  mediumint 3个字节
  int       4个字节
  bigint    8个字节


  整型分2种
    有符号的 signed 默认 负数
    无符号的 unsigned  正数

    字段名 整型类型 unsigned 无符号
    字段名 整形类型 有符号

  表的字段要选择合理，否则会导致表会很大

zerofill 0填充
  位数不够，左边使用 0 进行填充
  int(4) 
    4 不是最大是4位数，而是最小是4位
    是一个 0 填充的宽度

  zerofill 自动把有符号的变成无符号的数，unsigned
  默认填充 10 位
    0000000001


bit 位类型
  0 和 1



float double 是有符号的
一个字节的有符号范围是  -128 ~ 127
一个字节的无符号范围是 0 ~ 255 


float(4,2)
decimal(4,2) 
  精度不一样，
  默认值不一样
    float精度 7位，多出的会舍去，修改为 0000
      float 保存 成绩
    decimal 精度 30位

      MD
      M是位数
      D是小数点后的精度


decimal(4,2) 
  超出可以加进去，会自动四舍五入
  四舍五入越界，就报错

  decimal的精度大于 float
  精度很高的数据要用 decimal
  默认值
  decimal(10, 0)
  最大值
  decimal(65, 30)


二进制
  0 1
十进制
  0 1 2 3 4 5 6 7 8 9
十六进制
  0 1 2 3 4 5 6 7 8 9 a b c d e f

八进制
  2的3次方
  2³

16进制
  2的4次方
  2²
  2ⁿ-1

  2^7 -1 
  2的七次方减 1

三点一刻的时针和分针的角度
  1小时的角度是：360/12=30度
  15分钟是把1小时的度数4等分：也就是：30/4=7.5度

  任何数的0次方都是1，0的0次方当然是1

  // 查看表的创建信息
  show create table ec_goods;

  关系型数据库
  非关系型数据库
  结构数据库
  时序数据库等将得到越来越广泛的应用，在不远的将来，以云为基础的云数据库将越来越多的影响人们的生活

  myisam 插入，查询速度快，不支持事务
  innoDB 支持事务，默认引擎

  mysql 字段类型，括号数字的含义

  latin 只能存放数字和字母
  utf8mb4 占用4个字节
  utf8占用3个字节


字符串
  char
  varchar
  text

  char 是字符数量，和字符编码没关系


  varchar 要预留3个字节
    65535 是字节数量，和字符编码有关系
    (65535-3)/3
    (65535-3)/4 可以存放的字符

  char(n) 固定长度
  varchar(n) 可变长度

  微博，轮论坛回帖，个人介绍，博客文章用 varchar
  固定长度，比如 邮编，身份证号码，手机号，电话号码
    md5的密码用 char

  查询速度
  char > varchar

  varchar 保留空格
  char 清除空格


  text 可以视为 varchar
    不用指定大小，不能有默认值

    create table `db100`(
      content text not null
    )charset=utf8mb4 engine=myisam;

  表的所有字段加起来不能大于 65535个字节，否则创建失败
  解决方法
  用 text 代替 varchar
    数据库存放最多的还是字符串

    字段类型不一致会报错
    会有隐式转换，比如 字符串数字转 数字


日期类型
  date
  datetime
  timestamp

  date 给予时分秒会自动舍去
  datetime timestamp
    没给时分秒会自动加上 00:00:00

  timestamp 在 insert 和 update是如果没给值
    会自动填充当前的日期

  字符串和日期要用 单引号引起来



emnu & set
  
  insert into `votes` values(2, 'apple, bolo', 2);

  查找 喜欢吃苹果的
  select * from votes where find_in_set('apple', hobby);

  返回apple 在 hobboy的第几个位置，如果没有就返回 0
  select find_in_set('apple', hobby);


  性别 一般用 枚举 emnu
    salary decimal(12, 2)

    latin1


修改表
alter table
  add 添加字段，add 后面加个空格
  modify 修改列 字段
  change 修改列名
  drop 删除列 字段


delete from 删除表的一行

CRUD 增删改查
  create
  read
  update
  delete


  白盒测试
    用代码测试代码

  黑盒测试
    走流程，点击页面按钮

  电商项目30多张表

  MVC 
    所有的请求都要经过 控制器 *Action.php

<?php 
// 假定数据库用户名：root，密码：123456，数据库：RUNOOB 
$con=mysqli_connect("localhost","root","123456","RUNOOB"); 
if (mysqli_connect_errno($con)) 
{ 
    echo "连接 MySQL 失败: " . mysqli_connect_error(); 
} 
 
// ...查询 "RUNOOB" 数据库的一些 PHP 代码...
 
// 修改数据库为 "test"
mysqli_select_db($con,"test");
 
// ...查询 "test" 数据库的一些 PHP 代码...
 
mysqli_close($con);
?>


作业
1 备份/恢复数据库
2 CRUD
3 SELECT

修改表 
  add
  modify
  delete



聚合函数
  聚合函数字段相加，一定要考虑空值 null

  count(*) 总数
  count(列名)

  select count(*) from `tb_name` where 
  select count(*) as total from `tb_name`;

  select count(*) AS total, (math+chinese+english) AS 'score'
    from `stduent`
    where (math+chinese+english) > 250;


count 细节
  count(*) & count(列名)的区别
    count(*) 不会忽略 null空值
    count(列名) 忽略空值

  sum() 求和
    多列组合会忽略空值，解决方法 ifnull
    单列统计不报错，隐式添加了 ifnull(value, 0.0)



    avg() 平均值
    max() 最大值
    min() 最小值

    group by 分组
      需要过滤子句 配合 having

    1 先要完成分组
    2 二是过滤分组的数据

    select max(sal), min(sal), deptno, job
    form employee
    group by depto, job;

    显示部门平均工资低于 2000的部门号和它的平均工资
    select avg(sal) AS myavg, depto
      from employee
      group by depto
      having myavg < 2000;




日期函数
  current_date()
  current_time()
  current_timestamp()
  now()


数学函数
  ceiling()
  floor()
  mod() 求余数
  round() 四舍五入
  rand() 随机数
  format() 格式化数字


  只要是有值的，都是表达式；几乎所写的任何东西都是一个表达式


分支控制 case else end

mysql高级 存储过程

  distinct


  多表查询得到一个笛卡尔集
  笛卡尔集

  自连接
    在一张表内查询
  子查询
    select语句可以产生一个临时表

  SQL要大量的练习

var i = 0;
  do{
    document.write("泰牛程序员<br>");
    i++;
  }
  while (i < 10);

  
  while(i < 10)
  {
    document.write("泰牛程序员<br>");
    //有一个对i变化的处理
    i++;
  }


## 网站的瓶颈
1. 网站的带宽
2. 数据库
    - 数据库的原则：能不链，就不要连接数据库，因为数据库链接是最吃力的
    - 缓存产品， redis， memerycache，读写分离，静态化，为啥这么做呢？
    - 阻止 clone， 继承
    
    self:: 是类的范畴
    $this 是对象的范畴






- PHP必须知道的300个问题
- PHP开发老韩总结.docx
- PHP学习英语词汇表.docx
- 授课思路规范会.xlsx

- php .dll 动态文件编写
    + 封装私有函数，不让别人看到代码
    + .dll 文件反编译


## mysql扩展知识
- insert , update, delete 返回 true 和 false
    + select 返回资源集的结果 $res->fetch_assoc();

- float 只能精确到小数点后面 7位
- decimal 精度更高

- char 按字符计算
- varchar 按字节计算

- 关联数组的好处，数据库改变，数据还是一样，不会影响返回的结果
    + $mysqli->query(sql)->fetch_assoc();

- mysql联表查询
    + 查询多张表找一条数据
    
- 分表，分区，sql优化
    
    
### 什么是读写分离？
- 将读的操作和写的操作分开处理，就是读写分离 // 是什么？
- 在项目开发中，我们要注意这几个地方： // 使用时要注意什么？
    + 我在做项目的时候，我就发现这几个问题是比较严谨的：
    + 在写的时候，如果数据量过大，光靠读写分离是不管用的，
    + 还得用分表，分区来进行辅助，还要建立索引
    + 甚至还得对有些变量进行缓存


### mysql错误
- new Mysqli() 时的错误，是 Mysql数据库返回的错误，不是PHP返回的错误


# 如何选择编程语言
1. 学习成本
2. 项目的开发速度
3. 编程语言的生态圈
  1. 框架
    1. 文档资源
    2. 视频资源
  2. 社区的活跃度
4. 维护成本
5. 招人成本

---


## 创业公司开发的原则  
  用最少的人力，最少的时间开发网站，
  并且后期维护和持续升级，乃至重写的时候，代价最小。

  互联网领域第一大动态语言是PHP，第二第三分别是ASP和Java。
  在中小型互联网应用当中，PHP的王者地位不容动摇，
  在大型应用当中，Java是目前主流的选择，特别是电子商务类型的应用，例如阿里巴巴就从早期的PHP转变到Java，从前的eachnet也是如此。

  PHP 做一个稍微大一点的系统，代码就很容易失控
  从技术上来讲，PHP门槛低，易部署，普及率高，好招人，实在是互联网时代的VB，打不死的小强。

  造成这样局面的原因：
  1．中小型互联网网站强调开发速度，维护成本，以及入门快速和部署成本，PHP是最合适的选择；
    用Java则显得过于笨拙，开发慢，维护成本高，入门周期长，部署麻烦；
    RoR开发速度最快，维护成本最低，但是RoR入门速度没有PHP快，部署成本比PHP高。
    因此中小型互联网网站主流还是PHP，但RoR能够占据一定的份额。

  2．大中型互联网站强调稳定性，性能，大规模代码的组织能力，
    而开发效率则退居次要地位，有些应用如电子商务对事务有很高的要求，显然Java是最合适的选择；
    PHP的代码组织能力最差，RoR次之。

  在互联网领域，Java从来就不是主流，并且Java的适用领域和RoR不太重合。
  我们甚至可以这样说，RoR现在在互联网领域取代的是那些原本不适合用Java，但是被错误的选择了Java的项目



仅次于CSDN的第二大软件行业专业网站。
## 网站的三个阶段
  1 从无到有刚开始做一个网站或者一个产品，要非常聚焦，没有旁的多余功能，
  只有一个做的极其牛X的核心功能，牛X到别人没有办法模仿你，于是网站开始崭露头角；

  2 等核心功能成功以后，网站开始声名鹊起，
  为了扩展用户规模，产品开始多元化，各种各样时髦功能，各种各样用户要求的功能纷纷上马，于是用户规模开始快速扩张；

  3 等用户规模已经起来之后，开始聚焦商业目标，
  于是删繁就简，开始砍掉与商业目标不符合的枝节功能，加强和商业目标符合的核心功能，网站进入健康的商业循环；

  大部分网站都可以做到第一个阶段，但其中大部分都会倒在第二个阶段，
  而迈过第二阶段能够做到第三个阶段的就凤毛麟角了。
  到了第三个阶段，一个产品才真正开始成熟起来，才具有顽强的生命力，
  在IT垂直领域里面，JavaEye处于第二个阶段，需要向第三个阶段转变。



Yii
性能，速度，安全，可扩展性方面

yii2:

    优点：gii蛮不错的，简化了开发流程，可以生成绝大数的代码，开发后台等效率还是蛮高的

    缺点：前后端完全的分离的趋势下，yii2前后端的耦合的还是有些重了

    对于框架的选择要看具体的情况而定吧。我觉得作为一个优秀的程序员，最核心的地方在于解决问题的能力，框架只是一个辅助吧，核心在于架构。所以框架的选择适合具体情况就行，你选择了哪个，哪个就是你的未来。

    laravel版本频繁
yii稳定

就开发速度,laravlel5 和yii 差太远了.
不同的公司不同的情况，但是开发效率还是性能，哪个为主
yii2完爆laravel。就代码审查方面，把yii和laravel都放到phpstorm中 laravel还是有个别警告的，而yii几乎没有。这就意味着ide都能识别得了整个系统的来龙去脉。所以使用者更加容易知道 用的类和方法从来里来的，在哪里用过多少次。 极大的方便了后期的维护refacter。

yii2不说别的，目录结构就不如laravel清晰
如果想要高性能，yii+workerman、yii+swoole性能翻10倍。
Yii2完成一个电商+ERP的项目， Yii2的开发效率非常之高，尤其是ActiveRecord，代码也足够稳定。只不过没用它的模板部分。

架为你屏蔽了大量细节,让你对 sql注入,xss, csrf,设置cookie和session统统不用了解和关心的情况下,写出看上去还算优雅的代码.但优雅,总归是要付出代价的,占内存,运行慢这些对个人而言都不算太大问题,毕竟买单的是企业.可是,长期的只知其然,不知其所以然,即便是之其所以然,由于实践较少,离开框架写代码的时候,也是举步维艰,bug百出,各种低级错误都可能犯.很多时候,认识一个框架的最好最深刻的方法,不用用它写大量优雅的代码,而是通过面对相同的问题,思考个人实践方案和框架的思路的区别和优劣.正所谓不识庐山真面目,只缘身在此山中.


1.Yii Gii，非常好用，一些相似的代码可以自动生成，关键是生成这些样例代码之后，其他开发人员会默认遵循这种风格，保持风格的统一性，而laravel比较灵活，团队人多代码风格相对难控制一些。2.Yii的源码可读性好，laravel的facade模式让阅读vendor下的源代码有点坑。Phpstorm配合Yii开发速度强Laravel不少，而laravel不少类是无法跳转阅读源码的3.运行速度比laravel快4.Active Record非常好用，比laravel的Eloquent强，特别是Gii 生成的model有注释，可以在Phpstorm下自动提示，可以避免很多小错误，后来我自己写了个laravel model生成器

1.laravel社区比较活跃，资源比较丰富，一些第三方的工具都有封装，比如支付等，Yii因为人少，稍微偏门一点的就少2.终端控制台略强一点，自带queue，Kernel中的cron调度比较好用，每次上线不用再去改crontab。3.路由比较灵活，但是一方面如果不制定规范，查问题的时候先要去routes文件中看看对应关系，有利有弊

1.laravel社区比较活跃，资源比较丰富，一些第三方的工具都有封装，比如支付等，Yii因为人少，稍微偏门一点的就少2.终端控制台略强一点，自带queue，Kernel中的cron调度比较好用，每次上线不用再去改crontab。3.路由比较灵活，但是一方面如果不制定规范，查问题的时候先要去routes文件中看看对应关系，有利有弊

性能，速度， 安全性及扩展性 ，这些都是yii的强项，laravel的强项是理念先进。yii本身也借鉴了很多laravel的理念，如ActiveRecord，当然，这点laravel本身也是借鉴了Ruby on rails.yii唯一的‘’缺点‘’就是有点重，不轻量，不过他本身就是重量级框架。纠正一个错误，yii的ar特性借鉴的是rails。

，Yii2的卖点就是开箱即用，灵活扩展和易用性。这样而言，不能说Laravel4的开发效率就慢，只能说Yii2针对中大型项目开发有一些自己的考虑，提供了很多工具，涵盖了从搭建脚手架，开发调试，单元测试，功能测试，验收测试到性能调优。Laravel4的优势也是很强的，他非常受欢迎，有很多人一窝蜂地冲进Laravel的怀抱，所以无论中文还是英文的资料都很多。另一点是，Laravel的学习曲线很短，而Yii2入门容易，精通不易，且学且珍惜。我对Laravel的唯一意见是，这个鬼佬给应用组件起名字的时候，总是诗兴大发，起一些稀奇古怪望文不能生意的名字，让非英语母语的开发者很不爽。而 Yii2 的主要开发者一个中国人，一个德国人，一个毛子，都不是喜欢飚英语的。

知道很多大型企业喜欢原先用 Yii

laravel:

    优点：优雅，框架结构组织清晰（抽象了中间件，任务，服务等模块），提供的artisan开发工具开发效率高，社区活跃完善，并且提供了简化的轻量级框架lumen

    缺点：貌似代码有些过于优雅丧失了一些性能

Spark 是一个实验性项目，主要用于构建面向企业的 Saas（软件即服务） 应用，并且它生来就是专门应对这种使用场景的。
Spark 的功能包括成员管理、用户角色管理、通过 Stripe 计费（估计扩展一下就可以支持支付宝吧）等等。其实也就是将企业应用中的一些常见功能模块化了，这一项目将来估计会演化为针对企业收取服务费的一个产品，和 Laravel 团队推出的 Forge、Envoyer 服务属于同一思路。

Laravel Spark Alpha 版本发布了！

Spark主要用于构建面向企业的SaaS应用，其功能包括团队管理、用户权限、通过Stripe计费（构建支付系统）等等。

Laravel学院以最快时间整理出相关新闻及其使用教程，敬请关注：

功能特性：Laravel Spark Alpha 版本发布 —— 构建企业级 SaaS 应用



PHP
# PHP要点
1. PHP主要是学习框架，数据库，服务器，Linux

PDO PHP Data Object

全栈工程师
    https://www.zhihu.com/question/22420900

全栈增长工程师实战
    https://github.com/phodal/growth-in-action



## PHP学习资料
1. PHP修行之路 https://github.com/GiggleAll/php


## 1 PHP基础
- 2017年7月25日16:30:21 学习第一天
- 每个类目空三行

PHP高级特性总结
    https://cuiqingcai.com/1479.html



## 1.1 PHP是什么
- PHP，即 PHP: Hypertext Preprocessor 超文本预处理器
- 开源的脚本语言，适用于 web开发并可以嵌入到 HTML中
- PHP是将程序嵌入到HTML中去执行的，执行效率比完全生成HTML的CGI要高很多
- PHP的主要目标是： 允许web开发人员快速编写动态生成的web页面
- PHP的特点：
    + php文件的默认扩展名是 .php
    + php语句以分号( ; )结尾
    + php以 <?php 开头, ?> 结尾



### 1.2 为什么学习PHP？
1. 入门简单，容易学习，最适合入门的后端语言，那么如何学习PHP呢？
    - 心理暗示，PHP很容易，每天练习代码并暗示自己PHP很容易
    - 自己肯定能学会PHP，并且能学的很好
    - 坚持，先用搜索引擎去解决问题
    - 永远不要骗自己，写不出代码就是没学会
    - 开发环境
        + 学PHP要安装的东西
            * 网页服务器, Apache
            * 数据库服务器, MySQL
            * PHP核心语言的解释器,PHP7
        + 把以上合在一起安装好的软件就叫集成环境，比如 XAMPP
        + 初期学习，使用集成开发环境，环境配置较为复杂，并且每个人的情况不一样，操作容易出错，一出错，就影响学习心情
        + 选择集成软件的原则：
            * 更新快，版本新，操作简单，选项不要太多
        + 不要在开发环境上反复纠结，耽误宝贵的学习时间，等学会了，再去琢磨一些更加复杂的互联网线上的环境配置

    - 服务器
        + 服务器不要想得太高深，服务器就是一项提供特殊功能的电脑
        + 显示网页的叫网页服务器 web server
        + 代发电子邮件的叫做邮件服务器
        + 帮我们存储数据的叫做数据库服务器
        + 帮我们把各个游戏玩家链接在一起的叫游戏服务器

2. 大并发，一天一个亿的访问量怎么办？
    - 国内外一线的互联网公司将很多大并发方案进行开源，可以获得成熟的，开源的大并发解决方案
3. PHP是开源的，解决成本也更加安全
    - Windows很多都要付费授权
    - Linux的 LAMP/LNMP 架构更加安全



### 1.3 PHP学好后，可以做什么事情？
- PHP最主要的作用就是开发网站，
- PHP是一种创建动态交互性站点的服务器端的脚本语言
    1.能够限制用户访问网站中的某些页面
    2.能够发送并取回 cookie
    3.能够添加，删除，修改数据库中的数据
    4.能够接收表单数据
    5.能够创建，打开，读取，写入，删除以及关闭服务器文件
    6.能够生成动态页面内容






- 基础包括PHP基本的语法 和 Mysql数据库，学完可以做出留言板
- 前端和后台其实是没有任何关系的，他们之间是通过数据库建立连接的

## 2 大牛班
- 把基础重新过一遍，算是加强基础
- 然后就是 PHP面向对象


## 3 PHP工程师的知识架构- PHP是全栈开发
3.0 开发工具
    - IDE
        + PHPstorm
        + IDE提高工作效率，选择适合自己的IDE
    - 版本控制
        + Git，SVN
        + 做研发的版本控制很重要，因为牵涉到顺利持续集成的进度
    - 学会搜索
        + 遇到问题都先搜索，没有思考和尝试哪有什么成长
    - 无论前端还是后端，都是为了给用户更好的体验

3.1 PHP运行环境
    - 刚开始使用集成环境，如 XAMPP，WAMP
    - 随着知识的增加，要学会自己搭建运行环境
        + Linux( Ubuntu/ CentOS ), Apache/Nginx, Mysql, Redis/Memcached, PHP-FRM
        + 服务器知识 Linux《鸟哥私房菜》

3.2 前端知识
    - HTML5
    - CSS3
    - ECMAScript 6
    - jQuery, jQuery 插件
    - 前端框架, Bootstrap, Foundation
        + 准确定位排错

3.3 PHP 基础知识
- 变量, 常量, 字符串, 数组, 控制结构, 数据库, 
- include和require的区别
    + require:出现错误后直接终止退出，程序不再执行 
    + include:包含一个不存在的文件，会提示警告程序会继续执行
- Cookie, Session
    + session 全局变量，登录验证用户名和密码，让页面知道到底谁登录了

- PHP面向对象（类, 继承, 多态）
    + 高内聚，低耦合
    + 封装的原则： 只要一个代码出现过3次或3次以上，就应该封装归纳在一起
        * 要么封装成一个类
        * 要么封装成一个函数

- Mysql命令 INSERT, UPDATE, DELETE, SELECT, GROUP, COUNT, JOIN, 索引
    
3.4 PHP扩展
    - 缓存
        + 主流的 Memcache & Redis
        + 使用频率非常高，后端主要是大量使用在缓存数据库结果集，减轻服务器压力
        + 前端大部分使用 CDN，对静态资源使用CDN可以加载更快

    - Memcache 缓存， 是一套分布式的高速缓存系统
    - Memchache工作流程
        + 先检查客户端的请求数据是否在memcached中，如有，直接把请求数据返回，不再对数据库进行任何操作；
        + 如果请求的数据不在memcached中，就去查数据库，把从数据库中获取的数据返回给客户端，同时把数据缓存一份到memcached中（memcached客户端不负责，需要程序明确实现）；
        + 每次更新数据库的同时更新memcached中的数据，保证一致性；当分配给memcached内存空间用完之后，会使用LRU（Least Recently Used，最近最少使用）策略加上到期失效策略，失效数据首先被替换，然后再替换掉最近未使用的数据。
    
    - Redis 是一个key-value的存储系统，高性能的 key-value数据库
        + 弥补了 memchache key-value存储的不足
        + 对关系数据库起到了很好的补充作用
    
    - 大流量
        + 分布式架构，例如：负载论衡

    - 高并发
        + 秒杀活动
        + 高并发需要了解常用的集中解决方案

    - PHP扩展最基本的要求：先要学会安装和加载
    - 更高的要求是了解扩展的结构并实现一个简单的扩展
        +　[PHP扩展开发及内核应用](http://www.cunmou.com/phpbook/preface.md)

3.5 WEB安全
    - SQL注入，验证码，刷新提价，漏洞扫描，DOS攻击，跨域攻击，XSS，学会基本防御手段

3.6 高性能MySQL
    - 基本语句， 增删改查
    - 有能力写高效语句优化数据库，分库表的策略，主从架构，最后要了解索引的原理
    - 推荐书籍 《高性能MySQL》

3.7 MVC框架
    - 会使用一些框架是基本要求，理解MVC模式，最终实现一个简单的MVC框架
    - MVC模式：视图，控制器，模型
    - 模块和操作
    - 主入口文件
    - MVC模式应用

3.8 应该会的功能
    - 登录/注册模块
    - 上传模块
    - 图像验证码模块
    - 手机验证码模块
    - 支付系统
    - 订单系统
    - 统计模块
    - 级联刷选
    - 微信公众号开发
    - 商城库存并发控制


## PHP问题
mysql数据库做哪些优化能提高mysql性能？
    1、选取最适用的字段属性
    2、使用连接（JOIN）来代替子查询(Sub-Queries)
    3、使用联合(UNION)来代替手动创建的临时表。
    4、事务
    5、锁定表
    6、使用外键
    7、使用索引
    8、优化的查询语句

  sql优化？
  sql函数有哪些？用的最多的是那些函数？

  索引优化？

  数据库的事务？

  日常使用的最多的数据库引擎是哪个？以及之间的优劣和项目选择
    MyISAM 和 InnoDB

  大流量网站的优化该如何去做？
        PHP缓存
        生成html静态页面
        使用主辅数据库，把数据库的读写分开
        使用负载均衡器和多台服务器
        首先，确认服务器硬件是否足够支持当前的流量 
        其次，优化数据库访问。 
        第三，禁止外部的盗链。 
        第四，控制大文件的下载。 
        第五，使用不同主机分流主要流量 
        第六，使用流量分析统计软件


    PHP 缓存机制？
        代码缓存和数据缓存
        APC opcode 缓存
        memcache
        redis

    session的功能和应用场景

    PHP的面向对象编程日常工作中用的多吗？能独立封装面向对象的组件吗？

    PHP的数据结构？
      二叉排序？
      红黑树？

  最熟练的后端框架是哪个？
    laravel5 和 Yii2

    后端框架的配置和框架的性能优化，能独立完成吗？

    有没有ERP的经验，了解SASS系统吗？

PHP函数
  面向对象
  命名空间
  接口
  设计模式
  MVC
  Mysqli面向对象
  PDO
  常用操作封装封装








关系数据库都支持 SQL语法

	关键字大写
	表名小写

	时间复杂度算法
	珠峰前端算法第一课预习资料

	mysqld 服务器

	INNODB
		支持事务
		效率不如 MYISAM

	MYISAM
		不支持事务
		效率高

	mysql 性能不如 MONGODB

				域名         端口  用户名  密码
	mysql -h127.0.0.1 -P3306 -uroot -proot
	
	显示表结构
	desc student

  // 查看当前数据库
	select database()

  // 先用软件创建表，后用命令创建表


  mb4就是most bytes 4的意思，专门用来兼容四字节的unicode
  utf8mb4是utf8的超集

  主键必须是 唯一的
    单主键
    双主键


  50个长度
  varchar 50

  select后面可以跟表达式
    加号只能加数字，加字符串返回 0
  select 1+1;
  select 1-1;
  select 1*1;
  select 1/1;
  select 5%2;


  // concat内置函数，链接字符串
  // 代替 firstname+lastname
  select concat(firstname, lastname) from 'users';


where 过滤表
  // 年龄小于30 或大于50
  select * from users `where` age > 10 `and` age < 80;

  // 年龄不是小于30或大于50，不好的写法
  select * from users where not (age < 30 OR age > 50)

  // 推荐的写法
  select * from users where between 30 AND 50;
  select * from users where age IN (30, 50);
  select * from users where age NOT IN (30, 50);


insert
  insert into users(firstname, lastname, email, age, birthday) VALUES('');


brew install mysql

创建表
create TABLE `school` (
  id int(10) primary key auto_increment not null,
  name VARCHAR(50)
  )

关键字要大些


多张表
  先插入主表，生成 id
  然后把这个 id 插入字表

city_id 是 1或 2
select * from student WHERE city_id in (1,2);


select
  SUM() 一列求和

  MAX() 返回最大值

  MIN() 返回最小值

  AVG() 平均值
  
  平均值
  ROUND(AVG(grade, 0))

总条数
SELECT COUNT(drade) from student;

聚合函数

  自链接
  子查询

  左连接
  右链接

  from子句要给个别名

  自我复制数据
    蠕虫复制，创建一张海量表
    创建结构相同的表，空表
    create  TABLE `copy` like emp;
    insert into `copy` select * from emp;
    insert into `copy` select * from `copy`


  程序员的实践精神

  表的数据去重复
    先创建一个相同的表
    distinct


合并查询
  union 默认去重
  union all 保留重复的数据


左链接，左侧的表安全显示
  left join `stu` on stu.id = score.di

右链接，右侧的表完全显示
  right join on

  select ? from `stu` left join `score` on stu.id = score.id;

  select stu.id, name, stu.title 
  from `stu` 
  left join `score` 
  on stu.id = score.id;



表的约束
  主键 primary key
  外键 foreign key
  唯一 unique
  not null
  check

  主键不能重复，不能为空

  null 和 '' 的区别
  ‘’ 有房子但没人住
  null 10年后的房子，但是要先交钱

  unique 可以有多个
  primary key 只能有一个


  外键子段指向另外一张表，但子段是在本表中的，指向外面

  外键就用 INNODB

  check 约束 只做语法检查，但不会生效

  alter table `tb_name` add primary key ('customer_id')

  自链接：把一张表看作多张表，自链接要命名别名


  auto_increment 自增长，一般和 primary key 一起用
  如果没有 主键 primary key 必须要有 unique



存储过程
  数据库中的空间

  索引二叉树，数据量越大，索引效果越明显

  索引类型
  1 主键索引 primary key，主键就是索引
  2 唯一索引 unique
  3 普通索引  create index 指令
  4 全文索引，用于检索 关键字，比如查询文章

















