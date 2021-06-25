--Funkcje rankingowe
---Ranking najczesciej wybierany transport ogolny/kraju
----ogolnie
SELECT t.nazwa, count(t.id_transport) AS "ILOSC BILETOW", DENSE_RANK() OVER (ORDER BY count(t.id_transport) desc) AS "RANKING"
FROM H_impreza i
JOIN H_transport t ON i.id_transport = t.id_transport
GROUP BY t.nazwa;
----kraj
SELECT a.kraj, t.nazwa, count(t.id_transport) AS "ILOSC BILETOW", DENSE_RANK() OVER (PARTITION BY a.kraj ORDER BY count(t.id_transport) desc) AS "RANKING"
FROM H_impreza i
JOIN H_transport t ON i.id_transport = t.id_transport
JOIN H_adres a ON i.id_adres = a.id_adres
GROUP BY a.kraj, t.nazwa;

---Ranking ulg, ktorara ulga najczesciej wykorzystywana
SELECT rb.rodzaj_ulgi as "NAZWA ULGI", count(rb.id_rodzaj_biletu) AS "ILOSC", DENSE_RANK() OVER (ORDER BY(count(rb.rodzaj_ulgi)) desc) AS "RANKING"
FROM H_impreza i
JOIN H_rodzaj_biletu rb ON i.id_rodzaj_biletu = rb.id_rodzaj_biletu
WHERE rb.rodzaj_ulgi IS NOT NULL
GROUP BY rb.rodzaj_ulgi;

---Ranking imprez, na ktore wydarzenia najchetniej ludzie kupuja bilety
SELECT ri.nazwa, sum(i.ilosc) AS "ILOSC BILETOW", DENSE_RANK() OVER (ORDER BY(sum(i.ilosc)) desc) AS "RANKING"
FROM H_impreza i
JOIN H_rodzaj_imprezy ri ON i.id_rodzaj_imprezy = ri.id_rodzaj_imprezy
GROUP BY ri.nazwa;