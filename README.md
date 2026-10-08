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

我用 Tableau Public 內建的 Sample Superstore 資料集,看了各類別的銷售額跟利潤率、銷售趨勢隨時間怎麼變化、還有各地區賣得怎麼樣。最有意思的發現是:Furniture 類別的銷售額其實不低,但利潤率只有 2%,比 Office Supplies 跟 Technology 的 17% 左右差很多 —— 我猜可能是折扣給太多,或是這個類別本身成本結構比較吃緊。

[IBM HR 員工離職分析儀表板](https://public.tableau.com/app/profile/.27512013/viz/IBMHR_17914316104210/1_1?publish=yes)

使用 Kaggle 的 IBM HR Analytics Employee Attrition Dataset(1470 筆員工紀錄),用 SQL 先做探索性分析、再用 Tableau 視覺化。核心發現:
- 整體離職率 16.12%
- 業務部門(Sales)離職率最高,達 20.63%
- 加班員工離職率 30.53%,是不加班員工(10.44%)的近 3 倍
- 低薪員工離職率 28.61%,接近高薪員工(10.80%)的 3 倍
- **複合風險因子分析(加班+低薪+低工作滿意度):風險因子數從 0 個到 3 個,離職率從 6.47% 一路飆升到 64.44%,是零風險因子員工的近 10 倍**
- **高風險子群體(同時符合 2 個以上風險因子)共 329 人,佔全公司 22.38%。我把這群人再拆開看職位,發現將近六成是 Research Scientist 跟 Laboratory Technician —— 滿意外的,因為 R&D 部門整體離職率其實是三個部門裡最低的(13.84%)。代表只看部門平均數字,會漏掉藏在裡面的高風險群**

**我的想法:**
如果要優先處理,我會先從 Research Scientist 跟 Laboratory Technician 這兩個職位下手,看看是不是加班太多、或薪水沒有跟上。我也試著抓了一個粗略的數字,感受一下這件事的影響力有多大:這群人平均年薪大概 52,192,網路上查到一般估計「找人補進來、訓練到上手」的成本大概是年薪的一半左右,所以如果能讓這群人的離職率降個 10%,一年大概可以省下 **85.9 萬元左右**的招募跟訓練成本。這只是我粗略抓的估算,實際數字公司內部應該會更準確。

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
