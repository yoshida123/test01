/*--�T�u�N�G���[
desc JOB_HISTORY
select * from JOB_HISTORY
select * from JOB_HISTORY where DEPARTMENT_ID >
(select department_id from job_history where job_id = 'SA_REP')
--�܂��T�u�N�G���[�����s����A��������������ɂ��čŏI�I�ȃf�[�^��Ԃ��Ă���

--null�ł��邩�ǂ������ׂ�ɂ� is null ���g��
desc DEPARTMENTS
select * from DEPARTMENTS
select * from DEPARTMENTS where MANAGER_ID is null

--�֐��@�f�[�^���̂��̂ł͂Ȃ��A�f�[�^����̌v�Z���ʂȂǂ�Ԃ�

count():�s��
sum():���v
avg():����
max():�ő�l
min():�ŏ��l

--count(�ʏ��*)
select count(*) from DEPARTMENTS

--�����t��count
select count(*) from DEPARTMENTS where MANAGER_ID is null
--null�̍s��

select sum(manager_id) from DEPARTMENTS
--manager_id�̒l�̍��v�l


--insert update delete �̎g����
���ɑ��݂���e�[�u���ɑ΂��āA�f�[�^��o�^������A�X�V������A�폜������
����Ƃ��Ɏg�p����I�@�f�[�^�x�[�X�̃f�[�^�𑀍삷��ꍇ�ɂ͂���炪�K�{
�ɂȂ�B

insert�@���e�[�u���Ƀf�[�^��o�^����ۂɎg���B
insert into...values 1�����f�[�^��o�^����
insert into...select �ʂ̃e�[�u������select�őI�񂾃f�[�^��o�^����

insert into �e�[�u���� (���ږ�) values (�f�[�^)
�̌`���ŋL�q����A���ږ��ƃf�[�^�͌`���Ɛ���K�����킹��I

desc DEPARTMENTS
select insert into departments 
(departments_ID,departments_name,manage_id,location_id) 
values (280,'csfact',210,1700)

create table ash_table
(id integer,name text,yomi,text,lv integer,hp integer,mp integer)


select * from ����@where ����ԍ�= '10'

--NVL�֐�
--NVL(��,�l)...���̒l��NULL�̏ꍇ�A�l��߂��BNULL�ȊO�ł���Ύ���߂�

desc DEPARTMENTS
--select MANAGER_ID from DEPARTMENTS order by MANAGER_ID
select MANAGER_ID,NVL(MANAGER_ID,0) from DEPARTMENTS
*/

--NVL2�֐�
--NVL2(��,�l1,�l2)...���̒l��NULL�ȊO�ł���Βl1�ANULL�̏ꍇ�͒l2��Ԃ�
desc DEPARTMENTS
--select * from DEPARTMENTS
select department_name,manager_id,location_id,nvl2(manager_id,manager_id+location_id,location_id) NVL2
from DEPARTMENTS

--COALESCE�֐�
--COALESCE(��1,��2,�c��n)...��1���玮n�܂ł̒��̍ŏ���NULL�łȂ�����Ԃ�
--��������NULL�łȂ���Ε��������ANULL�̏ꍇ�͏�i���A��i��NULL�̏ꍇ��
--���^��Ԃ��ꍇ
select ������,��i,���^,COALESCE(������,��i,���^)
from �Ј�
--��������NULL�łȂ���Ε������ANULL�������玟�͏�i���A��i��NULL��������
--���^��Ԃ�