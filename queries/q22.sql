-- Majitel nemovitosti, která má největší rozlohu.

select m.* from majitel m join nemovitost n using (id_majitel) 
where n.velikost_v_m2 = (
    select max(velikost_v_m2) from nemovitost
);