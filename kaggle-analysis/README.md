# IBM HR Analytics Employee Attrition 分析

資料來源:[Kaggle - IBM HR Analytics Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)(1470 筆員工紀錄)

## 分析流程

1. 用 DB Browser for SQLite 匯入 CSV,建立資料庫
2. 寫 SQL 做探索性分析(查詢見 [`../sql/hr_attrition_analysis.sql`](../sql/hr_attrition_analysis.sql))
3. 用 Tableau Public 做視覺化儀表板

## 核心發現

- 整體離職率 16.12%
- 業務部門(Sales)離職率最高,達 20.63%(用 Window Function RANK() 排名)
- 加班員工離職率 30.53%,是不加班員工(10.44%)的近 3 倍
- 低薪員工離職率 28.61%,接近高薪員工(10.80%)的 3 倍
- **複合風險因子分析:加班、低薪、低工作滿意度三項風險因子,從 0 個疊加到 3 個,離職率從 6.47% 一路飆升到 64.44%,是零風險因子員工的近 10 倍。風險因子不是加總關係,是複合疊乘效應**
- **高風險子群體(2 個以上風險因子)共 329 人,佔全公司 22.38%,其中 Research Scientist(31.91%)+ Laboratory Technician(27.05%)合計將近六成 —— R&D 部門整體離職率最低(13.84%),但高風險子群體反而集中在 R&D 裡的特定職位,說明只看部門平均容易掩蓋內部的風險群聚**

## 行動建議

建議針對這 329 位高風險員工(尤其集中於 Research Scientist、Laboratory Technician 兩個職位),由主管端啟動一對一留任面談,並優先檢討加班制度與低薪群的調薪機制。以此群體目前平均年薪約 52,192 計算,若採業界常用的「替換成本約為年薪 50%」估算法,降低此群體離職率 10 個百分點,預估每年可節省約 **85.9 萬元** 人才替換成本(此為假設性估算,實際金額需視企業實際替換成本結構而定)。

## 儀表板

[IBM HR 員工離職分析儀表板](https://public.tableau.com/app/profile/.27512013/viz/IBMHR_17914316104210/1_1?publish=yes)
