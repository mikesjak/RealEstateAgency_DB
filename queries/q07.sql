-- Jaká prodaná nemovitost měla největší rozlohu?

select * from nemovitost
where velikost_v_m2 in (
    select max(velikost_v_m2) from nemovitost
    join inzerce using (id_nemovitost)
    join zajem using (id_inzerce)
    join prodej using (id_zajem)
    where prodej.stav = 'Sold'
);