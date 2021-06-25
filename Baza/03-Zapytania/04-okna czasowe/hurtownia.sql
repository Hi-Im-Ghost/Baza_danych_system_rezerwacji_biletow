---Okna
--Porownanie przychodow imprez na przestrzeni lat.
SELECT DISTINCT
    ri.nazwa,
    d.ROK,
    d.MIESIAC,
    sum(i.cena_biletu * i.ilosc) over (partition by ri.id_rodzaj_imprezy order by d.miesiac range between UNBOUNDED PRECEDING AND CURRENT ROW) AS "SUMA"
FROM H_Impreza i JOIN H_rodzaj_imprezy ri ON i.id_rodzaj_imprezy = ri.id_rodzaj_imprezy
JOIN H_DATA d ON i.ID_DATA = d.ID_DATA
ORDER BY d.ROK, ri.nazwa, d.MIESIAC;

--zyski za wszystkie sprzedane bilety w danym miesiacu i zwrost tej kwoty w porownaniu do poprzedniego miesiaca
SELECT DISTINCT
    H_DATA.ROK AS "ROK",
    H_DATA.MIESIAC AS "MIESIAC",
    sum(i.cena_biletu * i.ilosc) KWOTA,
    sum(i.cena_biletu * i.ilosc) - lag( (sum(i.cena_biletu * i.ilosc)), 1) over (order by H_DATA.MIESIAC) AS "WZROST"
FROM H_Impreza i
JOIN H_DATA ON i.ID_DATA = H_DATA.ID_DATA
GROUP BY H_DATA.ROK, H_DATA.MIESIAC;

--Porównanie ilosci kupionych biletow na wycieczki w kazdym kwartale
SELECT DISTINCT ri.nazwa,
    H_DATA.MIESIAC AS "MIESIAC",
    FLOOR((H_DATA.MIESIAC + 2) / 3) AS "KWARTAL",
    sum(i.cena_biletu * i.ilosc) over (partition by FLOOR(((H_DATA.MIESIAC + 2) / 3)) order by H_DATA.MIESIAC range between UNBOUNDED PRECEDING AND CURRENT ROW) AS "SUMA"
FROM H_Impreza i JOIN H_rodzaj_imprezy ri ON i.id_rodzaj_imprezy = ri.id_rodzaj_imprezy
JOIN H_DATA ON i.ID_DATA = H_DATA.ID_DATA
WHERE ri.id_rodzaj_imprezy = 6
ORDER BY ri.nazwa, H_DATA.MIESIAC;