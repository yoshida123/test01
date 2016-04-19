--INSERT文
insert into 社員 (社員番号,社員名,部門番号)
values (9999,'高山',20)


/*全列に値を指定したい場合は、すべての列を任意の順序で指定するか表名の
後ろの列名のリストを省略することができる。列名のリストを省略した場合、
値のリストは表作成時に定義した列の順序に従って記述される*/

--列名のリストを省略したINSERT文
insert into 社員
values (1111,'安藤','営業',7788,
to_date('2000-04-01','yyyy-mm-dd'),240000,50000,30)

--NULL値の挿入
--列の値にNULL値を指定する場合は、NULLキーワードを使用する
insert into 社員
values (2222,'佐藤','業務',7788,
to_date('1999-04-01','yyyy-mm-dd'),600000,NULL,30)

--特定の列だけを指定したINSERT文を実行した場合、指定されなかった列に
--はNULL値が挿入される。
insert into 社員 (社員番号,社員名,部門番号)
values (3333,'石井',30)

--文字列と日付は、VALUES句で空の文字列(")を指定し、NULLを挿入す
--ることもできる。

--NULL値以外にも、今日の日付を返すSYSDATE関数を使用可
insert into 社員 (社員番号,社員名,入社日,部門番号)
values (5555,'小林',SYSDATE,30)



--UPDATE文
/*UPDATE文は、既存行の列の値を変更したいときに使用する
SET句に変更したい列名と値、WHERE句に変更の対象となる行の条件を記述
WHERE句は省略することができるが、省略すると全行が更新される*/

update 社員
set 歩合給 = 10000

--桜井の担当を部長に更新する
update 社員
set 職務 = '部長'
where 社員名 = '桜井'

--SET句は定数だけでなく、関数や計算式なども指定可

--桜井の給与を2倍に更新する
update 社員
set 給与 = 給与*2
where 社員名 = '桜井'

--複数列指定できる その際「,」を使用
update 社員
set 職務 = '主任',給与 = 給与/2
where 社員名 = '桜井'



--DELETE文
/*DELETE文は、既存行を削除したいときにしようする
FROM句の後ろに表名を、WHERE句に削除の対象となる行の条件を記述
WHERE句は省略することができるが、省略すると全行が削除される*/

--社員表から社員番号1111の行を削除する
delete from 社員
where 社員番号 = 1111

--DELETE文は、FROMキーワードを省略可

--社員表から全行削除
delete from 社員;


--TRUNCATE(表の切り捨て)文
--表からすべての行を削除する場合には、TRUNCATE TABLE文を使用する
--社員表を切り捨てる場合
truncate table 社員

--副問合せを用いたINSERT文
--VALUES句の代わりに副問合せを使用した場合
insert into 営業マン (enpno,name,hiredate,sal,comm)
from 社員
where 職務 = '営業'

--副問合せを用いたUPDATE文
--UPDATE文のWHERE句で副問合せを使用した場合
update 社員
set 給与
where 給与 = (select min(給与) from 社員)

--SET句で副問合せを使用した場合
update 社員
set 給与 = (select max(給与) from 社員
              where 職務 = '営業')
  ,歩合給 = (select max(歩合) from 社員
              where 職務 = '営業')
where 社員番号 = 7844

--複数列の更新は、次のように記述することができる
update 社員
set (給与,歩合給) = (select MAX(給与),MAX(歩合給)
                      from 社員
                      where 職務 = '営業')
where 社員番号 = 7844

--副問合せを用いたDELETE文
--DELETE文のWHERE句においても副問合せを使用することができる
delete from 社員
where 給与 = (select max(給与) from 社員)


--COMMIT(トランザクションの確定を行うコマンド)
--一度コミットしたトランザクションを取り消す(ROLLBACK)ことはできない

--スキーマ名
--他スキーマのオブジェクトを扱うときには、次のように、オブジェクト名の前
--前にスキーマ名を指定する。(オブジェクト = 表)

--SYSTEMユーザーが他スキーマ(STUDY)の部門表を検索する
select * fom study.部門

--CREATE TABLE文(表の作成)
create table 大阪社員
(社員番号 number,社員名 varchar,入社日 date)

--作成された表を確認するにはDESCRIBE(DESC)コマンドを使用
desc 大阪社員

