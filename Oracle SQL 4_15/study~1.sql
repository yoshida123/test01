/*--サブクエリー
desc JOB_HISTORY
select * from JOB_HISTORY
select * from JOB_HISTORY where DEPARTMENT_ID >
(select department_id from job_history where job_id = 'SA_REP')
--まずサブクエリーが実行され、それを検索条件にして最終的なデータを返している

--nullであるかどうか調べるには is null を使う
desc DEPARTMENTS
select * from DEPARTMENTS
select * from DEPARTMENTS where MANAGER_ID is null

--関数　データそのものではなく、データからの計算結果などを返す

count():行数
sum():合計
avg():平均
max():最大値
min():最小値

--count(通常は*)
select count(*) from DEPARTMENTS

--条件付きcount
select count(*) from DEPARTMENTS where MANAGER_ID is null
--nullの行数

select sum(manager_id) from DEPARTMENTS
--manager_idの値の合計値


--insert update delete の使い方
既に存在するテーブルに対して、データを登録したり、更新したり、削除したり
するときに使用する！　データベースのデータを操作する場合にはこれらが必須
になる。

insert　→テーブルにデータを登録する際に使う。
insert into...values 1件ずつデータを登録する
insert into...select 別のテーブルからselectで選んだデータを登録する

insert into テーブル名 (項目名) values (データ)
の形式で記述する、項目名とデータは形式と数を必ず合わせる！

desc DEPARTMENTS
select insert into departments 
(departments_ID,departments_name,manage_id,location_id) 
values (280,'csfact',210,1700)

create table ash_table
(id integer,name text,yomi,text,lv integer,hp integer,mp integer)


select * from 部門　where 部門番号= '10'

--NVL関数
--NVL(式,値)...式の値がNULLの場合、値を戻す。NULL以外であれば式を戻す

desc DEPARTMENTS
--select MANAGER_ID from DEPARTMENTS order by MANAGER_ID
select MANAGER_ID,NVL(MANAGER_ID,0) from DEPARTMENTS
*/

--NVL2関数
--NVL2(式,値1,値2)...式の値がNULL以外であれば値1、NULLの場合は値2を返す
desc DEPARTMENTS
--select * from DEPARTMENTS
select department_name,manager_id,location_id,nvl2(manager_id,manager_id+location_id,location_id) NVL2
from DEPARTMENTS

--COALESCE関数
--COALESCE(式1,式2,…式n)...式1から式nまでの中の最初のNULLでない式を返す
--歩合給がNULLでなければ歩合給を、NULLの場合は上司を、上司もNULLの場合は
--給与を返す場合
select 歩合給,上司,給与,COALESCE(歩合給,上司,給与)
from 社員
--歩合給がNULLでなければ歩合給、NULLだったら次は上司を、上司もNULLだったら
--給与を返す