-- Kolik nemovitostí se zatím podařilo prodat?
 
 select count(*) 
from (
    select stav from prodej
    where stav = 'Sold'
) AS Prodano;