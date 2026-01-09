-- Написать запрос SELECT: 
-- выдать номера деталей и общее их количество для всех номеров деталей, 
-- поставляемых более чем одним поставщиком.

SELECT nomer_detali,
       Sum(kolichestvo)
FROM   spasoi_ekz.spj
GROUP  BY 1
HAVING Count(DISTINCT nomer_postavshika) > 1;
