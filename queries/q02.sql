-- Seznam právníků a počet prodejů, na které dohlíželi.

select id_pravnik, krestni_jmeno, prijmeni, count(id_zajem) as prodeje from pravnik
left join prodej using (id_pravnik) -- vsechny pravniky a k nim i prodeje (i pravnik bez prodeje)
group by id_pravnik, krestni_jmeno, prijmeni
order by prodeje desc;