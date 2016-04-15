--case式
desc JOB_HISTORY
--select * from JOB_HISTORY
select employee_id,job_id,case job_id when 'AC_ACCOUNT' then 'AC'
                                      when 'ST_CLERK' then 'ST'
                                      else 'その他' end
from JOB_HISTORY

/*DECODE関数
DECODE(式,値1,戻り値1,...値n,戻り値n[,戻り値z])
式の値が値1の場合は戻り値1を、値nの場合は戻り値nを戻す。いずれでもない場合
は戻り値z(省略時はNULL)を戻す*/
select 職務,給与,DECODE(職務,'部長','MANAGER','営業','SALESMAN','その他')
from 社員 where 部門番号 = 30

--関数のネスト
--単一行関数は任意のレベルでネスト(入れ子)できる、ネストされた関数は、
--まず内側のレベルが評価され外側のレベルへと評価される
select 部門番号,社員名,職務,DECODE(部門番号,30,NVL(TO_CHAR(歩合給,'L999,999'),'支払われていません'),'対象部門ではありません') 歩合給の有無
from 社員 order by 部門番号,職務

--AVG関数
--AVG(n)...nの平均値を戻す

--給与の平均値を求める場合
select avg(給与) from 社員

--COUNT関数
--COUNT(式)...式がNULLでない行を戻す！　*(アスタリスク)を指定すると
--重複値及びNULL値を含めて行数を戻す！　要は*だから全部ってこと！
select count(*),count(給与),count(歩合給) from 社員

select count(職務),count(distinct 職務) from 社員
--引数の異なる値を処理(重複をまとめる)

--MAX関数
--MAX(式)...式の最大値を求める
select max(給与),max(職務),max(入社日) from 社員
--文字は文字コードの最も大きい値、日付は最も新しい日付を返す

--MIN関数
--MIN(式)...式の最小値を求める
select min(給与),min(職務),min(入社日) from 社員
--文字は文字コードの最も小さい値、日付は最も古い日付を返す

--SUM関数
--SUM(n)...nの合計値を戻す
select sum(給与) from 社員
--給与列の合計値を返す

--GROUP BY 句
--式の値に基づいて行のグループを求めることができる
select 部門番号,max(給与) from 社員
group by 部門番号
--社員表から部門ごとの最高給与額を求める、group byの後でどの列を対象に
--グループ化してるのかが分かる

--GROUP BY 句に複数の列を指定
select 部門番号,職務,MAX(給与) from 社員
group by 部門名,職務
--部門ごとに各職務の最高給与額を求めている

--HAVING句 グループ化された行に条件を指定することができる
--HAVING句は　GROUP BY句の前後どちらに記述しても構わない
select 部門番号,MAX(給与) from 社員
group by 部門番号
having max(給与) >= 300000

select 部門番号,MAX(給与) from 社員
having max(給与) >= 300000
group by 部門番号
--どちらも最高給与額が300000以上の部門番号を求めている

--select句で指定されていない列をHAVING句で条件付けすることも可能
select 部門番号,MAX(給与) from 社員
group by 部門番号
having count(*) >= 5
--count(*)→行数＝人数ということ

