---ROLLUP
--Podsumowanie finansowe
SELECT H_Rodzaj_Imprezy.Nazwa AS "Rodzaj", H_Transport.Nazwa AS "Pojazd", sum(H_IMPREZA.CENA_BILETU*H_IMPREZA.ilosc) "Suma kwota"
FROM H_Impreza JOIN H_Rodzaj_Imprezy ON H_Impreza.id_rodzaj_imprezy = H_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by rollup(H_Rodzaj_Imprezy.Nazwa,H_Transport.Nazwa);

SELECT H_Rodzaj_Imprezy.Nazwa AS "Rodzaj", H_Wykonawcy.Nazwa AS "Wykonawca/y", sum(H_IMPREZA.CENA_BILETU*H_IMPREZA.ilosc) "Suma kwota"
FROM H_Impreza JOIN H_Rodzaj_Imprezy ON H_Impreza.id_rodzaj_imprezy = H_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN H_Wykonawcy ON H_Impreza.id_wykonawcy = H_Wykonawcy.id_wykonawcy
group by rollup(H_Rodzaj_Imprezy.Nazwa,H_Wykonawcy.Nazwa);

SELECT H_Rodzaj_Imprezy.Nazwa AS "Rodzaj", H_Spektakl.Gatunek, sum(H_Impreza.cena_biletu*H_IMPREZA.ilosc) "Suma kwota"
FROM H_Impreza JOIN H_Rodzaj_Imprezy ON H_Impreza.id_rodzaj_imprezy = H_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN H_Spektakl ON H_Impreza.id_spektakl = H_Spektakl.id_spektakl
group by rollup(H_Rodzaj_Imprezy.Nazwa,H_Spektakl.Gatunek);

--Zliczanie ilosci biletow
SELECT H_Rodzaj_Imprezy.Nazwa AS "Rodzaj", H_Rodzaj_Biletu.Nazwa AS "Rodzaj biletu", sum(H_IMPREZA.ilosc) "Ilosc biletow"
FROM H_Impreza JOIN H_Rodzaj_Imprezy ON H_Impreza.id_rodzaj_imprezy = H_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN H_Rodzaj_biletu ON H_Rodzaj_biletu.id_rodzaj_biletu = H_IMPREZA.id_rodzaj_biletu 
group by rollup(H_Rodzaj_Imprezy.Nazwa,H_Rodzaj_Biletu.Nazwa);

--Zliczenie jaki najczesciej wybierany pojazd"
SELECT H_Rodzaj_Imprezy.Nazwa AS "Rodzaj", H_Transport.nazwa AS "Pojazd", sum(H_IMPREZA.ilosc) AS "Ilosc biletow"
FROM H_Impreza JOIN H_Rodzaj_Imprezy ON H_Impreza.id_rodzaj_imprezy = H_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by rollup(H_Rodzaj_Imprezy.Nazwa,H_Transport.nazwa);

SELECT H_Transport.Rodzaj_Transportu AS "Rodzaj", H_Transport.nazwa AS "Pojazd", sum(H_IMPREZA.ilosc) AS "Ilosc biletow"
FROM H_Impreza JOIN H_Rodzaj_Imprezy ON H_Impreza.id_rodzaj_imprezy = H_Rodzaj_Imprezy.id_rodzaj_imprezy JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by rollup(H_Transport.Rodzaj_Transportu,H_Transport.nazwa);