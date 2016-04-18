--ON句を使用した等価結合
select 部門.部門番号,部門名,所在地,社員番号,社員名
from 社員 join 部門--1つ目の表はFROM句、2つ目以降の表はJOIN句に記述
on 部門.部門番号 = 社員.部門番号--結合条件を指定するにはON句を使用
--ON句を使用すれば名前が異なる結合列や任意の条件を指定することができる
where 部門.部門番号 <= 20;--WHEREで検索条件

--検索条件には、ON句のANDキーワードを使用してもかまわない。
select 部門.部門番号,部門名,所在地,社員番号,社員名
from 社員 join 部門
on 部門.部門番号 = 社員.部門番号
and 部門.部門番号 <= 20;

--NATURAL JOIN句を使用した自然結合
select 部門番号,部門表,所在地,社員番号,社員名
from 部門
natural join 社員
--部門表と社員表には、データ型も列名も同じ部門番号列があり、この列を
--結合列として、NATURAL JOIN句を使用した自然結合

--検索条件を指定する場合
select 部門番号,部門名,所在地,社員番号,社員名
from 部門
natural join 社員
where 部門番号 <=20--NATURAL JOIN句の検索条件は必ずWHERE句で指定!!

--USINGを使用した自然結合
--データ型も名前も同じ部門番号列を結合列として、USING句を使用した自然
--結合もできる
select 部門番号,部門名,所在地,社員番号,社員名
from 部門 join 社員
using(部門番号)

--共通の列は複数存在するが、その中の一部の列を結合条件として使う場合
select 部門番号,部門2.名前,社員番号,社員2.名前
from 部門2 join 社員2
using(部門番号)

--範囲を表現するBETWEEN演算子を用いて2つの表を結合する
select 社員名,給与,等級,最低給与額,最高給与額
from 社員 join 給与等級
on 給与 between 最低給与額 and 最高給与額

--ON句を使用した自然結合
select 部下.社員番号,部下.社員名,部下.上司,上司.社員番号,上司.社員名
from 社員 部下 join 社員 上司
on 部下.上司 = 上司.社員番号
/*FROM句およびJOIN句において、表名の後ろに1つ以上の
空白をあけて記述した名称は別名として扱われる。
別名を利用したことで、あたかも異なる2つの表、部下表と上司表の互いの行
を結合したかのように、結果を求めることができる*/

--ON句を使用した3つの表の結合
select 部門.部門番号,部門名,所在地,社員番号,社員名,給与,等級
from 部門
 join 社員
 on 部門.部門番号 = 社員.部門番号
  join 給与等級
  on 給与 between 最低給与額 and 最高給与額
  
--NATURAL JOIN句,ON句を使用した3つの表の結合
select 部門番号,部門名,所在地,社員番号,社員名,給与,等級
from 部門
natural join 社員
join 給与等級
　on 給与 between 最低給与額 and 最高給与額
 
 
/*FROM句に部門表を記述した場合、部門表には存在するが、社員表には一致
する行がない部門番号の行を表示することができる。*/

--左側外部結合
select d.部門番号,d.部門名,d.所在地,e.社員番号,e.社員名
from 部門 d
left outer join 社員 e
on (d.部門番号 = e.部門番号)


/*JOIN句に社員表を記述した場合、社員表には存在するが、部門表には一致す
る行がない部門番号がNULLの行を表示することができる。*/

--右側外部結合
select d.部門番号,d.部門名,d.所在地,e.社員番号,e.社員名
from 部門 d
right outer join 社員 e
on (d.部門番号 = e.部門番号)

--完全外部結合
select d.部門番号,d.部門名,d.場所,e.社員番号,e.社員名
from 部門 d
full outer join 社員 e
on (d.部門番号 = e.部門番号)

--デカルト値を明示的に求めるためのCROSS JOIN句
--クロス結合では両方の表に存在する列は表名で修飾する必要がある
select 部門.部門番号,部門名,所在地,社員番号,社員名
from 部門
cross join 社員

--副問合せの使用方法
--全社において最高給与額とその金額をもらっている人の名前を求める
select 給与,社員 from 社員
where 給与 = (select max(給与) from 社員)--()内が副問合せ
--上記のような1行だけ戻す副問合せを単一行副問合せと言う

--入社日が桜井さんより新しく、給与は白井さんより低い社員を求める
select 社員名,入社日,給与 from 社員
where 入社日 > (select 入社日 from 社員 where 社員名 = '桜井')
and 給与 < (select 給与 from 社員 where 社員名 = '白井')



--複数行問合せ

--INを使用した比較
--部門番号10の部門に所属する社員と同じ職務の社員を求める
select 部門番号,社員名,職務
from 社員
where 職務 in (select 職務 from 社員 where 部門番号 = 10)
order by 部門番号--昇順に並べ替え

--部門番号10の部門に所属するいずれかの社員の給与額以上の社員を求める
select 部門番号,社員名,給与,
from 社員
where 給与 >=any (select 給与 from 社員 where 部門番号 = 10)
order by 部門番号
-->=anyは副問合せが戻す最も小さな値以上であるかどうかを評価する!

--部門番号10の部門に所属するすべての社員の給与額以上の社員を求める
select 部門番号,社員名,給与,
from 社員
where 給与 >=all (select 給与 from 社員 where 部門番号 = 10)
order by 部門番号
-->=allは副問合せが戻す最も大きな値以上であるかどうかを評価する!

--部下のいる社員を求める
select 部門番号,社員番号,社員名
from 社員
where 社員番号 in (select 上司 from 社員)
order by 部門番号

--副問合せがNULLを戻さないようにする
select 部門番号,社員番号,社員名
from 社員
where 社員番号 not in (select 上司 from 社員 where 上司 is not null)
order by 部門番号

--会社全体の平均給与より高い給与をもらっている部門を求める
select 部門番号,avg(給与)
from 社員
group by 部門番号
having avg(給与) > (select avg(給与) from 社員)

--部門の最低給与額が、部門番号20の部門に所属しているいずれかの社員より
--高い部門を求める
select 部門番号,min(給与)
from 社員
group by 部門番号
having min(給与) >any (select 給与 from 社員 where 部門番号 = 20)



--集合演算子の使用

--社員番号列と部門番号列を使用したUNION ALL
select 社員番号 from 社員
union all
select 部門番号 from 部門
--社員表から戻される行と部門表から戻される行が合わさって1つの結果として
--もどされる。

--UNION演算子
select 社員番号 from 社員
union
select 部門番号 from 部門
--重複値を取り除くための過程により行がソート(並べ替え)される。

--MINUS演算子
select nvl(部門番号,99) from 部門
minus
select nvl(部門番号,99) from 社員
--最初の問合せでは選択されたが2番目以降の問合せでは選択されなかった
--重複を除くすべての行

--INTERSECT演算子
select nvl(部門番号,99) from 部門
intersect
select nvl(部門番号,99) from 社員
--すべての問合せで共通に選択された重複を除くすべての行を戻す

