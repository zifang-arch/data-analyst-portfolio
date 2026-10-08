-- 主題: 基礎子查詢 + Anti-Join

-- Find Customer Referee 延伸練習: 找出曾被別人推薦過的人
-- 重點: WHERE id IN (子查詢) ,子查詢先算出「曾被推薦過的 id 清單」
SELECT name
FROM Customer
WHERE id IN (
  SELECT referee_id FROM Customer WHERE referee_id IS NOT NULL
);


-- 1978. Employees Whose Manager Left the Company (LeetCode)
-- https://leetcode.com/problems/employees-whose-manager-left-the-company/
-- 找出主管已離職(manager_id 查無此人)且薪水低於 30000 的員工
-- 重點: anti-join(LEFT JOIN + IS NULL)比 NOT IN 更穩健,
--       NOT IN 遇到清單裡有 NULL 會整個失效;
--       記得排除 manager_id 本來就是 NULL(本來就沒有主管)的情況
SELECT e1.employee_id
FROM Employees e1
LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id
WHERE e2.employee_id IS NULL
  AND e1.manager_id IS NOT NULL
  AND e1.salary < 30000
ORDER BY e1.employee_id;


-- 619. Biggest Single Number (LeetCode)
-- https://leetcode.com/problems/biggest-single-number/
-- 找出只出現一次的數字裡最大的一個,沒有的話顯示 NULL
-- 重點: 子查詢 + GROUP BY/HAVING count=1 找出「只出現一次」的數字;
--       要用 MAX() 不能用 ORDER BY+LIMIT,因為沒有符合條件的資料時,
--       MAX() 仍會回傳一列 NULL,ORDER BY+LIMIT 則會回傳 0 列
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
  SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1
);
