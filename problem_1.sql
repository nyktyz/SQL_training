-- first solution
WITH detali_s2
     AS (SELECT DISTINCT nomer_detali
         FROM   spasoi_ekz.spj
         WHERE  nomer_postavshika = 'S2')
SELECT DISTINCT nomer_postavshika
FROM   spasoi_ekz.spj AS x
WHERE  NOT EXISTS (SELECT nomer_detali
                   FROM   detali_s2
                   WHERE  nomer_detali NOT IN (SELECT nomer_detali
                                               FROM   spasoi_ekz.spj AS y
                                               WHERE
                          y.nomer_postavshika = x.nomer_postavshika));  


-- snd solution
WITH detali_s2
     AS (SELECT DISTINCT nomer_detali
         FROM   spasoi_ekz.spj
         WHERE  nomer_postavshika = 'S2')
SELECT nomer_postavshika
FROM   spasoi_ekz.spj x
       JOIN detali_s2
         ON x.nomer_detali = detali_s2.nomer_detali
GROUP  BY 1
HAVING Count(*) = (SELECT Count(*)
                   FROM   detali_s2);


