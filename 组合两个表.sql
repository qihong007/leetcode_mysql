/*
Write your MySQL query statement below
select A.FirstName, A.LastName, B.City, B.State from Person as A, Address as B where A.PersonId = B.PersonId;
第一句有一个问题，就是where Person表有内容但Address表没有内容则不会显示出来，需要用到left join，address表没有的内容则显示null

因为表 Address 中的 personId 是表 Person 的外关键字，所以我们可以连接这两个表来获取一个人的地址信息。
考虑到可能不是每个人都有地址信息，我们应该使用 outer join 而不是默认的 inner join。

按题意要求，使用outer join时可以保证指定表的每条记录都出现----即使没有匹配, outer join又可以分为left join, right join, full join。
我们想让Address表中即使没有Person，也让Person有Address属性,所以Address为必须出现表，那么我们可以用 Person表 left join Address，或者反过来用right join。

我看了一下运行效率比较高的朋友的解法，在join前先对Address表处理，去除Address里的重复项，然后让Person left join Address。

select A.FirstName, A.LastName, B.City, B.State from Person A left join (
select distinct PersonId, City, State from Address) B
on A.PersonId = B.PersonId;

这样做的好处是，在数据量特别大而且重复量也特别大时，可以节省join次数，从而节省效率，当然当数据量不那么大，重复数据不那么多时，反而会影响效率，大家可以说说自己看法，一起进步，觉得可以请点赞谢谢。


执行用时 :193 ms, 在所有 MySQL 提交中击败了37.97% 的用户
内存消耗 :0B, 在所有 MySQL 提交中击败了100.00%的用户
*/

select FirstName, LastName, City, State
from Person left join Address
on Person.PersonId = Address.PersonId
;
