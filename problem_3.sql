-- Написать запрос SELECT: 
-- выдать номера поставщиков, поставляющих детали с номером 'P1'
-- для какого-либо изделия в количестве (в поставке) большим, 
-- чем средний объём поставок деталей с номером 'P2' для этого изделия. 

select nomer_postavshika
from spasoi_ekz.spj as x
where
    nomer_detali = 'P1'
    and kolichestvo > (
        select avg(kolichestvo)
        from spasoi_ekz.spj
        where nomer_detali = 'P2' and nomer_izdelia = x.nomer_izdelia
    );
