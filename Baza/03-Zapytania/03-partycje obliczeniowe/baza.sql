--Partycje obliczeniowe
---% udzial rodzaju imprezy w danym kraju w odniesieniu do ogolnej kwoty dla calego kraju
SELECT DISTINCT B_ADRES.KRAJ AS "Kraj", B_RODZAJ_IMPREZY.NAZWA AS "Rodzaj imprezy",
SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) OVER (PARTITION BY B_ADRES.KRAJ,B_RODZAJ_IMPREZY.NAZWA) AS "Kwota dla rodzaju imprezy",
SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) OVER (PARTITION BY B_ADRES.KRAJ) AS "Ogolna kwota dla kraju",
ROUND(100*(SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ILOSC)OVER (PARTITION BY B_ADRES.KRAJ,B_RODZAJ_IMPREZY.NAZWA))/
(SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ILOSC)OVER (PARTITION BY B_ADRES.KRAJ)),5) "UDZIAL %" FROM B_IMPREZA JOIN B_ADRES ON B_IMPREZA.ID_ADRES = B_ADRES.ID_ADRES
JOIN B_RODZAJ_IMPREZY ON B_IMPREZA.ID_RODZAJ_IMPREZY = B_RODZAJ_IMPREZY.ID_RODZAJ_IMPREZY
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
ORDER BY B_RODZAJ_IMPREZY.NAZWA, B_ADRES.KRAJ;

---% udzial krajow w zyskach ogolnych
SELECT DISTINCT  B_ADRES.KRAJ AS "Kraj",
SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) OVER (PARTITION BY B_ADRES.KRAJ) AS "Kwota dla kraju",
SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) OVER (PARTITION BY NULL) AS "Ogolna kwota",
ROUND(100*(SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ILOSC)OVER (PARTITION BY B_ADRES.KRAJ))/
(SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ILOSC)OVER (PARTITION BY NULL)),5) "UDZIAL %" FROM B_IMPREZA JOIN B_ADRES ON B_IMPREZA.ID_ADRES = B_ADRES.ID_ADRES
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
ORDER BY B_ADRES.KRAJ;

---% biletow kazdego rodzaju w ogolnej sumie biletow 
SELECT DISTINCT B_Rodzaj_Imprezy.Nazwa AS "Rodzaj", B_Rodzaj_Biletu.Nazwa AS "Rodzaj biletu", SUM(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_Rodzaj_Biletu.Nazwa) AS "Ilosc biletow danego rodzjau",
sum(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY NULL) "Ilosc biletow ogolna",
ROUND(100*SUM(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_Rodzaj_Biletu.Nazwa)/
(SUM(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY NULL)),2) "UDZIAL %"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
JOIN B_Rodzaj_biletu ON B_Rodzaj_biletu.id_rodzaj_biletu = B_Bilet_Rodzaj_Biletu.id_rodzaj_biletu 
ORDER BY B_Rodzaj_Imprezy.Nazwa,B_Rodzaj_Biletu.Nazwa;

---% udzial danego rodzaju biletu do ogolnej ilosci biletow w kraju
SELECT DISTINCT B_ADRES.KRAJ AS "Kraj", B_Rodzaj_Biletu.Nazwa AS "Rodzaj biletu", SUM(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_ADRES.KRAJ,B_Rodzaj_Biletu.Nazwa) AS "ILOSC",
sum(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_ADRES.KRAJ) Ilosc_biletow,
ROUND(100*SUM(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_ADRES.KRAJ,B_Rodzaj_Biletu.Nazwa)/
(SUM(B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_ADRES.KRAJ)),5) "UDZIAL %"
FROM B_Impreza JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
JOIN B_Rodzaj_biletu ON B_Rodzaj_biletu.id_rodzaj_biletu = B_Bilet_Rodzaj_Biletu.id_rodzaj_biletu
JOIN B_ADRES ON B_IMPREZA.ID_ADRES = B_ADRES.ID_ADRES
ORDER BY B_ADRES.KRAJ, B_Rodzaj_Biletu.Nazwa;


---% udzial kazdego tytulu spektaklu w ogolnych zyskach z danego rodzaju imprezy
SELECT DISTINCT B_RODZAJ_IMPREZY.NAZWA AS "Rodzaj imprezy", B_SPEKTAKL.TYTUL AS "Tytul", SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) OVER (PARTITION BY B_SPEKTAKL.TYTUL) AS "Kwota",
SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) OVER (PARTITION BY B_RODZAJ_IMPREZY.NAZWA) SUMA_KWOTA,
ROUND(100*(SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ILOSC)OVER (PARTITION BY B_SPEKTAKL.TYTUL))/
(SUM(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ILOSC) OVER (PARTITION BY B_RODZAJ_IMPREZY.NAZWA)),5) "UDZIAL %"
FROM B_IMPREZA JOIN B_SPEKTAKL ON B_IMPREZA.ID_SPEKTAKL = B_SPEKTAKL.ID_SPEKTAKL
JOIN B_RODZAJ_IMPREZY ON B_IMPREZA.ID_RODZAJ_IMPREZY = B_RODZAJ_IMPREZY.ID_RODZAJ_IMPREZY JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
ORDER BY B_RODZAJ_IMPREZY.NAZWA, B_SPEKTAKL.TYTUL;