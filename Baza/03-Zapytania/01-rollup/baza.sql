---ROLLUP
--Podsumowanie finansowe
SELECT B_Rodzaj_Imprezy.Nazwa AS "Rodzaj", B_Transport.Nazwa AS "Pojazd", sum(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) "Suma kwota"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
group by rollup(B_Rodzaj_Imprezy.Nazwa,B_Transport.Nazwa);

SELECT B_Rodzaj_Imprezy.Nazwa AS "Rodzaj", B_Wykonawcy.Nazwa AS "Wykonawca/y", sum(B_IMPREZA.CENA_BILETU*B_Bilet_Rodzaj_Biletu.ilosc) "Suma kwota"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Wykonawcy ON B_Impreza.id_wykonawcy = B_Wykonawcy.id_wykonawcy
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
group by rollup(B_Rodzaj_Imprezy.Nazwa,B_Wykonawcy.Nazwa);

SELECT B_Rodzaj_Imprezy.Nazwa AS "Rodzaj", B_Gatunek.Nazwa AS "Gatunek", sum(B_Impreza.cena_biletu*B_Bilet_Rodzaj_Biletu.ilosc) "Suma kwota"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Spektakl ON B_Impreza.id_spektakl = B_Spektakl.id_spektakl JOIN B_Gatunek ON B_Spektakl.id_gatunek = B_Gatunek.id_gatunek
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
group by rollup(B_Rodzaj_Imprezy.Nazwa,B_Gatunek.Nazwa);

--Zliczanie ilosci biletow
SELECT B_Rodzaj_Imprezy.Nazwa AS "Rodzaj", B_Rodzaj_Biletu.Nazwa AS "Rodzaj biletu", sum(B_Bilet_Rodzaj_Biletu.ILOSC) "Ilosc biletow"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_Rodzaj_biletu ON B_Rodzaj_biletu.id_rodzaj_biletu = B_Bilet_Rodzaj_Biletu.id_rodzaj_biletu 
group by rollup(B_Rodzaj_Imprezy.Nazwa,B_Rodzaj_Biletu.Nazwa);

--Zliczenie jaki najczesciej wybierany pojazd"
SELECT B_Rodzaj_Imprezy.Nazwa AS "Rodzaj", B_Transport.nazwa AS "Pojazd", sum(B_Bilet_Rodzaj_Biletu.ILOSC) AS "Ilosc biletow"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport
group by rollup(B_Rodzaj_Imprezy.Nazwa,B_Transport.nazwa);

SELECT B_Rodzaj_Transportu.Nazwa AS "Rodzaj", B_Transport.nazwa AS "Pojazd", sum(B_Bilet_Rodzaj_Biletu.ILOSC) AS "Ilosc biletow"
FROM B_Impreza JOIN B_Rodzaj_Imprezy ON B_Impreza.id_rodzaj_imprezy = B_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport JOIN B_Rodzaj_Transportu ON B_Transport.id_rodzaj_transportu = B_Rodzaj_Transportu.id_rodzaj_transportu
group by rollup(B_Rodzaj_Transportu.Nazwa,B_Transport.nazwa);
