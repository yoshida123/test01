--制約の作成
create table 社員
(社員番号 number(4) constraint pk_社員 primary key,
 社員名   varchar2(10) constraint U_社員名 unique,
 職務     varchar2(9),
 上司     number(4),
 入社日   date constraint nn_入社日 not null,
 給与     number(9) constraint ck_給与 check(給与>=0 and 給与<1000000),
 歩合給   number(9),
 部門番号 number(2) constraint fk_部門番号 references 部門(部門番号))
 
 --NOT NULL制約(列製制約文のみで指定可能)
 create table test4
 (col1 number constraint test4_col1_nn not null,
  col2 varchar2(10))
  
  
  --UNIQUE制約(同一値の入力禁止(一意キー))
  --列制約構文を使用して制約を定義
  create table test5
  (col1 number constraint test5_col1_U unique,
   col2 varchar2(10))
--col1列(number型)にunique制約を定義

insert into test5 values(100,'abc');
--新しく行を作成(col1列には100,col2列には文字列'abc')

insert into test5 values(100,'xyz');
--エラーが発生!(col1列はunique制約が定義されているので一意な値しか指定できない)

-UNIQUE制約を定義した列にNULLを複数行挿入
insert into test5 values(null,'aaa');
insert into test5 values(null,'bbb');

--複合UNIQUE制約の定義
create table test6
(col1 number,col2 varchar2(10),constraint col1_col2_U unique(col1,col2))
--表を作成時、col1とcol2列にunique制約を定義

insert into test6 values(1,'null');

insert into test6 values(1,'abc');

insert into test6 values(2,'abc');

insert into test6 values(2,'abc');
--ここでエラー発生!!
--複合UNIQUE制約の場合、collまたはco12列単独で見ると値が重複していても
--collとco12の組み合わせで値が重複していなければ行を挿入することができる。


--CHECK制約...入力値に対しての条件の設定(範囲チェックなど)
/*coll列の値は100から999まで、col2列の値は'M'または'F'であることを評
価するCHECK制約を定義。なおcoll列は列制約構文co12列は表制約構文で定義*/

create table test7
(col1 number constraint test7_col1_CK
 check (col1 between 100 and 999),
 col2 char(1),constraint test7_col2_CK check (col2 in ('M','F')))
 
 --複数列を使用したCHECK制約
 create table test8
 (col1 number,col2 number,constraint test8_NN_CK
  check (   (col1 is not null and col2 is null)
         or (col1 is null and col2 is not null)))
         

--PRIMARY KEY制約...主キーの宣言
--PRIMARY KEY制約を列制約構文で定義する
create table test9
(col1 number constraint test9_PK primary key,col2 varchar2(10))

--表制約構文でPRIMARY KEY制約を定義する
create table test10
(col1 number,col2 varchar2(10),
 constraint test10_PK primary key(col1))
 --表制約構文の場合は制約のタイプの後に定義する列名をかっこ内にしていする
 
 
 --FOREIGN KEY(外部キー)制約...参照整合性のチェック
 --部門表を参照するFOREIGN KEY制約
 create table 部門
 (部門番号 number constraint 部門_PK primary key,
  部門表   varchar2(20))
  
  create table 社員
  (社員番号 number constraint 社員_PK primary key,
   社員名   varchar2(20),
   部門番号 number constraint 社員_部門_FK references 部門(部門番号))
   
--表制約構文を使用し、同じ表の異なる行を参照する
create table 社員2
(社員番号 number constraint 社員2_PK primary key,
 社員名   varchar(20),
 上司番号 number,
 部門番号number,
constraint 社員2上司_FK foreign key (上司番号)
references 社員2(社員番号))


--既存表から新しい表の作成
create table 社員_営業 as
select 社員番号,社員名,給与 from 社員
where 部門番号 = 30
--社員表から部門番号30の行のみ抽出した社員_営業表を作成

--表を読取り専用にする
alter table 社員 read only

--読取り専用の表を削除する
alter table 社員 drop column 給与
--給与列の削除はデータにアクセスしてるのでエラーになる

drop table 社員 purge
--表の削除はデータにアクセスしているわけではないので実行できる

--読取り専用状態の表を書き込み可能モードに変更するには、READ WRITEを指定
alter table 社員 read write



--表の削除
drop table 社員
--社員表の削除を行っている

--ごみ箱から表をリストアする(元に戻す)
select original_name,type,operation from recyclebin
--ごみ箱の中身を確認

flashback table 社員 to before drop
--フラッシュバック完了しました。


--ビューの作成
--FORCEオプションを指定するとビューの基となるオブジェクトが存在しない場合
--でも、ビューを作成することができる
create or replace force view 部門人数
as select 部門番号,COUNT(*) 人数
from 全社員
group by 部門番号
--ビューが作成されたがコンパイルエラー

--基となる表を作成後、ビューを再問合せしてみる
rename 社員2 to 全社員

--の後に問い合わせると実行できる
select * from 部門人数

--部門番号が10の行だけを対象にしたビューに行を1件挿入する
create or replace view 部門10
as select 部門番号,社員番号,社員名,入社日
from 社員
where 部門番号 = 10

insert into 部門10
values(30,8001,'野口',to_date('20080401','YYYYMMDD'))

--WITH CHECK OPTIONを指定したビュー
create or replace view 部門10
as select 部門番号,社員番号,社員名,入社日
from 社員
where 部門番号 = 10
with check option constraint 部門10_CK

--ビューの削除
drop view 社員一覧

--100から始めて10ずつ増分する順序を作成する
create sequence 注文SEQ1
start with 100
increment by 10
--start withとincrement by以外は省略したので上限値なしで
--循環しない、また事前に20個の値をメモリー上に保持する、注文SEQ1という名の
--順序が作成された


--increment byにマイナスの値を指定することで降順に値を生成することができる
create sequence 注文SEQ2
start with 100
increment by -10
maxvalue 100


--SELECT文を使用して順序を生成する
select 注文SEQ2.nextval from dual
--100

select 注文SEQ2.nextval from dual
--90

select 注文SEQ2.nextval from dual
--80

--現在の生成済みの値を確認する
select 注文SEQ1.currval,注文SEQ2.currval from dual
--CURRVALは現セッション内で生成した最後の値を返す

--セッションとはログインからログアウトのことでログアウトするとセッションは
--終了する。再度同じユーザーでログインしても異なるセッションで生成した値
--を確認することはできない。

--順序の削除にはDROP SEQUENCE文を使用する
drop sequence 注文SEQ1
--順序を削除しても、既に生成した値が消えることはない。