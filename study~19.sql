select * from JOB_HISTORY where JOB_ID not in('IT_PROG','AC_MGR')

--職務が「部」から始まる行を検索
select distinct 職務 from 社員 
where 職務 not like '部%'

--歩合給がnullの社員名列の行を検索
select 社員名 from 社員
where 歩合給 is null

--歩合給がnullではない社員名列の行を検索
select 社員名 from 社員
where 歩合給 is not null

--職務が部長の行を、部門番号の昇順で並べ替え
select 部門番号,社員名,給与,職務
from 社員
where 職務 = '部長'
order by 部門番号

--職務が部長の行を、部門番号の降順(desc)で並べ替え
select 部門番号,社員名,給与,職務
from 社員
where 職務 = '部長'
order by 部門番号 desc

--職務が部長の行を、部門番号の昇順(デフォルトで昇順だが明示的にascを指定可能)に並べ替え
select 部門番号,社員名,給与,職務
from 社員
where 職務 = '部長'
order by 部門番号 asc

--select句で選択してない列でも指定して並べ替えることができる！
select 部門番号,社員名,給与,職務
from 社員
where 職務 = '部長'
order by 入社日

--並べ替えの基準となる列を列番号で指定することが可能
select 部門番号,社員名,給与,職務
from 社員
where 職務 in ('業務','部長')
order by 1,3 --部門番号(1番目)と給与(3番目)の列の昇順に行を並べ替えている

--「給与*12」の別名である「年収」で昇順に並べ替える
select 部門番号,社員名,給与*12 年収
from 社員
where 部門番号 = 30
order by 年収

--null　first(null値が先頭にくる)を使った並べ替え
select 社員名,歩合給
from 社員
where 部門番号 = 30
order by 歩合給 null first --null値が先頭にきて後は昇順

select 社員名,歩合給
from 社員
where 部門番号 = 30
order by 歩合給 desc null first --null値が先頭にきて後は降順

--null last(null値が最後にくる)を使った並べ替え
select 社員名,歩合給
from 社員
where 部門番号 = 30
order by null last --null値が最後に、他は昇順

select 社員名,歩合給
from 社員
where 部門番号 = 30
order by desc null last --null値が最後で、他は降順



/*数値関数*/

/*CEIL関数
  ceil( n )...n以上の最も小さい整数を戻す*/
  select ceil(14.8) from dual --14.8以上の最も小さい整数(15)を戻している

/*FLOOR関数
  floor( n )...n以下の最も大きい整数を戻す*/
  select floor(14.8) from dual --14.8以下の最も大きい整数(14)を戻している
  
  /*MOD関数
    mod(m,n)...mをnで割った余りを戻す*/
    select mod(9,4) from dual --9を4で割った余り(1)を戻す
    
  /*POWER関数
    power(m,n)...mをn乗した値を戻す*/
    select power(4,2) from dual --4を2乗(4*4)した値(14)を戻す
    
  /*SQRT関数
    sqrt(n)...nの平方根を戻す*/
    select sqrt(36) from dual --36の平方根(6)を戻す
    
  /*ROUND関数　四捨五入
    round(m[,n])...mは四捨五入したい元の数値、nは桁数(何桁目まで表示するか指定する)*/
    set numformat 99999.999
    select round(3456.789,2),round(3456.789,-2) from dual
  --3456.789の小数第2位まで表示させたいので小数第3位を四捨五入(左側)
  --桁数が負の数の場合は小数点の左、3456.789の10の位を四捨五入(右側)
  
/*TRUNC関数　切り捨て
  trunc(m[,n])...mは元の数、nは桁数(表示させたい桁数)*/
  set numformat 99999.999
  select trunc(3456.789,2),trunc(3456.789,-2) from dual
  --左側は小数点第2まで表示させたいので、第3位以降を切り捨て(3456.780)
  --右側は桁数が負の数なので、10の位から右側を切り捨て(3400.000)


  
/*文字関数*/

/*LENGTH関数
  length(文字)...文字列の長さを戻す*/
  select length('System Technology-i') from dual --文字数(19)が戻る
  
/*INSTR関数
  instr(文字列1,文字列2[,n,m])...文字列1のn番目の文字から文字列2の探索を開始し、
  文字列2がm番目に見つかった位置の値を戻す。mおよびnは省略可能でデフォルト値は1となる*/
  select instr('System Technology-i','E') from dual
  /*デフォルト値は1だからSystem Technology-iの1文字目から1番目に見つかるEの値(5)*/
  
  select instr('System Technology-i','E',8,1) from dual
  /*System Technology-iの8文字目から1番目に見つかるEの値(9)が戻る*/
  
/*SUBSTR関数
  substr(文字列,n[,m])...文字列のn番目の文字からm文字の長さの文字列を抜き出して戻す
  mは省略可、その際は最後の文字までを戻す。nが負の時は文字列の終わりから逆方向に処理
  mに1より小さい値は指定できない*/
  select substr('System Technology-i',8,10) from dual
  --8番目の文字から10文字抜き出すので(Technology)が戻る
  
  select substr('System Technology-i',8) from dual --mが省略されてるので最後まで
  --8番目の文字から最後まで抜き出すので(Technology-i)が戻る
  
  select substr('System Technology-i',-8) from dual--負の場合は終わりから処理する
  --終わりから8文字なので(nology-i)が戻る
  
  /*INSTRとSUBSTRを組み合わせて使う*/
  select substr('System Technology-i',8) as "抜き出した文字"
  instr(substr(substr('System Technology-i',8),'e',1)) as "「e」の位置"
  from dual
  /*抜き出した文字がTechnology-iでその文字の1番目の文字から(省略されてるのでデフォルト
  の1)1番目に見つかるeの値(2)が戻る*/
  
/*INITCAP関数
  initcap(文字列)...各単語の最初の文字を大文字残りの文字を小文字にして戻す*/
  select initcap('system technology-i') from dual
  --System Technology-i となる
  
/*UPPER関数
  upper(文字列)...文字列を大文字にして戻す*/
  select upper('system technology-i') from dual --SYSTEM TECHNOLOGY-I　となる
  
/*LOWER関数
  lower(文字列)...文字列を小文字にして戻す*/
  select lower('System Technology-i') from dual --system technology-i　となる
  
/*CONCAT関数
  concat(文字列1,文字列2)...文字列1と文字列2を連結して、1つの文字列にして戻す*/
  select concat('Good ','Morning') from dual --Good Morning　となる
  
/*LPAD関数
  lpad(文字列,n[,バンディング文字])...文字列がn桁になるように左にバンディング文字
  を埋めて戻す。バンディング文字は省略可能でデフォルトは空白となる*/
  select 社員番号,lpad(社員名,10,'*') from 社員
  where 部門番号 = 30 --
  
/*RPAD関数
  LPADとは逆に今度は右側にバンディング文字を埋めて戻す*/
  select 社員番号,rpad(社員名,10,'*') from 社員
  where 部門番号 = 30
  
/*TRIM...文字列の先頭(LEADING)、最後(TRAILING)、または先頭と最後の両方(BOTH)から
  文字を切り捨てる。LEADINGまたはTRAILINGを省略した場合デフォルト値はBOTHとなる*/
  select trim(leading '日' from '日曜日') from dual
  --日曜日から先頭の日を切り捨てるから(曜日)となる
  
  select trim(trailing '日' from '日曜日') from dual
  --最後の日を切り捨てるから(日曜)となる
  
  select trim(both '日' from '日曜日') from dual
  --両方の日を切り捨てるから(曜)となる
  
/*REPLACE関数
  replace(文字列1,文字列2,[,文字列3])...文字列1の中から文字列2を探し、文字列3に
  置換する。文字列3を省略した際は文字列1からすべての文字列2が取り除かれる*/
  select replace('(株)翔泳社','(株)','株式会社') from dual
  --(株)翔泳社の(株)が株式会社に置換され(株式会社翔泳社)となる
  



/*日付関数*/

--日付の演算
select to_date('08-12-31')+90 from dual　-- 09-3-31となる
select to_date('08-12-31')-90 from dual -- 08-10-02となる

--日付の加算はエラーとなる！
select to_date('09-01-01') - to_date('08-12-01') from dual --日付同士はエラー！

/*ADD_MONTHS関数
  add_months(日付,n)...日付にnカ月足した値を戻す。nが負の場合はnカ月引いた値を戻す*/
  select add_months('08-10-15',1),add_months('08-10-31',-2) from dual
  --(08-11-15),(08-08-15)
  
  select add_months('08-10-31',1) from dual
  /*(08-11-30)となる、単純に30日足してるわけではないので月末を使用した場合はnカ月後の
  月末になる！*/
  
/*LAST_DAY関数
  last_day(日付)...指定した日付の月の月末日を戻す*/
  select last_day('08-06-02') from dual --(08-06-30)
  
/*NEXT_DAY関数
  next_day(日付,曜日)...次の曜日を迎える日付を戻す*/
  select next_day('08-12-01','月曜日')　from dual --次に来る月曜日の日付
  --(08-12-08)
  
/*MONTHS_BETWEEN関数
  months_between(日付1,日付2)...日付1と日付2の間の月数を戻す*/
  select months_between('08-12-01','08-01-01'),('08-01-01','08-12-01')
  from dual
  --日付1と2の間の月数を求めるので(11),(-11)となる
  
/*SYSDATE関数
  sysdate...データベースの現在の日時を戻す*/
  select sysdate drom dual --DBの現在の日付、時間が戻る
  
/*TRUNC/ROUND関数
  trunc(日付,[,書式])...書式で指定した単位に、日付データを切り捨てる、書式は
  省略可能でデフォルト値はDD(日にち)となる。
  
  round(日付,[,書式])...書式で指定した単位に、日付データを四捨五入する、書式は
  省略可能でデフォルト値はDD(日にち)となる。*/
  select sysdate,trunc(sysdate),trunc(sysdate,'months'),trunc(sysdate,'year')
  from dual
  --書式で記述したところまで表示する、記述しない場合デフォルト値はDD(日にち)となる
  
  
  
  
  /*変換関数*/
  
  /*TO_NUMBER関数
    to_number(文字列[,書式][,NLSパラメータ])...書式モデル書式で指定した文字列を
    NUMBER型に変換して戻す*/
    select to_number('\123,456.78','L999G999D99')
    from dual
    --123456.78
    
  /*TO_CHAR関数(数値型)
    to_char(数値[,書式][,NLSパラメータ])...数値を書式モデル書式で指定した文字型に
    変換して戻す*/
    select to_char(12345.67,'L999,999.999'),to_char(12345.67,'L099,999,999')
    from dual
    --(\12,345.670),(\012,345.670)
    
  /*TO_CHAR関数(日付型)
    to_char(日付[,書式][,NLSパラメータ])...日付を書式モデル書式で指定した文字型に
    変換して戻す*/
    select to_char(sysdate,'YYY-MM-DD DAY HH24:MI:SS')from dual
    
    select to_char(sysdate,'YYY-MM-DD DAY,','NLS_DATE_LANGUAGE=American')
    from dual
    
    select to_char(sysdate,'YYY"年" MONTH DD"日"')