-- Написать запрос SELECT: 
-- выдать имена поставщиков, поставляющих детали с названием "Болт" в количестве (в поставке) большим, 
-- чем средний объём всех поставок деталей с номером 'P1'. 

WITH p1
     AS (SELECT Avg(kolichestvo) p1_kol
         FROM   spasoi_ekz.spj
         WHERE  nomer_detali = 'P1')
SELECT s.imya
FROM   spasoi_ekz.spj spj
       JOIN spasoi_ekz.p p
         ON spj.nomer_detali = p.nomer_detali
       JOIN spasoi_ekz.s s
         ON spj.nomer_postavshika = s.nomer_postavshika
WHERE  p.nazvanie = 'болт'
GROUP  BY 1
HAVING Sum(spj.kolichestvo) > (SELECT p1_kol
                               FROM   p1) ;