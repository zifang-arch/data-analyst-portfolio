-- 主題: WHERE 篩選 + NULL 判斷

-- 584. Find Customer Referee (LeetCode)
-- https://leetcode.com/problems/find-customer-referee/
-- 找出介紹人不是 2 號客戶的所有客戶(包含沒有介紹人的人)
-- 重點: referee_id <> 2 遇到 NULL 會被誤刪,要額外補 OR referee_id IS NULL
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
