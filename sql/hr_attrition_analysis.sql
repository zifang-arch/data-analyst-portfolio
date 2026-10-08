-- IBM HR Analytics Employee Attrition 分析
-- 資料來源: https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset
-- 1470 筆員工紀錄，分析離職率與各項因子的關係

-- 1. 整體離職率
SELECT
  COUNT(*) AS 總人數,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS 離職人數,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 離職率
FROM "HR-Attrition-clean";
-- 結果: 總人數 1470，離職人數 237，離職率 16.12%


-- 2. 各部門離職率
SELECT
  Department,
  COUNT(*) AS 總人數,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS 離職人數,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 離職率
FROM "HR-Attrition-clean"
GROUP BY Department
ORDER BY 離職率 DESC;
-- 結果: Sales 20.63% > Human Resources 19.05% > Research & Development 13.84%
-- 洞察: 業務部門離職率最高，而且人數比 HR 多很多，是優先關注對象


-- 3. 加班 vs 離職率
SELECT
  OverTime,
  COUNT(*) AS 總人數,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS 離職人數,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 離職率
FROM "HR-Attrition-clean"
GROUP BY OverTime
ORDER BY 離職率 DESC;
-- 結果: 加班員工離職率 30.53%，不加班員工僅 10.44% —— 近 3 倍差距
-- 洞察: 加班是目前為止最強的離職訊號，比部門別影響更大


-- 4. 薪資區間 vs 離職率
SELECT
  CASE
    WHEN MonthlyIncome < 3000 THEN '低薪(<3000)'
    WHEN MonthlyIncome < 7000 THEN '中薪(3000-6999)'
    ELSE '高薪(7000+)'
  END AS 薪資區間,
  COUNT(*) AS 總人數,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS 離職人數,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 離職率
FROM "HR-Attrition-clean"
GROUP BY 薪資區間
ORDER BY 離職率 DESC;
-- 結果: 低薪 28.61% > 中薪 12.03% > 高薪 10.80%
-- 洞察: 薪資與離職率呈明顯負相關，低薪員工離職率接近高薪員工的 3 倍


-- 5. Window Function: 各部門離職率排名
SELECT
  Department,
  COUNT(*) AS 總人數,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS 離職人數,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 離職率,
  RANK() OVER (ORDER BY 100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) DESC) AS 離職率排名
FROM "HR-Attrition-clean"
GROUP BY Department;
-- 結果: Sales 排名第1(20.63%), Human Resources 第2(19.05%), Research & Development 第3(13.84%)


-- 6. 複合風險因子分析: 加班 + 低薪 + 低工作滿意度 疊加效應
SELECT
  (CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END +
   CASE WHEN MonthlyIncome < 3000 THEN 1 ELSE 0 END +
   CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END) AS 風險因子數,
  COUNT(*) AS 總人數,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS 離職人數,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 離職率
FROM "HR-Attrition-clean"
GROUP BY 風險因子數
ORDER BY 風險因子數;
-- 結果: 0個風險因子 6.47% → 1個 13.44% → 2個 30.63% → 3個(全中) 64.44%
-- 洞察: 風險因子不是加總關係,是複合疊乘效應。同時符合三項風險的員工,
--       離職率是零風險因子員工的近 10 倍,可作為企業識別高風險離職名單的依據


-- 7. 高風險群(2個以上風險因子)職位分布
SELECT
  JobRole,
  COUNT(*) AS 高風險人數,
  ROUND(100.0 * COUNT(*) / (
    SELECT COUNT(*) FROM "HR-Attrition-clean"
    WHERE (CASE WHEN OverTime='Yes' THEN 1 ELSE 0 END +
           CASE WHEN MonthlyIncome<3000 THEN 1 ELSE 0 END +
           CASE WHEN JobSatisfaction<=2 THEN 1 ELSE 0 END) >= 2
  ), 2) AS 佔高風險群比例
FROM "HR-Attrition-clean"
WHERE (CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END +
       CASE WHEN MonthlyIncome < 3000 THEN 1 ELSE 0 END +
       CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END) >= 2
GROUP BY JobRole
ORDER BY 高風險人數 DESC;
-- 結果: 高風險群共 329 人(佔全公司 22.38%),其中 Research Scientist(31.91%)
--       + Laboratory Technician(27.05%)合計將近六成
-- 洞察: 部門層級分析顯示 R&D 整體離職率最低(13.84%),但高風險子群體反而
--       集中在 R&D 裡的特定職位 —— 部門平均數字掩蓋了內部的風險群聚,
--       證明只看部門層級容易漏掉真正該優先介入的對象


-- 8. 高風險群平均薪資(用於估算替換成本)
SELECT
  ROUND(AVG(MonthlyIncome), 0) AS 高風險群平均月薪,
  ROUND(AVG(MonthlyIncome) * 12, 0) AS 估計年薪
FROM "HR-Attrition-clean"
WHERE (CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END +
       CASE WHEN MonthlyIncome < 3000 THEN 1 ELSE 0 END +
       CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END) >= 2;
-- 結果: 平均月薪 4,349,估計年薪約 52,192
-- 用途: 搭配業界常用的「替換成本約為年薪 50%」估算法,
--       推算降低高風險群離職率所能節省的成本(見 README 行動建議)
