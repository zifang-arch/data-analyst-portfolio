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
