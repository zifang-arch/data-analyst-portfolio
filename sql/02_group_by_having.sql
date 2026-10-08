-- 主題: GROUP BY + HAVING + 聚合函數

-- 596. Classes More Than 5 Students (LeetCode)
-- https://leetcode.com/problems/classes-more-than-5-students/
-- 找出選課人數 >= 5 人的課程
-- 重點: 篩選聚合後的結果要用 HAVING,不能用 WHERE,也不能把條件塞進 SELECT
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;


-- Top Earners (HackerRank)
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem
-- 找出總收入(months * salary)最高的金額,以及達到這個金額的員工人數
-- 重點: 先算出計算欄位(months*salary),再 GROUP BY + ORDER BY + LIMIT 取最大值那組
SELECT months * salary AS earnings, COUNT(*)
FROM Employee
GROUP BY months * salary
ORDER BY months * salary DESC
LIMIT 1;
