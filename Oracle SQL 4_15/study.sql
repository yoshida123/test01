--case��
desc JOB_HISTORY
--select * from JOB_HISTORY
select employee_id,job_id,case job_id when 'AC_ACCOUNT' then 'AC'
                                      when 'ST_CLERK' then 'ST'
                                      else '���̑�' end
from JOB_HISTORY

/*DECODE�֐�
DECODE(��,�l1,�߂�l1,...�ln,�߂�ln[,�߂�lz])
���̒l���l1�̏ꍇ�͖߂�l1���A�ln�̏ꍇ�͖߂�ln��߂��B������ł��Ȃ��ꍇ
�͖߂�lz(�ȗ�����NULL)��߂�*/
select �E��,���^,DECODE(�E��,'����','MANAGER','�c��','SALESMAN','���̑�')
from �Ј� where ����ԍ� = 30

--�֐��̃l�X�g
--�P��s�֐��͔C�ӂ̃��x���Ńl�X�g(����q)�ł���A�l�X�g���ꂽ�֐��́A
--�܂������̃��x�����]������O���̃��x���ւƕ]�������
select ����ԍ�,�Ј���,�E��,DECODE(����ԍ�,30,NVL(TO_CHAR(������,'L999,999'),'�x�����Ă��܂���'),'�Ώە���ł͂���܂���') �������̗L��
from �Ј� order by ����ԍ�,�E��

--AVG�֐�
--AVG(n)...n�̕��ϒl��߂�

--���^�̕��ϒl�����߂�ꍇ
select avg(���^) from �Ј�

--COUNT�֐�
--COUNT(��)...����NULL�łȂ��s��߂��I�@*(�A�X�^���X�N)���w�肷���
--�d���l�y��NULL�l���܂߂čs����߂��I�@�v��*������S�����Ă��ƁI
select count(*),count(���^),count(������) from �Ј�

select count(�E��),count(distinct �E��) from �Ј�
--�����̈قȂ�l������(�d�����܂Ƃ߂�)

--MAX�֐�
--MAX(��)...���̍ő�l�����߂�
select max(���^),max(�E��),max(���Г�) from �Ј�
--�����͕����R�[�h�̍ł��傫���l�A���t�͍ł��V�������t��Ԃ�

--MIN�֐�
--MIN(��)...���̍ŏ��l�����߂�
select min(���^),min(�E��),min(���Г�) from �Ј�
--�����͕����R�[�h�̍ł��������l�A���t�͍ł��Â����t��Ԃ�

--SUM�֐�
--SUM(n)...n�̍��v�l��߂�
select sum(���^) from �Ј�
--���^��̍��v�l��Ԃ�

--GROUP BY ��
--���̒l�Ɋ�Â��čs�̃O���[�v�����߂邱�Ƃ��ł���
select ����ԍ�,max(���^) from �Ј�
group by ����ԍ�
--�Ј��\���畔�傲�Ƃ̍ō����^�z�����߂�Agroup by�̌�łǂ̗��Ώۂ�
--�O���[�v�����Ă�̂���������

--GROUP BY ��ɕ����̗���w��
select ����ԍ�,�E��,MAX(���^) from �Ј�
group by ���喼,�E��
--���傲�ƂɊe�E���̍ō����^�z�����߂Ă���

--HAVING�� �O���[�v�����ꂽ�s�ɏ������w�肷�邱�Ƃ��ł���
--HAVING��́@GROUP BY��̑O��ǂ���ɋL�q���Ă��\��Ȃ�
select ����ԍ�,MAX(���^) from �Ј�
group by ����ԍ�
having max(���^) >= 300000

select ����ԍ�,MAX(���^) from �Ј�
having max(���^) >= 300000
group by ����ԍ�
--�ǂ�����ō����^�z��300000�ȏ�̕���ԍ������߂Ă���

--select��Ŏw�肳��Ă��Ȃ����HAVING��ŏ����t�����邱�Ƃ��\
select ����ԍ�,MAX(���^) from �Ј�
group by ����ԍ�
having count(*) >= 5
--count(*)���s�����l���Ƃ�������

