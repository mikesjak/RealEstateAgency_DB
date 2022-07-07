-- Seznam všech právníků a prodejů, bez ohledu na to, jestli se právník vyskytoval v prodeji.

-- RA

/*
pravnik *^F prodej
*/

select distinct * from pravnik
full join prodej p using (id_pravnik)
order by id_pravnik;