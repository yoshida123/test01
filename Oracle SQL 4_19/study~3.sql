--INSERT��
insert into �Ј� (�Ј��ԍ�,�Ј���,����ԍ�)
values (9999,'���R',20)


/*�S��ɒl���w�肵�����ꍇ�́A���ׂĂ̗��C�ӂ̏����Ŏw�肷�邩�\����
���̗񖼂̃��X�g���ȗ����邱�Ƃ��ł���B�񖼂̃��X�g���ȗ������ꍇ�A
�l�̃��X�g�͕\�쐬���ɒ�`������̏����ɏ]���ċL�q�����*/

--�񖼂̃��X�g���ȗ�����INSERT��
insert into �Ј�
values (1111,'����','�c��',7788,
to_date('2000-04-01','yyyy-mm-dd'),240000,50000,30)

--NULL�l�̑}��
--��̒l��NULL�l���w�肷��ꍇ�́ANULL�L�[���[�h���g�p����
insert into �Ј�
values (2222,'����','�Ɩ�',7788,
to_date('1999-04-01','yyyy-mm-dd'),600000,NULL,30)

--����̗񂾂����w�肵��INSERT�������s�����ꍇ�A�w�肳��Ȃ��������
--��NULL�l���}�������B
insert into �Ј� (�Ј��ԍ�,�Ј���,����ԍ�)
values (3333,'�Έ�',30)

--������Ɠ��t�́AVALUES��ŋ�̕�����(")���w�肵�ANULL��}����
--�邱�Ƃ��ł���B

--NULL�l�ȊO�ɂ��A�����̓��t��Ԃ�SYSDATE�֐����g�p��
insert into �Ј� (�Ј��ԍ�,�Ј���,���Г�,����ԍ�)
values (5555,'����',SYSDATE,30)



--UPDATE��
/*UPDATE���́A�����s�̗�̒l��ύX�������Ƃ��Ɏg�p����
SET��ɕύX�������񖼂ƒl�AWHERE��ɕύX�̑ΏۂƂȂ�s�̏������L�q
WHERE��͏ȗ����邱�Ƃ��ł��邪�A�ȗ�����ƑS�s���X�V�����*/

update �Ј�
set ������ = 10000

--����̒S���𕔒��ɍX�V����
update �Ј�
set �E�� = '����'
where �Ј��� = '����'

--SET��͒萔�����łȂ��A�֐���v�Z���Ȃǂ��w���

--����̋��^��2�{�ɍX�V����
update �Ј�
set ���^ = ���^*2
where �Ј��� = '����'

--������w��ł��� ���̍ہu,�v���g�p
update �Ј�
set �E�� = '��C',���^ = ���^/2
where �Ј��� = '����'



--DELETE��
/*DELETE���́A�����s���폜�������Ƃ��ɂ��悤����
FROM��̌��ɕ\�����AWHERE��ɍ폜�̑ΏۂƂȂ�s�̏������L�q
WHERE��͏ȗ����邱�Ƃ��ł��邪�A�ȗ�����ƑS�s���폜�����*/

--�Ј��\����Ј��ԍ�1111�̍s���폜����
delete from �Ј�
where �Ј��ԍ� = 1111

--DELETE���́AFROM�L�[���[�h���ȗ���

--�Ј��\����S�s�폜
delete from �Ј�;


--TRUNCATE(�\�̐؂�̂�)��
--�\���炷�ׂĂ̍s���폜����ꍇ�ɂ́ATRUNCATE TABLE�����g�p����
--�Ј��\��؂�̂Ă�ꍇ
truncate table �Ј�

--���⍇����p����INSERT��
--VALUES��̑���ɕ��⍇�����g�p�����ꍇ
insert into �c�ƃ}�� (enpno,name,hiredate,sal,comm)
from �Ј�
where �E�� = '�c��'

--���⍇����p����UPDATE��
--UPDATE����WHERE��ŕ��⍇�����g�p�����ꍇ
update �Ј�
set ���^
where ���^ = (select min(���^) from �Ј�)

--SET��ŕ��⍇�����g�p�����ꍇ
update �Ј�
set ���^ = (select max(���^) from �Ј�
              where �E�� = '�c��')
  ,������ = (select max(����) from �Ј�
              where �E�� = '�c��')
where �Ј��ԍ� = 7844

--������̍X�V�́A���̂悤�ɋL�q���邱�Ƃ��ł���
update �Ј�
set (���^,������) = (select MAX(���^),MAX(������)
                      from �Ј�
                      where �E�� = '�c��')
where �Ј��ԍ� = 7844

--���⍇����p����DELETE��
--DELETE����WHERE��ɂ����Ă����⍇�����g�p���邱�Ƃ��ł���
delete from �Ј�
where ���^ = (select max(���^) from �Ј�)


--COMMIT(�g�����U�N�V�����̊m����s���R�}���h)
--��x�R�~�b�g�����g�����U�N�V������������(ROLLBACK)���Ƃ͂ł��Ȃ�

--�X�L�[�}��
--���X�L�[�}�̃I�u�W�F�N�g�������Ƃ��ɂ́A���̂悤�ɁA�I�u�W�F�N�g���̑O
--�O�ɃX�L�[�}�����w�肷��B(�I�u�W�F�N�g = �\)

--SYSTEM���[�U�[�����X�L�[�}(STUDY)�̕���\����������
select * fom study.����

--CREATE TABLE��(�\�̍쐬)
create table ���Ј�
(�Ј��ԍ� number,�Ј��� varchar,���Г� date)

--�쐬���ꂽ�\���m�F����ɂ�DESCRIBE(DESC)�R�}���h���g�p
desc ���Ј�

