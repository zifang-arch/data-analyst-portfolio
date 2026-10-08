-- 主題: LIKE 模糊比對 + 字串/排序函數

-- Weather Observation Station 7 (HackerRank)
-- https://www.hackerrank.com/challenges/weather-observation-station-7/problem
-- 查詢城市名稱結尾是母音(a,e,i,o,u)的城市,結果不重複
-- 重點: MySQL 不支援 LIKE '[aeiou]%' 這種寫法,要用 OR 一個個列出來;DISTINCT 去重複
SELECT DISTINCT city
FROM station
WHERE city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i'
   OR city LIKE '%o' OR city LIKE '%u';


-- Weather Observation Station 4 (HackerRank)
-- https://www.hackerrank.com/challenges/weather-observation-station-4/problem
-- 計算總筆數跟不重複城市數的差,代表「重複出現的次數」
-- 重點: COUNT(欄位) 跟 COUNT(DISTINCT 欄位) 的差異
SELECT COUNT(city) - COUNT(DISTINCT city)
FROM station;


-- Weather Observation Station 5 (HackerRank)
-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-- 找出城市名稱最短跟最長的各一個(重複時取字母排序最前面的)
-- 重點: LENGTH() 算字串長度;ORDER BY+LIMIT 找極值,搭配 ASC/DESC
SELECT city, LENGTH(city)
FROM station
ORDER BY LENGTH(city) ASC, city ASC
LIMIT 1;

SELECT city, LENGTH(city)
FROM station
ORDER BY LENGTH(city) DESC, city ASC
LIMIT 1;


-- Higher Than 75 Marks (HackerRank)
-- https://www.hackerrank.com/challenges/more-than-75-marks/problem
-- 查詢分數超過 75 分的學生姓名,依名字最後三個字母排序,同字母再依 ID 排序
-- 重點: RIGHT(欄位, n) 取字串最後 n 個字;ORDER BY 多重排序,前面的優先
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;
