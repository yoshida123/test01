select * from JOB_HISTORY where JOB_ID not in('IT_PROG','AC_MGR')

--�E�����u���v����n�܂�s������
select distinct �E�� from �Ј� 
where �E�� not like '��%'

--��������null�̎Ј�����̍s������
select �Ј��� from �Ј�
where ������ is null

--��������null�ł͂Ȃ��Ј�����̍s������
select �Ј��� from �Ј�
where ������ is not null

--�E���������̍s���A����ԍ��̏����ŕ��בւ�
select ����ԍ�,�Ј���,���^,�E��
from �Ј�
where �E�� = '����'
order by ����ԍ�

--�E���������̍s���A����ԍ��̍~��(desc)�ŕ��בւ�
select ����ԍ�,�Ј���,���^,�E��
from �Ј�
where �E�� = '����'
order by ����ԍ� desc

--�E���������̍s���A����ԍ��̏���(�f�t�H���g�ŏ������������I��asc���w��\)�ɕ��בւ�
select ����ԍ�,�Ј���,���^,�E��
from �Ј�
where �E�� = '����'
order by ����ԍ� asc

--select��őI�����ĂȂ���ł��w�肵�ĕ��בւ��邱�Ƃ��ł���I
select ����ԍ�,�Ј���,���^,�E��
from �Ј�
where �E�� = '����'
order by ���Г�

--���בւ��̊�ƂȂ����ԍ��Ŏw�肷�邱�Ƃ��\
select ����ԍ�,�Ј���,���^,�E��
from �Ј�
where �E�� in ('�Ɩ�','����')
order by 1,3 --����ԍ�(1�Ԗ�)�Ƌ��^(3�Ԗ�)�̗�̏����ɍs����בւ��Ă���

--�u���^*12�v�̕ʖ��ł���u�N���v�ŏ����ɕ��בւ���
select ����ԍ�,�Ј���,���^*12 �N��
from �Ј�
where ����ԍ� = 30
order by �N��

--null�@first(null�l���擪�ɂ���)���g�������בւ�
select �Ј���,������
from �Ј�
where ����ԍ� = 30
order by ������ null first --null�l���擪�ɂ��Č�͏���

select �Ј���,������
from �Ј�
where ����ԍ� = 30
order by ������ desc null first --null�l���擪�ɂ��Č�͍~��

--null last(null�l���Ō�ɂ���)���g�������בւ�
select �Ј���,������
from �Ј�
where ����ԍ� = 30
order by null last --null�l���Ō�ɁA���͏���

select �Ј���,������
from �Ј�
where ����ԍ� = 30
order by desc null last --null�l���Ō�ŁA���͍~��



/*���l�֐�*/

/*CEIL�֐�
  ceil( n )...n�ȏ�̍ł�������������߂�*/
  select ceil(14.8) from dual --14.8�ȏ�̍ł�����������(15)��߂��Ă���

/*FLOOR�֐�
  floor( n )...n�ȉ��̍ł��傫��������߂�*/
  select floor(14.8) from dual --14.8�ȉ��̍ł��傫������(14)��߂��Ă���
  
  /*MOD�֐�
    mod(m,n)...m��n�Ŋ������]���߂�*/
    select mod(9,4) from dual --9��4�Ŋ������]��(1)��߂�
    
  /*POWER�֐�
    power(m,n)...m��n�悵���l��߂�*/
    select power(4,2) from dual --4��2��(4*4)�����l(14)��߂�
    
  /*SQRT�֐�
    sqrt(n)...n�̕�������߂�*/
    select sqrt(36) from dual --36�̕�����(6)��߂�
    
  /*ROUND�֐��@�l�̌ܓ�
    round(m[,n])...m�͎l�̌ܓ����������̐��l�An�͌���(�����ڂ܂ŕ\�����邩�w�肷��)*/
    set numformat 99999.999
    select round(3456.789,2),round(3456.789,-2) from dual
  --3456.789�̏�����2�ʂ܂ŕ\�����������̂ŏ�����3�ʂ��l�̌ܓ�(����)
  --���������̐��̏ꍇ�͏����_�̍��A3456.789��10�̈ʂ��l�̌ܓ�(�E��)
  
/*TRUNC�֐��@�؂�̂�
  trunc(m[,n])...m�͌��̐��An�͌���(�\��������������)*/
  set numformat 99999.999
  select trunc(3456.789,2),trunc(3456.789,-2) from dual
  --�����͏����_��2�܂ŕ\�����������̂ŁA��3�ʈȍ~��؂�̂�(3456.780)
  --�E���͌��������̐��Ȃ̂ŁA10�̈ʂ���E����؂�̂�(3400.000)


  
/*�����֐�*/

/*LENGTH�֐�
  length(����)...������̒�����߂�*/
  select length('System Technology-i') from dual --������(19)���߂�
  
/*INSTR�֐�
  instr(������1,������2[,n,m])...������1��n�Ԗڂ̕������當����2�̒T�����J�n���A
  ������2��m�ԖڂɌ��������ʒu�̒l��߂��Bm�����n�͏ȗ��\�Ńf�t�H���g�l��1�ƂȂ�*/
  select instr('System Technology-i','E') from dual
  /*�f�t�H���g�l��1������System Technology-i��1�����ڂ���1�ԖڂɌ�����E�̒l(5)*/
  
  select instr('System Technology-i','E',8,1) from dual
  /*System Technology-i��8�����ڂ���1�ԖڂɌ�����E�̒l(9)���߂�*/
  
/*SUBSTR�֐�
  substr(������,n[,m])...�������n�Ԗڂ̕�������m�����̒����̕�����𔲂��o���Ė߂�
  m�͏ȗ��A���̍ۂ͍Ō�̕����܂ł�߂��Bn�����̎��͕�����̏I��肩��t�����ɏ���
  m��1��菬�����l�͎w��ł��Ȃ�*/
  select substr('System Technology-i',8,10) from dual
  --8�Ԗڂ̕�������10���������o���̂�(Technology)���߂�
  
  select substr('System Technology-i',8) from dual --m���ȗ�����Ă�̂ōŌ�܂�
  --8�Ԗڂ̕�������Ō�܂Ŕ����o���̂�(Technology-i)���߂�
  
  select substr('System Technology-i',-8) from dual--���̏ꍇ�͏I��肩�珈������
  --�I��肩��8�����Ȃ̂�(nology-i)���߂�
  
  /*INSTR��SUBSTR��g�ݍ��킹�Ďg��*/
  select substr('System Technology-i',8) as "�����o��������"
  instr(substr(substr('System Technology-i',8),'e',1)) as "�ue�v�̈ʒu"
  from dual
  /*�����o����������Technology-i�ł��̕�����1�Ԗڂ̕�������(�ȗ�����Ă�̂Ńf�t�H���g
  ��1)1�ԖڂɌ�����e�̒l(2)���߂�*/
  
/*INITCAP�֐�
  initcap(������)...�e�P��̍ŏ��̕�����啶���c��̕������������ɂ��Ė߂�*/
  select initcap('system technology-i') from dual
  --System Technology-i �ƂȂ�
  
/*UPPER�֐�
  upper(������)...�������啶���ɂ��Ė߂�*/
  select upper('system technology-i') from dual --SYSTEM TECHNOLOGY-I�@�ƂȂ�
  
/*LOWER�֐�
  lower(������)...��������������ɂ��Ė߂�*/
  select lower('System Technology-i') from dual --system technology-i�@�ƂȂ�
  
/*CONCAT�֐�
  concat(������1,������2)...������1�ƕ�����2��A�����āA1�̕�����ɂ��Ė߂�*/
  select concat('Good ','Morning') from dual --Good Morning�@�ƂȂ�
  
/*LPAD�֐�
  lpad(������,n[,�o���f�B���O����])...������n���ɂȂ�悤�ɍ��Ƀo���f�B���O����
  �𖄂߂Ė߂��B�o���f�B���O�����͏ȗ��\�Ńf�t�H���g�͋󔒂ƂȂ�*/
  select �Ј��ԍ�,lpad(�Ј���,10,'*') from �Ј�
  where ����ԍ� = 30 --
  
/*RPAD�֐�
  LPAD�Ƃ͋t�ɍ��x�͉E���Ƀo���f�B���O�����𖄂߂Ė߂�*/
  select �Ј��ԍ�,rpad(�Ј���,10,'*') from �Ј�
  where ����ԍ� = 30
  
/*TRIM...������̐擪(LEADING)�A�Ō�(TRAILING)�A�܂��͐擪�ƍŌ�̗���(BOTH)����
  ������؂�̂Ă�BLEADING�܂���TRAILING���ȗ������ꍇ�f�t�H���g�l��BOTH�ƂȂ�*/
  select trim(leading '��' from '���j��') from dual
  --���j������擪�̓���؂�̂Ă邩��(�j��)�ƂȂ�
  
  select trim(trailing '��' from '���j��') from dual
  --�Ō�̓���؂�̂Ă邩��(���j)�ƂȂ�
  
  select trim(both '��' from '���j��') from dual
  --�����̓���؂�̂Ă邩��(�j)�ƂȂ�
  
/*REPLACE�֐�
  replace(������1,������2,[,������3])...������1�̒����當����2��T���A������3��
  �u������B������3���ȗ������ۂ͕�����1���炷�ׂĂ̕�����2����菜�����*/
  select replace('(��)�ĉj��','(��)','�������') from dual
  --(��)�ĉj�Ђ�(��)��������Ђɒu������(��������ĉj��)�ƂȂ�
  



/*���t�֐�*/

--���t�̉��Z
select to_date('08-12-31')+90 from dual�@-- 09-3-31�ƂȂ�
select to_date('08-12-31')-90 from dual -- 08-10-02�ƂȂ�

--���t�̉��Z�̓G���[�ƂȂ�I
select to_date('09-01-01') - to_date('08-12-01') from dual --���t���m�̓G���[�I

/*ADD_MONTHS�֐�
  add_months(���t,n)...���t��n�J���������l��߂��Bn�����̏ꍇ��n�J���������l��߂�*/
  select add_months('08-10-15',1),add_months('08-10-31',-2) from dual
  --(08-11-15),(08-08-15)
  
  select add_months('08-10-31',1) from dual
  /*(08-11-30)�ƂȂ�A�P����30�������Ă�킯�ł͂Ȃ��̂Ō������g�p�����ꍇ��n�J�����
  �����ɂȂ�I*/
  
/*LAST_DAY�֐�
  last_day(���t)...�w�肵�����t�̌��̌�������߂�*/
  select last_day('08-06-02') from dual --(08-06-30)
  
/*NEXT_DAY�֐�
  next_day(���t,�j��)...���̗j�����}������t��߂�*/
  select next_day('08-12-01','���j��')�@from dual --���ɗ��錎�j���̓��t
  --(08-12-08)
  
/*MONTHS_BETWEEN�֐�
  months_between(���t1,���t2)...���t1�Ɠ��t2�̊Ԃ̌�����߂�*/
  select months_between('08-12-01','08-01-01'),('08-01-01','08-12-01')
  from dual
  --���t1��2�̊Ԃ̌��������߂�̂�(11),(-11)�ƂȂ�
  
/*SYSDATE�֐�
  sysdate...�f�[�^�x�[�X�̌��݂̓�����߂�*/
  select sysdate drom dual --DB�̌��݂̓��t�A���Ԃ��߂�
  
/*TRUNC/ROUND�֐�
  trunc(���t,[,����])...�����Ŏw�肵���P�ʂɁA���t�f�[�^��؂�̂Ă�A������
  �ȗ��\�Ńf�t�H���g�l��DD(���ɂ�)�ƂȂ�B
  
  round(���t,[,����])...�����Ŏw�肵���P�ʂɁA���t�f�[�^���l�̌ܓ�����A������
  �ȗ��\�Ńf�t�H���g�l��DD(���ɂ�)�ƂȂ�B*/
  select sysdate,trunc(sysdate),trunc(sysdate,'months'),trunc(sysdate,'year')
  from dual
  --�����ŋL�q�����Ƃ���܂ŕ\������A�L�q���Ȃ��ꍇ�f�t�H���g�l��DD(���ɂ�)�ƂȂ�
  
  
  
  
  /*�ϊ��֐�*/
  
  /*TO_NUMBER�֐�
    to_number(������[,����][,NLS�p�����[�^])...�������f�������Ŏw�肵���������
    NUMBER�^�ɕϊ����Ė߂�*/
    select to_number('\123,456.78','L999G999D99')
    from dual
    --123456.78
    
  /*TO_CHAR�֐�(���l�^)
    to_char(���l[,����][,NLS�p�����[�^])...���l���������f�������Ŏw�肵�������^��
    �ϊ����Ė߂�*/
    select to_char(12345.67,'L999,999.999'),to_char(12345.67,'L099,999,999')
    from dual
    --(\12,345.670),(\012,345.670)
    
  /*TO_CHAR�֐�(���t�^)
    to_char(���t[,����][,NLS�p�����[�^])...���t���������f�������Ŏw�肵�������^��
    �ϊ����Ė߂�*/
    select to_char(sysdate,'YYY-MM-DD DAY HH24:MI:SS')from dual
    
    select to_char(sysdate,'YYY-MM-DD DAY,','NLS_DATE_LANGUAGE=American')
    from dual
    
    select to_char(sysdate,'YYY"�N" MONTH DD"��"')