

use master
-- �������ݿ�
create database Student_Information

-- ʹ���½������ݿ�
use Student_Information

-- �ж�����ڵ�ǰ���ݿ�������Ϊѧ����Ϣ�ı��ʱ��ɾ��
if exists(select * from sysobjects where name='ѧ����Ϣ')
drop table ѧ����Ϣ
-- �������
create table ѧ����Ϣ
(
	ѧ�� int PRIMARY KEY identity(1000,1),
	���� varchar(50) not null,
	���� int not null,
	�Ա� varchar(50) not null,
	�绰���� varchar(50)
)
-- �ж�����ڵ�ǰ���ݿ�������Ϊѧ����Ϣ�ı��ʱ��ɾ��
if exists(select * from sysobjects where name='�γ���Ϣ')
drop table �γ���Ϣ
create table �γ���Ϣ
(
	�γ̱�� int PRIMARY KEY identity,
    �γ����� varchar(20) not null
)
if exists(select * from sysobjects where name='�ɼ���')
drop table �ɼ���
create table �ɼ���
(
	�ɼ���� int PRIMARY KEY identity,
    ѧ�� int not null,
	�γ̱�� int not null,
	�ɼ� int not null
)
-- ���������֮��Ĺ�ϵ ���Լ��
--alter table ��Ҫ�󶨵ı�� add constraint Լ�������� --���ɼ��������Լ��
--foreign key(��Ҫ�󶨵��ֶ�) references ��ܱ��(���ֶ�) -- �ж�ѧ���Ƿ����
-- ɾ�����->��ֹ�ظ�
if exists(select *from sysobjects where name='fk_ѧ��')
alter table �ɼ��� drop fk_ѧ��
-- �������Լ��
alter table �ɼ��� add constraint fk_ѧ�� --���ɼ��������Լ��
foreign key(ѧ��) references ѧ����Ϣ(ѧ��) -- �ж�ѧ���Ƿ����

-- ɾ�����->��ֹ�ظ�
if exists(select *from sysobjects where name='fk_�γ̱��')
alter table �ɼ��� drop fk_�γ̱��
-- �������Լ��
alter table �ɼ��� add constraint fk_�γ̱�� --���ɼ��������Լ��
foreign key(�γ̱��) references �γ���Ϣ(�γ̱��) -- �жϱ���Ƿ����

-- ����ѧ������Ϣ
insert into ѧ����Ϣ(����,����,�Ա�,�绰����)values('С��',25,'��','123-456')
insert into ѧ����Ϣ(����,����,�Ա�,�绰����)values('С��',18,'Ů','123-456')
insert into ѧ����Ϣ(����,����,�Ա�,�绰����)values('С��',21,'��','123-456')
insert into ѧ����Ϣ(����,����,�Ա�,�绰����)values('������',21,'��','123-456')
insert into ѧ����Ϣ(����,����,�Ա�,�绰����)values('������',18,'Ů','123-456')
insert into ѧ����Ϣ(����,����,�Ա�,�绰����)values('����',21,'Ů','123-456')

-- ��������
--update ѧ����Ϣ set ����='�μ�' where ѧ��=1005
-- ɾ������
--delete from ѧ����Ϣ where ѧ��=1005

--����γ���Ϣ
insert into �γ���Ϣ(�γ�����) values('�Ӿ���')
insert into �γ���Ϣ(�γ�����) values('���԰�')
insert into �γ���Ϣ(�γ�����) values('�߼���')

-- ����ɼ�����������Ŀ�ĳɼ�

--�Ӿ���ĳɼ�
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1000,1,80)
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1001,1,85)
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1002,1,90)

--���԰�ĳɼ�
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1000,2,75)
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1001,2,98)
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1002,2,88)

--�߼���
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1000,3,51)
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1001,3,60)
insert into �ɼ���(ѧ��,�γ̱��,�ɼ�)values(1002,3,67)

-- ��ѯ�½��ı��
select * from ѧ����Ϣ
select * from �γ���Ϣ
select * from �ɼ���

-- ������ѯ
select * from �ɼ���
select Result_ID=�ɼ����,ID=ѧ��,Class_ID=�γ̱��,result=�ɼ� from �ɼ���

select �ɼ����,ѧ��,�γ�����,�ɼ� from �ɼ���
INNER JOIN �γ���Ϣ ON �ɼ���.�γ̱��=�γ���Ϣ.�γ̱��

select �ɼ����,����,�γ̱��,�ɼ� from �ɼ���
INNER JOIN ѧ����Ϣ ON �ɼ���.ѧ��=ѧ����Ϣ.ѧ��

select �ɼ����,����,�γ�����,�ɼ� from �ɼ���
INNER JOIN �γ���Ϣ ON �ɼ���.�γ̱��=�γ���Ϣ.�γ̱��
INNER JOIN ѧ����Ϣ ON �ɼ���.ѧ��=ѧ����Ϣ.ѧ��
