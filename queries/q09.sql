-- Jakou nejlevnější nemovitost nedokázal prodat makléř s největší úspěšností?

select * from nemovitost
where ohodnoceni = (
    select distinct min(ohodnoceni) from makler
    join inzerce using (id_makler)
    join nemovitost n using (id_nemovitost)
    where uspesnost in (
        select * from
        (
            select uspesnost from makler
            where uspesnost in (
                select max(uspesnost) from makler
            )
        ) as m
    ) 
);