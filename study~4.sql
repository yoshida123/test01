--����̍쐬
create table �Ј�
(�Ј��ԍ� number(4) constraint pk_�Ј� primary key,
 �Ј���   varchar2(10) constraint U_�Ј��� unique,
 �E��     varchar2(9),
 ��i     number(4),
 ���Г�   date constraint nn_���Г� not null,
 ���^     number(9) constraint ck_���^ check(���^>=0 and ���^<1000000),
 ������   number(9),
 ����ԍ� number(2) constraint fk_����ԍ� references ����(����ԍ�))
 
 --NOT NULL����(�񐻐��񕶂݂̂Ŏw��\)
 create table test4
 (col1 number constraint test4_col1_nn not null,
  col2 varchar2(10))
  
  
  --UNIQUE����(����l�̓��͋֎~(��ӃL�[))
  --�񐧖�\�����g�p���Đ�����`
  create table test5
  (col1 number constraint test5_col1_U unique,
   col2 varchar2(10))
--col1��(number�^)��unique������`

insert into test5 values(100,'abc');
--�V�����s���쐬(col1��ɂ�100,col2��ɂ͕�����'abc')

insert into test5 values(100,'xyz');
--�G���[������!(col1���unique���񂪒�`����Ă���̂ň�ӂȒl�����w��ł��Ȃ�)

-UNIQUE������`�������NULL�𕡐��s�}��
insert into test5 values(null,'aaa');
insert into test5 values(null,'bbb');

--����UNIQUE����̒�`
create table test6
(col1 number,col2 varchar2(10),constraint col1_col2_U unique(col1,col2))
--�\���쐬���Acol1��col2���unique������`

insert into test6 values(1,'null');

insert into test6 values(1,'abc');

insert into test6 values(2,'abc');

insert into test6 values(2,'abc');
--�����ŃG���[����!!
--����UNIQUE����̏ꍇ�Acoll�܂���co12��P�ƂŌ���ƒl���d�����Ă��Ă�
--coll��co12�̑g�ݍ��킹�Œl���d�����Ă��Ȃ���΍s��}�����邱�Ƃ��ł���B


--CHECK����...���͒l�ɑ΂��Ă̏����̐ݒ�(�͈̓`�F�b�N�Ȃ�)
/*coll��̒l��100����999�܂ŁAcol2��̒l��'M'�܂���'F'�ł��邱�Ƃ�]
������CHECK������`�B�Ȃ�coll��͗񐧖�\��co12��͕\����\���Œ�`*/

create table test7
(col1 number constraint test7_col1_CK
 check (col1 between 100 and 999),
 col2 char(1),constraint test7_col2_CK check (col2 in ('M','F')))
 
 --��������g�p����CHECK����
 create table test8
 (col1 number,col2 number,constraint test8_NN_CK
  check (   (col1 is not null and col2 is null)
         or (col1 is null and col2 is not null)))
         

--PRIMARY KEY����...��L�[�̐錾
--PRIMARY KEY�����񐧖�\���Œ�`����
create table test9
(col1 number constraint test9_PK primary key,col2 varchar2(10))

--�\����\����PRIMARY KEY������`����
create table test10
(col1 number,col2 varchar2(10),
 constraint test10_PK primary key(col1))
 --�\����\���̏ꍇ�͐���̃^�C�v�̌�ɒ�`����񖼂����������ɂ��Ă�����
 
 
 --FOREIGN KEY(�O���L�[)����...�Q�Ɛ������̃`�F�b�N
 --����\���Q�Ƃ���FOREIGN KEY����
 create table ����
 (����ԍ� number constraint ����_PK primary key,
  ����\   varchar2(20))
  
  create table �Ј�
  (�Ј��ԍ� number constraint �Ј�_PK primary key,
   �Ј���   varchar2(20),
   ����ԍ� number constraint �Ј�_����_FK references ����(����ԍ�))
   
--�\����\�����g�p���A�����\�̈قȂ�s���Q�Ƃ���
create table �Ј�2
(�Ј��ԍ� number constraint �Ј�2_PK primary key,
 �Ј���   varchar(20),
 ��i�ԍ� number,
 ����ԍ�number,
constraint �Ј�2��i_FK foreign key (��i�ԍ�)
references �Ј�2(�Ј��ԍ�))


--�����\����V�����\�̍쐬
create table �Ј�_�c�� as
select �Ј��ԍ�,�Ј���,���^ from �Ј�
where ����ԍ� = 30
--�Ј��\���畔��ԍ�30�̍s�̂ݒ��o�����Ј�_�c�ƕ\���쐬

--�\��ǎ���p�ɂ���
alter table �Ј� read only

--�ǎ���p�̕\���폜����
alter table �Ј� drop column ���^
--���^��̍폜�̓f�[�^�ɃA�N�Z�X���Ă�̂ŃG���[�ɂȂ�

drop table �Ј� purge
--�\�̍폜�̓f�[�^�ɃA�N�Z�X���Ă���킯�ł͂Ȃ��̂Ŏ��s�ł���

--�ǎ���p��Ԃ̕\���������݉\���[�h�ɕύX����ɂ́AREAD WRITE���w��
alter table �Ј� read write



--�\�̍폜
drop table �Ј�
--�Ј��\�̍폜���s���Ă���

--���ݔ�����\�����X�g�A����(���ɖ߂�)
select original_name,type,operation from recyclebin
--���ݔ��̒��g���m�F

flashback table �Ј� to before drop
--�t���b�V���o�b�N�������܂����B


--�r���[�̍쐬
--FORCE�I�v�V�������w�肷��ƃr���[�̊�ƂȂ�I�u�W�F�N�g�����݂��Ȃ��ꍇ
--�ł��A�r���[���쐬���邱�Ƃ��ł���
create or replace force view ����l��
as select ����ԍ�,COUNT(*) �l��
from �S�Ј�
group by ����ԍ�
--�r���[���쐬���ꂽ���R���p�C���G���[

--��ƂȂ�\���쐬��A�r���[���Ė⍇�����Ă݂�
rename �Ј�2 to �S�Ј�

--�̌�ɖ₢���킹��Ǝ��s�ł���
select * from ����l��

--����ԍ���10�̍s������Ώۂɂ����r���[�ɍs��1���}������
create or replace view ����10
as select ����ԍ�,�Ј��ԍ�,�Ј���,���Г�
from �Ј�
where ����ԍ� = 10

insert into ����10
values(30,8001,'���',to_date('20080401','YYYYMMDD'))

--WITH CHECK OPTION���w�肵���r���[
create or replace view ����10
as select ����ԍ�,�Ј��ԍ�,�Ј���,���Г�
from �Ј�
where ����ԍ� = 10
with check option constraint ����10_CK

--�r���[�̍폜
drop view �Ј��ꗗ

--100����n�߂�10���������鏇�����쐬����
create sequence ����SEQ1
start with 100
increment by 10
--start with��increment by�ȊO�͏ȗ������̂ŏ���l�Ȃ���
--�z���Ȃ��A�܂����O��20�̒l���������[��ɕێ�����A����SEQ1�Ƃ�������
--�������쐬���ꂽ


--increment by�Ƀ}�C�i�X�̒l���w�肷�邱�Ƃō~���ɒl�𐶐����邱�Ƃ��ł���
create sequence ����SEQ2
start with 100
increment by -10
maxvalue 100


--SELECT�����g�p���ď����𐶐�����
select ����SEQ2.nextval from dual
--100

select ����SEQ2.nextval from dual
--90

select ����SEQ2.nextval from dual
--80

--���݂̐����ς݂̒l���m�F����
select ����SEQ1.currval,����SEQ2.currval from dual
--CURRVAL�͌��Z�b�V�������Ő��������Ō�̒l��Ԃ�

--�Z�b�V�����Ƃ̓��O�C�����烍�O�A�E�g�̂��ƂŃ��O�A�E�g����ƃZ�b�V������
--�I������B�ēx�������[�U�[�Ń��O�C�����Ă��قȂ�Z�b�V�����Ő��������l
--���m�F���邱�Ƃ͂ł��Ȃ��B

--�����̍폜�ɂ�DROP SEQUENCE�����g�p����
drop sequence ����SEQ1
--�������폜���Ă��A���ɐ��������l�������邱�Ƃ͂Ȃ��B