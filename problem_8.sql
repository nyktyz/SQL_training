-- Написать запрос SELECT: 
-- выдать номера изделий и общее количество деталей для них, 
-- поставляемых поставщиками с именем 'Петров'. 


SELECT     spj.nomer_izdelia,
           Sum(spj.kolichestvo) AS quantity_of_details
FROM       spasoi_ekz.spj       AS spj
INNER JOIN spasoi_ekz.s         AS s
ON         spj.nomer_postavshika = s.nomer_postavshika
AND        s.imya ilike '%петров%'
GROUP BY   1
ORDER BY   2 DESC 
