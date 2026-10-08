-- 主題: INNER JOIN / LEFT JOIN

-- 175. Combine Two Tables (LeetCode)
-- https://leetcode.com/problems/combine-two-tables/
-- 顯示每個人的 firstName, lastName, city, state,即使沒有地址資料也要顯示(city/state 為 NULL)
-- 重點: 要保留左表全部資料,用 LEFT JOIN
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;


-- 1068. Product Sales Analysis I (LeetCode)
-- https://leetcode.com/problems/product-sales-analysis-i/
-- 顯示每筆銷售紀錄的 product_name, year, price
-- 重點: 兩邊都要有對應資料,用 INNER JOIN;配對條件務必寫在 ON,不要寫在 WHERE
SELECT p.product_name, s.year, s.price
FROM Sales s
INNER JOIN Product p ON s.product_id = p.product_id;


-- African Cities (HackerRank)
-- https://www.hackerrank.com/challenges/african-cities/problem
-- 查詢所有大洲是 Africa 的城市名稱
-- 重點: 單純篩選用 WHERE,不是 HAVING(這題沒有 GROUP BY)
SELECT city.name
FROM city
INNER JOIN country ON city.countrycode = country.code
WHERE country.continent = 'Africa';


-- Average Population of Each Continent (HackerRank)
-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
-- 查詢每個大洲的平均城市人口,無條件捨去到整數
-- 重點: SELECT 裡有普通欄位(continent)又有聚合函數(AVG),continent 要放進 GROUP BY;
--       無條件捨去用 FLOOR(),不是 ROUND()
SELECT country.continent, FLOOR(AVG(city.population))
FROM city
INNER JOIN country ON city.countrycode = country.code
GROUP BY country.continent;
