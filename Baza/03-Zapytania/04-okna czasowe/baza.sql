---Okna
--Porownanie przychodow imprez na przestrzeni roku.
SELECT DISTINCT ri.nazwa,
    extract(year from data_rozpoczecia) AS "ROK",
    extract(month from data_rozpoczecia) AS "MIESIAC",
    sum(i.cena_biletu * brb.ilosc) over (partition by ri.id_rodzaj_imprezy order by extract(month from data_rozpoczecia) range between UNBOUNDED PRECEDING AND CURRENT ROW) AS "SUMA"
FROM B_Impreza i JOIN B_rodzaj_imprezy ri ON i.id_rodzaj_imprezy = ri.id_rodzaj_imprezy
JOIN B_bilet b ON b.id_impreza = i.id_impreza
JOIN B_bilet_rodzaj_biletu brb ON brb.id_bilet = b.id_bilet
ORDER BY ri.nazwa, extract(month from data_rozpoczecia);

--zyski za wszystkie sprzedane bilety w danym miesiacu i zwrost tej kwoty w porownaniu do poprzedniego miesiaca
SELECT DISTINCT
    extract(year from data_rozpoczecia) ROK,
    extract(month from data_rozpoczecia) MIESIAC,
    sum(i.cena_biletu * brb.ilosc) KWOTA,
    sum(i.cena_biletu * brb.ilosc) - lag( (sum(i.cena_biletu * brb.ilosc)), 1) over (order by extract(month from data_rozpoczecia)) WZROST
FROM B_Impreza i
JOIN B_bilet b ON b.id_impreza = i.id_impreza
JOIN B_bilet_rodzaj_biletu brb ON brb.id_bilet = b.id_bilet
GROUP BY extract(year from data_rozpoczecia), extract(month from data_rozpoczecia);

--Porownanie ilosci kupionych biletow na wycieczki w kazdym kwartale
SELECT DISTINCT ri.nazwa,
    extract(month from data_rozpoczecia) AS "MIESIAC",
    FLOOR((extract(month from data_rozpoczecia) + 2) / 3) AS "KWARTAL",
    sum(i.cena_biletu * brb.ilosc) over (partition by FLOOR((extract(month from data_rozpoczecia) + 2) / 3) order by extract(month from data_rozpoczecia) range between UNBOUNDED PRECEDING AND CURRENT ROW) AS "SUMA"
FROM B_Impreza i JOIN B_rodzaj_imprezy ri ON i.id_rodzaj_imprezy = ri.id_rodzaj_imprezy
JOIN B_bilet b ON b.id_impreza = i.id_impreza
JOIN B_bilet_rodzaj_biletu brb ON brb.id_bilet = b.id_bilet
WHERE ri.id_rodzaj_imprezy = 6
ORDER BY ri.nazwa, extract(month from data_rozpoczecia);