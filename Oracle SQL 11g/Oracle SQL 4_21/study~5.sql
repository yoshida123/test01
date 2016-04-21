--����

--�Ј����ɍ�����t����ꍇ
create index �Ј���_INDEX
on �Ј� (�Ј���);

--�����̍폜
drop index �Ј���_INDEX;

--�V�m�j��
--�f�[�^�x�[�X�Ǘ��҂��p�u���b�N�V�m�j�����쐬����
create public synonym �S����
for study.����;

--�V�m�j�����폜����ꍇ
drop synonym emp;
--emp�Ƃ������O�̃V�m�j���̍폜


--���⍇��
--SELECT��ł̎g�p��
select �Ј���,(case when ����ԍ� = (select ����ԍ� from ����
                                      where ���喼 = '�c��')
                  then '�֐�' else '���̑�' end)
from �Ј�
where �E�� = '����';

--ORDER BY��ł̎g�p��
select �Ј���,����ԍ� from �Ј� S
where �E�� = '����'
order by (select ���喼 from ���� B
          where B.����ԍ� = S.����ԍ�);
          
--SET��ł̎g�p��
update �Ј�
set ���^ = (select max(���^) from �Ј�)
where �Ј��ԍ� = 7566;

--VALUES��ł̎g�p��
insert into �Ј�
(�Ј��ԍ�,����ԍ�,�Ј���)
values((select max(�Ј��ԍ�)+1 from �Ј�),20,'����');

--FROM��Ɏg�p���镛�⍇��
select S.����ԍ�,S.�Ј���,S.���^,H.���啽��
from �Ј� S,(select ����ԍ�,avg(���^) ���啽��
            from �Ј�
            group by ����ԍ�) H
where S.���^ > H.����ԍ�
and S.����ԍ� = H.����ԍ�
order by S.����ԍ�,S.���^;

--JOIN��Ɏg�p���镛�⍇��
select S.����ԍ�,S.�Ј���,S.���^,H.���啽��
from �Ј� S
JOIN (select ����ԍ�,avg(���^) ���啽��
     from �Ј�
     group by ����ԍ�) H
on   S.����ԍ� = H.����ԍ�
where S.���^ > H.���啽��
order by S.����ԍ�,S.���^;

--UPDATE��ł̎g�p
update (select ���^ from �Ј�
        where ����ԍ� = 10)
set ���^ = ���^*1.1;

--INSERT INTO��ł̎g�p
insert into (select �Ј��ԍ�,�Ј���,����ԍ� from �Ј�)
values(9000,'���',�Ј�);

insert into (select �Ј��ԍ�,�Ј���,����ԍ� from �Ј�)
select max(�Ј��ԍ�)+1,'���',30 from �Ј�;

--WITH CHECK OPTION����L�q�������⍇��(DELETE)
delete from (select * from �Ј� where ����ԍ� = 10
            with check option)
where ����ԍ� = 10;

--1�̕\�ł̌���
select ����.�Ј��ԍ�,����.�Ј���,����,��i,��i.�Ј��ԍ�,��i.�Ј���
from �Ј� ����,�Ј� ��i
where ����.��i = ��i.�Ј��ԍ�;

--3�ȏ�̕\�̌���
--�e����ɏ������Ă���Ј��̋��^���������߂�ꍇ
select x.���喼,y.�Ј���,y.���^,z.����
from ���� x,�Ј� y,���^���� z
where x.����ԍ� = y.����ԍ�
and y.���^ between z.�Œዋ�^�z and z.�ō����^�z;
order by x.���喼,z.����



--�f�[�^�f�B�N�V���i���̖⍇��
/*
�EUSER_TABLES
�EUSER_OBJECTS
�EUSER_CATALOG(�V�m�j���� CAT)
*/

--���[�U�[�����L����\�̏���\������ꍇ�̗�
select * from user_tables

--���[�U�[�����L����f�[�^�x�[�X�I�u�W�F�N�g�̎�ނ�\������ꍇ�̗�
select distinct object_type from user_object

--���[�U�[�����L����\�A�r���[�A�V�m�j���A������\������ꍇ�̗�
select * from cat

--�\�ɃR�����g��ǉ�����
comment on table �Ј� is '�Ј��̏��';
--�Ј��\�ɃR�����g��ǉ�����ꍇ

--�\�̃R�����g��\��
select * from user_tab_comments
where table_name like '�Ј�%';

--�R�����g���폜����ꍇ�́A���̂悤�ɋ�̕�����('')���R�����g�ɐݒ肷��
comment on table �Ј� is '';

--�\�ɂ�������R�����g��xxx_TAB_COMMENTS�r���[
--��ɑ΂���R�����g��xxx_COL_COMMENTS�r���[