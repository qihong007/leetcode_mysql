/*
select ifnull(
    (select Salary from Employee order by Salary desc limit 1,1), null) 
    as SecondHighestSalary;
    
执行结果：
解答错误
显示详情
输入:
{"headers": {"Employee": ["Id", "Salary"]}, "rows": {"Employee": [[1, 100], [2, 100]]}}
输出
{"headers": ["SecondHighestSalary"], "values": [[100]]}
预期结果
{"headers":["SecondHighestSalary"],"values":[[null]]}

所以这里要加上distinct

这道题练习三个知识点： distinct， ifnull((语句),null)， （limit1,1找第二，limit1,2找第三）

执行用时 :165 ms, 在所有 MySQL 提交中击败了24.46% 的用户
内存消耗 :0B, 在所有 MySQL 提交中击败了100.00%的用户
*/

select ifnull(
    (select distinct Salary from Employee order by Salary desc limit 1,1), null) 
    as SecondHighestSalary;
