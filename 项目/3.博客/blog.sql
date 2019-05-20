/**
规范
  1 表名不用下划线，尽量简短，所见即所得
*/

# 1 post 文章核心表
create table `post` (
  `id` int(11) not null auto increment comment '自增 id',
  `title` varchar(120) default null collate utf8mb4_general_ci commment '标题',
  `summary` text default null collate utf8mb4_general_ci comment '摘要',
  `content` text collate utf8mb4_general_ci comment '文章内容',
  `thumbnail` varchar(120) default null comment '缩略图',
  `author_id` int(11) default null comment '作者 id',
  `username` varchar(80) default null comment '用户名',
  
  `category_id` int(11) default null comment '分类 id',
  `tag` varchar(80),
  `status` tinyint(1) default '0' comment '是否发布，0-未发布，1-已发布',
  `created_at` int(11) default null comment '创建时间',
  `updated_at` int(11) default null comment '更新时间',
  primary key(`id`),
  index `post_authorId`(`author_id`) using btee,
  index `poststatus`(`status`) using btree
) engine=innoDB auto increment=1 default charset=utf8mb4 comment='文章主表';



-- 2 comment 评论表，评论关联前台用户表，关联评论状态表
create table `comment`(
  `id` int(11) not null auto_increment comment '评论自增 id',
  `content` text not null comment '评论内容',
  `status` tinyint(2) not null default '0' comment '1 评论已发布，0 未发布',
  `fans_id` int(11) not null comment '前台用户 id',
  `email` varchar(80) comment '邮箱',
  `url` varchar(120) comment '评论链接',
  `post_id` int(2) comment '文章 id',
  `remind` smallint(4) default '0' comment '0 未提醒，1 已提醒',
  `created_at` int(11) comment '评论创建日期',
  `updated_at` int(11) comment '修改日期',
  `is_deleted` smallint(2) '是否删除',
  primary key (`id`),
  index `comment_postId`(`post_id`), index `comment_fansId`(`fans_id`),
  index `commentstatus`(`status`)
)engine=myISAM auto_increment=1 default charset=utf8mb4 comment='评论表';
-- )engine=innodb auto_increment=1 default charset=utf8mb4 comment='评论表';



## 3 前台用户表
create table `fans`(
  `id` int(11),
  `content` text,
  `status` tinyint(2),
  `create_time` int(11),
  `email` varchar(30),
  `url` varchar(120),
  `post_id` int(),
)engine=innodb auto_increment=1 default charset=utf8mb4 comment='前台用户表';



## 4 后台用户表
create table if not exists `user`(
  `id` int(11) not null auto_increment comment '自增 id',
  `username` varchar(80) not null collate utf8mb4_general_ci comment '用户名',
  `auth_key` varchar(32) not null comment '自动登录 key',
  `password_hash` int(120) not null comment '加密密码',
  `password_reset_token` varchar(120) default null comment '重置密码 token',
  `email` varchar(80) not null comment '邮箱',
  `email_validate_token` varchar(255) default null comment '邮箱验证 token',
  `role` smallint(6) not null default '2' comment '角色等级',
  `avatar` varchar(80) default null comment '头像',
  
  `vip` int(11) default '0' comment 'vip 等级',
  `point` int(11) default '0' comment '积分',
  `status` tinyint(2) not null default '0' comment '状态',
  `created_at` int(11) not null comment '创建时间',
  `updated_at` int(11) not null comment '更新时间',
  primary key(`id`),
  unique key `username`(`username`),
  unique key `email`(`email`),
  unique key `password_reset_token`(`password_reset_token`)
)engine=innodb default charset=utf8mb4 collate=utf8mb4_general_ci comment='后台用户表';



## 5 管理员表
create table `adminuser`(
  `id` int(11) not null auto_increment comment '',
  `username` varchar(80) not null collate utf8mb4_general_ci comment '',
  `nickname` varchar(80) not null collate utf8mb4_general_ci comment '',
  `password` int(11) comment '',
  `email` varchar(120) comment '',
  `avatar` varchar(120) comment '',
  `level` smallint(2) comment '',
  `profile` text comment '',
  `auth_key` varchar(32) comment '',
  `password_hash` varchar(200) comment '',
  `password_reset_token` varchar(200) comment '',
  primary key(`id`)
)engine=innodb auto_increment=1 default charset=utf8mb4 comment='管理员表';



## auth_item
create table if not exists `auth_item`(
  `name` varchar(64) not null comment '',
  `type` init(11) not null comment '',
  `description` text collate utf8mb4_general_ci comment '',
  `rule_name` varchar(64) default null comment '',
  `data` text collate=utf8mb4_general_ci comment '',
  `created_at` int(11) default null,
  `updated_at` int(11) default null,
  primary key(`name`), // 复合主键
  index `auth_item_rulename`(`rule_name`), `auth_item_type` (`type`) // 索引

) engine=innoDB default charset=utf8mb4 collate=utf8mb4_general_ci comment '作者表';


## auth_item_child
create table if not exists `auth_item_child`(
  `parent` varchar(64) not null comment '',
  `child` varchar(64) not null comment '',
  primary key(`parent`, `child`),
  index `child`(`child`)
) engine=innoDB default charset=utf8mb4 collate utf8mb4_general_ci comment '';


-- auth_rules
create table if not exists `auth_rule`(
  `name` varchar(64) not null,
  `data` text,
  `created_at` int(11) default null,
  `updated_at` int (11) default null,
  primary key (`name`)
)engine=innoDB default charset=utf8mb4 collate=utf8mb4_general_ci comment '';


## auth_assignment
create table if not exists `auth_assignment`(
  `name` varchar(64) not null collate utf8mb4_general_ci,
  `user_id` varchar(64) not null,
  `created_at` init(11) default null,
  primary key(`name`, `user_id`)
)engine=innoDB default charset=utf8mb4 collate=utf8mb4_general_ci comment '作者角色分配';


# 文章分类表
create table `category` (
  `id` int(11) not null auto_increment comment '自增 id',
  `name` varchar(80) default null comment '分类名称',
  primary key (`id`)
  unique key `name`(`cat_name`) using btree
) engine=innoDB auto increment=1 default charset=utf8mb4 comment='文章分类表';


# 标签表
create table `tag` (
  `id` int(11) not null auto_increment comment '自增 id',
  `name` varchar(40) not null collate utf8mb4_general_ci comment '标签名称',
  `frequency` int(11) default '1' comment '关联文章数量, 标签出现的频率',
  primary key (`id`),
  unique key `tag_name`(`name`) using btree
) engine=innoDB auto defaut charset=utf8mb4 collate=utf8mb4_general_ci comment '文章标签表';


## 表的关联, post_tag 文章和标签的关联
create table `postag`(
  `id` int(11) not null auto increment comment '自增 id',
  `post_id` int(11) default null comment '文章 id',
  `tag_id` int(11) default null comment '标签 id',
  primary key(`id`),
  unique key `post_id`(`post_id`, `tag_id`) using btree
) engine=innoDB auto increment=1 default charset=utf8mb4 comment='文章和标签的关联';



## 表的关联, poststatus 文章状态表
create table if not exists `poststatus`(
  `id` int(`11`) not null auto_increment comment '',
  `name` varchar(40) not null collate utf8mb4_general_ci comment '',
  `position` int(11) not null comment '',
  primary key(`id`),
  unique key `tag_name`(`name`) using btree
)engine=innodb default charset=utf8mb4 collate=utf8mb4_general_ci comment='文章状态表';


## 表的关联, commentstatus 评论状态表
create table `commentstatus`(
  `id` int(`11`) not null auto_increment comment '',
  `name` varchar(40) not null collate utf8mb4_general_ci comment '',
  `position` tinyint(2) not null comment '',
  unique key `tag_name`(`name`) using btree,
  primary key(`id`)
)engine=innodb auto_increment=1 default charset=utf8mb4 comment='评论状态表';




## migration 数据搬家用的表, 自动创建的
create table if not exists `migration`(
  `version` varchar(120) not null collate utf8mb4_general_ci,
  `apply_time` int(11) default null,
  primary key(`version`)
)engine=innodb default charset=utf8mb4 comment='数据搬家用的表';



-- 表的外键约束 auth_assignment
alter table `auth_assignment`
  add constraint `fk_auth_assignment` foreign key(`item_name`) 
  references `auth_item`(`name`) 
    on delete cascade on update cascade;


-- auth_item
alter table `auth_item`
  add constraint `fk_auth_item` foreign key(`rule_name`)
  references `auth_rule`(`name`)
    on delete set null on update cascade;


-- auth_item_child
alter table `auth_item_child`
  add constraint `fk_auth_item_parent` foreign key(`parent`)
  references `auth_item`(`name`)
    on delete cascade on update cascade,
  add constraint `fk_auth_item_child` foreign key(`child`)
  references `auth_item`(`name`)
    on delete cascade on update cascade;


-- post fk_ 外键的前缀
alter table `post`
  add constraint `fk_post_author` foreign key(`author_id`)
  references `adminuser`(`id`)
    on delete cascade,
  add constraint `fk_post_status` foreign key(`status`)
  references `poststatus`(`id`)
    on delete cascade;


-- comment
alter table `comment`
  add constraint `fk_comment_post` foreign key(`post_id`) 
  references `post`(`id`)
    on delete cascade,
  add constraint `fk_comment_status` foreign key(`status`)
  references `commentstatus`(`id`)
    on delete cascade,
  add constraint `fk_comment_user` foreign key(`user_id`)
  references `user`(`id`)
    on delete cascade;


# 修改表的自增字段
-- alter table `comment` modify `id` int(11) not null auto_increment, auto_increment = 99;






















