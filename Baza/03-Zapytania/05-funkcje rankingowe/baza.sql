--Funkcje rankingowe
---Ranking najczesciej wybierany transport ogolny/kraju
----ogolnie
SELECT t.nazwa, count(b.id_bilet) AS "ILOSC BILETOW", DENSE_RANK() OVER (ORDER BY count(b.id_bilet) desc) AS "RANKING"
FROM B_impreza i
JOIN B_transport t ON i.id_transport = t.id_transport
JOIN B_bilet b ON b.id_impreza = i.id_impreza
GROUP BY t.nazwa;
----kraj
SELECT a.kraj, t.nazwa, count(b.id_bilet) AS "ILOSC BILETOW", DENSE_RANK() OVER (PARTITION BY a.kraj ORDER BY count(b.id_bilet) desc) AS "RANKING"
FROM B_impreza i
JOIN B_transport t ON i.id_transport = t.id_transport
JOIN B_adres a ON i.id_adres = a.id_adres
JOIN B_bilet b ON b.id_impreza = i.id_impreza
GROUP BY a.kraj, t.nazwa;

---Ranking ulg, ktora ulga najczesciej wykorzystywana
SELECT ru.nazwa as "NAZWA ULGI", count(ru.id_rodzaj_ulgi) AS "ILOSC", DENSE_RANK() OVER (ORDER BY(count(ru.id_rodzaj_ulgi)) desc) AS "RANKING"
FROM B_Bilet_rodzaj_biletu brb
JOIN B_rodzaj_biletu rb ON brb.id_rodzaj_biletu = rb.id_rodzaj_biletu
JOIN B_rodzaj_ulgi ru ON rb.id_rodzaj_ulgi = ru.id_rodzaj_ulgi
GROUP BY ru.nazwa;

---Ranking imprez, na ktore wydarzenia najchetniej ludzie kupuja bilety
SELECT ri.nazwa, sum(brb.ilosc) AS "ILOSC BILETOW", DENSE_RANK() OVER (ORDER BY(sum(brb.ilosc)) desc) AS "RANKING"
FROM B_impreza i
JOIN B_Bilet b ON b.id_impreza = i.id_impreza
JOIN B_bilet_rodzaj_biletu brb ON brb.id_bilet = b.id_bilet
JOIN B_rodzaj_imprezy ri ON i.id_rodzaj_imprezy = ri.id_rodzaj_imprezy
GROUP BY ri.nazwa;