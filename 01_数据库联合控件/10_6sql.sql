

use master
-- 创建数据库
create database Student_Information

-- 使用新建的数据库
use Student_Information

-- 判断如果在当前数据库中有名为学生消息的表格时候删除
if exists(select * from sysobjects where name='学生信息')
drop table 学生信息
-- 创建表格
create table 学生信息
(
	学号 int PRIMARY KEY identity(1000,1),
	姓名 varchar(50) not null,
	年龄 int not null,
	性别 varchar(50) not null,
	电话号码 varchar(50)
)
-- 判断如果在当前数据库中有名为学生消息的表格时候删除
if exists(select * from sysobjects where name='课程信息')
drop table 课程信息
create table 课程信息
(
	课程编号 int PRIMARY KEY identity,
    课程名称 varchar(20) not null
)
if exists(select * from sysobjects where name='成绩表')
drop table 成绩表
create table 成绩表
(
	成绩编号 int PRIMARY KEY identity,
    学号 int not null,
	课程编号 int not null,
	成绩 int not null
)
-- 建立表与表之间的关系 外键约束
--alter table 需要绑定的表格 add constraint 约束的命名 --往成绩表中添加约束
--foreign key(需要绑定的字段) references 绑架表格(绑定字段) -- 判断学号是否存在
-- 删除外键->防止重复
if exists(select *from sysobjects where name='fk_学号')
alter table 成绩表 drop fk_学号
-- 插入外键约束
alter table 成绩表 add constraint fk_学号 --往成绩表中添加约束
foreign key(学号) references 学生信息(学号) -- 判断学号是否存在

-- 删除外键->防止重复
if exists(select *from sysobjects where name='fk_课程编号')
alter table 成绩表 drop fk_课程编号
-- 插入外键约束
alter table 成绩表 add constraint fk_课程编号 --往成绩表中添加约束
foreign key(课程编号) references 课程信息(课程编号) -- 判断编号是否存在

-- 插入学生的信息
insert into 学生信息(姓名,年龄,性别,电话号码)values('小明',25,'男','123-456')
insert into 学生信息(姓名,年龄,性别,电话号码)values('小红',18,'女','123-456')
insert into 学生信息(姓名,年龄,性别,电话号码)values('小蓝',21,'男','123-456')
insert into 学生信息(姓名,年龄,性别,电话号码)values('龙傲天',21,'男','123-456')
insert into 学生信息(姓名,年龄,性别,电话号码)values('龙傲地',18,'女','123-456')
insert into 学生信息(姓名,年龄,性别,电话号码)values('龙嗷嗷',21,'女','123-456')

-- 更改数据
--update 学生信息 set 姓名='嘉嘉' where 学号=1005
-- 删除数据
--delete from 学生信息 where 学号=1005

--插入课程信息
insert into 课程信息(课程名称) values('视觉班')
insert into 课程信息(课程名称) values('语言班')
insert into 课程信息(课程名称) values('高级班')

-- 插入成绩单，三个科目的成绩

--视觉班的成绩
insert into 成绩表(学号,课程编号,成绩)values(1000,1,80)
insert into 成绩表(学号,课程编号,成绩)values(1001,1,85)
insert into 成绩表(学号,课程编号,成绩)values(1002,1,90)

--语言班的成绩
insert into 成绩表(学号,课程编号,成绩)values(1000,2,75)
insert into 成绩表(学号,课程编号,成绩)values(1001,2,98)
insert into 成绩表(学号,课程编号,成绩)values(1002,2,88)

--高级班
insert into 成绩表(学号,课程编号,成绩)values(1000,3,51)
insert into 成绩表(学号,课程编号,成绩)values(1001,3,60)
insert into 成绩表(学号,课程编号,成绩)values(1002,3,67)

-- 查询新建的表格
select * from 学生信息
select * from 课程信息
select * from 成绩表

-- 内联查询
select * from 成绩表
select Result_ID=成绩编号,ID=学号,Class_ID=课程编号,result=成绩 from 成绩表

select 成绩编号,学号,课程名称,成绩 from 成绩表
INNER JOIN 课程信息 ON 成绩表.课程编号=课程信息.课程编号

select 成绩编号,姓名,课程编号,成绩 from 成绩表
INNER JOIN 学生信息 ON 成绩表.学号=学生信息.学号

select 成绩编号,姓名,课程名称,成绩 from 成绩表
INNER JOIN 课程信息 ON 成绩表.课程编号=课程信息.课程编号
INNER JOIN 学生信息 ON 成绩表.学号=学生信息.学号
