-- Написать запрос SELECT: 
-- выдать названия деталей, поставляемых поставщиком, 
-- проживающим в том же городе, где изготавливаются эти детали, 
-- для изделия с названием ‘Велосипед 01/23’. 


SELECT p.nazvanie
FROM   spasoi_ekz.spj spj
       JOIN spasoi_ekz.s s
         ON spj.nomer_postavshika = s.nomer_postavshika
       JOIN spasoi_ekz.p p
         ON spj.nomer_detali = p.nomer_detali
       JOIN spasoi_ekz.j j
         ON spj.nomer_izdelia = j.nomer_izdelia
            AND j.nazvanie = Lower('Велосипед 01/23')
WHERE  p.gorod = s.gorod;  
