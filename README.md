# 數據分析 / BI 工程師作品集

轉職數據分析 / BI 工程師,記錄學習與練習成果。

## 目前進度

- [x] Excel(樞紐分析表、VLOOKUP、條件格式)
- [x] SQL(SELECT/JOIN/GROUP BY/子查詢/Window Functions)
- [x] Tableau(儀表板設計)
- [x] Kaggle 資料集分析(IBM HR Attrition)

## 內容

### 📊 Tableau 儀表板

[Superstore 銷售分析儀表板](https://public.tableau.com/app/profile/.27512013/viz/Superstore_17912665387170/1_1#1)

使用 Tableau Public 內建的 Sample Superstore 資料集,分析各類別銷售額與利潤率、年度銷售趨勢、各地區銷售分布。核心發現:Furniture 類別銷售額雖高,但利潤率僅 2%,遠低於 Office Supplies 與 Technology 的 17% 左右,顯示該類別可能存在折扣策略或成本結構問題。

[IBM HR 員工離職分析儀表板](https://public.tableau.com/app/profile/.27512013/viz/IBMHR_17914316104210/1_1?publish=yes)

使用 Kaggle 的 IBM HR Analytics Employee Attrition Dataset(1470 筆員工紀錄),用 SQL 先做探索性分析、再用 Tableau 視覺化。核心發現:
- 整體離職率 16.12%
- 業務部門(Sales)離職率最高,達 20.63%
- 加班員工離職率 30.53%,是不加班員工(10.44%)的近 3 倍
- 低薪員工離職率 28.61%,接近高薪員工(10.80%)的 3 倍
- **複合風險因子分析(加班+低薪+低工作滿意度):風險因子數從 0 個到 3 個,離職率從 6.47% 一路飆升到 64.44%,是零風險因子員工的近 10 倍**
- **高風險子群體(2 個以上風險因子)共 329 人,佔全公司 22.38%,其中 Research Scientist(31.91%)+ Laboratory Technician(27.05%)合計將近六成 —— 部門層級分析顯示 R&D 整體離職率最低(13.84%),但高風險子群體反而集中在 R&D 裡的特定職位,說明只看部門平均容易掩蓋內部的風險群聚**

**行動建議:**
建議針對這 329 位高風險員工(尤其集中於 Research Scientist、Laboratory Technician 兩個職位),由主管端啟動一對一留任面談,並優先檢討加班制度與低薪群的調薪機制。以此群體目前平均年薪約 52,192 計算,若採業界常用的「替換成本約為年薪 50%」估算法,降低此群體離職率 10 個百分點,預估每年可節省約 **85.9 萬元** 人才替換成本(此為假設性估算,實際金額需視企業實際替換成本結構而定)。

### 📁 sql/
SQL 練習題與解法,依觀念分類整理,涵蓋 LeetCode Database 分類、HackerRank SQL 練習:

- `01_where_null.sql` — WHERE 篩選 + NULL 判斷
- `02_group_by_having.sql` — GROUP BY + HAVING + 聚合函數
- `03_join.sql` — INNER JOIN / LEFT JOIN
- `04_join_range_and_case_when.sql` — JOIN 進階配對(BETWEEN)+ CASE WHEN
- `05_subqueries.sql` — 基礎子查詢 + Anti-Join
- `06_like_and_string_functions.sql` — LIKE 模糊比對 + 字串/排序函數
- `hr_attrition_analysis.sql` — HR Attrition 資料集的探索性分析查詢

### 📁 kaggle-analysis/
[IBM HR Analytics Employee Attrition Dataset 分析說明](kaggle-analysis/README.md)(資料來源:[Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset))。使用 DB Browser for SQLite 匯入資料、寫 SQL 做探索性分析,再用 Tableau 做視覺化儀表板。

## 使用工具

Excel、Google Sheets、MySQL、Tableau Public
