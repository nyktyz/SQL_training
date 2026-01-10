-- Написать запрос SELECT: 
-- выдать номера изделий, для которых детали поставляет только поставщик с номером ‘S1’.


-- first solution
SELECT nomer_izdelia
FROM   spasoi_ekz.spj x
WHERE  NOT EXISTS (SELECT *
                   FROM   spasoi_ekz.spj y
                   WHERE  y.nomer_izdelia = x.nomer_izdelia
                          AND y.nomer_postavshika != 'S1');


-- second_solution
SELECT nomer_izdelia
FROM   spasoi_ekz.spj
WHERE  nomer_izdelia IN (SELECT DISTINCT nomer_izdelia
                         FROM   spasoi_ekz.spj
                         WHERE  nomer_postavshika = 'S1')
       AND nomer_izdelia NOT IN (SELECT DISTINCT nomer_izdelia
                                 FROM   spasoi_ekz.spj
                                 WHERE  nomer_postavshika != 'S1');
								 