--索引

--社員名に索引を付ける場合
create index 社員名_INDEX
on 社員 (社員名);

--索引の削除
drop index 社員名_INDEX;

--シノニム
--データベース管理者がパブリックシノニムを作成する
create public synonym 全部門
for study.部門;

--シノニムを削除する場合
drop synonym emp;
--empという名前のシノニムの削除


--副問合せ
--SELECT句での使用例
select 社員名,(case when 部門番号 = (select 部門番号 from 部門
                                      where 部門名 = '営業')
                  then '関西' else 'その他' end)
from 社員
where 職務 = '部長';

--ORDER BY句での使用例
select 社員名,部門番号 from 社員 S
where 職務 = '部長'
order by (select 部門名 from 部門 B
          where B.部門番号 = S.部門番号);
          
--SET句での使用例
update 社員
set 給与 = (select max(給与) from 社員)
where 社員番号 = 7566;

--VALUES句での使用例
insert into 社員
(社員番号,部門番号,社員名)
values((select max(社員番号)+1 from 社員),20,'中村');

--FROM句に使用する副問合せ
select S.部門番号,S.社員名,S.給与,H.部門平均
from 社員 S,(select 部門番号,avg(給与) 部門平均
            from 社員
            group by 部門番号) H
where S.給与 > H.部門番号
and S.部門番号 = H.部門番号
order by S.部門番号,S.給与;

--JOIN句に使用する副問合せ
select S.部門番号,S.社員名,S.給与,H.部門平均
from 社員 S
JOIN (select 部門番号,avg(給与) 部門平均
     from 社員
     group by 部門番号) H
on   S.部門番号 = H.部門番号
where S.給与 > H.部門平均
order by S.部門番号,S.給与;

--UPDATE句での使用
update (select 給与 from 社員
        where 部門番号 = 10)
set 給与 = 給与*1.1;

--INSERT INTO句での使用
insert into (select 社員番号,社員名,部門番号 from 社員)
values(9000,'岩沢',社員);

insert into (select 社員番号,社員名,部門番号 from 社員)
select max(社員番号)+1,'岩沢',30 from 社員;

--WITH CHECK OPTION句を記述した副問合せ(DELETE)
delete from (select * from 社員 where 部門番号 = 10
            with check option)
where 部門番号 = 10;

--1つの表での結合
select 部下.社員番号,部下.社員名,部下,上司,上司.社員番号,上司.社員名
from 社員 部下,社員 上司
where 部下.上司 = 上司.社員番号;

--3つ以上の表の結合
--各部門に所属している社員の給与等級を求める場合
select x.部門名,y.社員名,y.給与,z.等級
from 部門 x,社員 y,給与等級 z
where x.部門番号 = y.部門番号
and y.給与 between z.最低給与額 and z.最高給与額;
order by x.部門名,z.等級



--データディクショナリの問合せ
/*
・USER_TABLES
・USER_OBJECTS
・USER_CATALOG(シノニム名 CAT)
*/

--ユーザーが所有する表の情報を表示する場合の例
select * from user_tables

--ユーザーが所有するデータベースオブジェクトの種類を表示する場合の例
select distinct object_type from user_object

--ユーザーが所有する表、ビュー、シノニム、順序を表示する場合の例
select * from cat

--表にコメントを追加する
comment on table 社員 is '社員の情報';
--社員表にコメントを追加する場合

--表のコメントを表示
select * from user_tab_comments
where table_name like '社員%';

--コメントを削除する場合は、次のように空の文字列('')をコメントに設定する
comment on table 社員 is '';

--表にたいするコメントはxxx_TAB_COMMENTSビュー
--列に対するコメントはxxx_COL_COMMENTSビュー