-- 主題: JOIN 進階配對(BETWEEN)+ CASE WHEN

-- What Type of Triangle (HackerRank)
-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem
-- 判斷三邊長構成哪種三角形
-- 重點: CASE WHEN 由上到下依序檢查,最嚴格(圍不成三角形)的條件要放最前面;
--       SQL 沒有鏈式比較,A=B=C 要寫成 A=B AND B=C
SELECT
  CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
  END
FROM TRIANGLES;


-- The Report (HackerRank)
-- https://www.hackerrank.com/challenges/the-report/problem
-- 依分數對照 Grade 區間表,Grade>=8 顯示姓名依姓名排序,Grade<8 姓名顯示 NULL 依分數排序
-- 重點: ON 不是只能用 =,可以用 BETWEEN 做範圍配對(分數對應等級表);
--       CASE WHEN 也可以放進 ORDER BY,依條件切換不同排序依據;
--       已有對照表(Grades)就用 JOIN 查,不要用 CASE WHEN 手動重造規則
SELECT
  CASE WHEN g.grade < 8 THEN NULL ELSE s.name END AS name,
  g.grade,
  s.marks
FROM students s
LEFT JOIN grades g
  ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY
  g.grade DESC,
  CASE WHEN g.grade >= 8 THEN s.name END,
  CASE WHEN g.grade < 8 THEN s.marks END;
