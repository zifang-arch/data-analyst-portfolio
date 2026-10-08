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
- **高風險子群體(同時符合 2 個以上風險因子)共 329 人,佔全公司 22.38%。我把這群人再拆開看職位,發現將近六成是 Research Scientist 跟 Laboratory Technician —— 滿意外的,因為 R&D 部門整體離職率其實是三個部門裡最低的(13.84%)。代表只看部門平均數字,會漏掉藏在裡面的高風險群**

## 我的想法

如果要優先處理,我會先從 Research Scientist 跟 Laboratory Technician 這兩個職位下手,看看是不是加班太多、或薪水沒有跟上。我也試著抓了一個粗略的數字,感受一下這件事的影響力有多大:這群人平均年薪大概 52,192,網路上查到一般估計「找人補進來、訓練到上手」的成本大概是年薪的一半左右,所以如果能讓這群人的離職率降個 10%,一年大概可以省下 **85.9 萬元左右**的招募跟訓練成本。這只是我粗略抓的估算,實際數字公司內部應該會更準確。

## 儀表板

[IBM HR 員工離職分析儀表板](https://public.tableau.com/app/profile/.27512013/viz/IBMHR_17914316104210/1_1?publish=yes)
