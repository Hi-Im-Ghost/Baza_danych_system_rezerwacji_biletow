---CUBE
--preferencje gatunkowe ogólne
SELECT H_Adres.Kraj AS "Kraj", H_SPEKTAKL.GATUNEK AS "Gatunek", H_Spektakl.Tytul AS "Tytul", sum(H_IMPREZA.ilosc) AS "Ilosc biletow"
FROM H_Impreza JOIN H_ADRES ON H_IMPREZA.id_adres = H_ADRES.id_adres JOIN H_SPEKTAKL ON H_SPEKTAKL.ID_SPEKTAKL = H_IMPREZA.ID_SPEKTAKL
group by cube(H_Adres.Kraj, H_Spektakl.GATUNEK, H_Spektakl.Tytul);

SELECT H_Adres.Kraj AS "Kraj", H_SPEKTAKL.GATUNEK AS "Gatunek" ,sum(H_IMPREZA.ilosc) AS "Ilosc biletow"
FROM H_Impreza JOIN H_ADRES ON H_IMPREZA.id_adres = H_ADRES.id_adres JOIN H_SPEKTAKL ON H_SPEKTAKL.ID_SPEKTAKL = H_IMPREZA.ID_SPEKTAKL
group by cube(H_Adres.Kraj, H_SPEKTAKL.GATUNEK);

--preferencje przewozowe
SELECT H_Adres.Kraj AS "Kraj", H_Transport.Rodzaj_Transportu AS "Rodzaj Transportu",sum(H_IMPREZA.ilosc) AS "Ilosc biletow"
FROM H_Impreza JOIN H_ADRES ON H_IMPREZA.id_adres = H_ADRES.id_adres JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by cube(H_Adres.Kraj, H_Transport.Rodzaj_Transportu);

SELECT H_Adres.Kraj AS "Kraj", H_Transport.Rodzaj_Transportu AS "Rodzaj Transportu", H_Transport.Nazwa "Pojazd",sum(H_IMPREZA.ilosc) AS "Ilosc biletow"
FROM H_Impreza JOIN H_ADRES ON H_IMPREZA.id_adres = H_ADRES.id_adres JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by cube(H_Adres.Kraj, H_Transport.Rodzaj_Transportu,H_Transport.Nazwa);

--ile jaki pojazd zarobil pieniedzy
SELECT H_Adres.Kraj AS "Kraj", H_Transport.Rodzaj_Transportu AS "Rodzaj Transportu",sum(H_Impreza.Cena_biletu*H_IMPREZA.ilosc) AS "Suma kwota"
FROM H_Impreza JOIN H_ADRES ON H_IMPREZA.id_adres = H_ADRES.id_adres JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by cube(H_Adres.Kraj, H_Transport.Rodzaj_Transportu);

SELECT H_Adres.Kraj AS "Kraj", H_Transport.Rodzaj_Transportu AS "Rodzaj Transportu", H_Transport.Nazwa "Pojazd",sum(H_Impreza.Cena_biletu*H_IMPREZA.ilosc) AS "Suma kwota"
FROM H_Impreza JOIN H_ADRES ON H_IMPREZA.id_adres = H_ADRES.id_adres JOIN H_Transport ON H_Impreza.id_transport = H_Transport.id_transport
group by cube(H_Adres.Kraj, H_Transport.Rodzaj_Transportu,H_Transport.Nazwa);