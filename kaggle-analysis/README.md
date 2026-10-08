# IBM HR Analytics Employee Attrition 分析

資料來源:[Kaggle - IBM HR Analytics Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)(1470 筆員工紀錄)

## 分析流程

1. 用 DB Browser for SQLite 匯入 CSV,建立資料庫
2. 寫 SQL 做探索性分析(查詢見 [`../sql/hr_attrition_analysis.sql`](../sql/hr_attrition_analysis.sql))
3. 用 Tableau Public 做視覺化儀表板

## 核心發現

- 整體離職率 16.12%
- 業務部門(Sales)離職率最高,達 20.63%
- **加班員工離職率 30.53%,是不加班員工(10.44%)的近 3 倍,是目前最強的離職訊號**
- 低薪員工離職率 28.61%,接近高薪員工(10.80%)的 3 倍

## 儀表板

[IBM HR 員工離職分析儀表板](https://public.tableau.com/app/profile/.27512013/viz/IBMHR_17914316104210/1_1?publish=yes)
