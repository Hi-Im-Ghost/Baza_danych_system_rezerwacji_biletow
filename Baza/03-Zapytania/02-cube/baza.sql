---CUBE
--preferencje gatunkowe ogólne
SELECT B_Adres.Kraj AS "Kraj", B_Gatunek.nazwa AS "Gatunek", B_Spektakl.Tytul AS "Tytul", sum(B_Bilet_Rodzaj_Biletu.ILOSC) AS "Ilosc biletow"
FROM B_Impreza JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_ADRES ON B_IMPREZA.id_adres = B_ADRES.id_adres JOIN B_SPEKTAKL ON B_SPEKTAKL.ID_SPEKTAKL = B_IMPREZA.ID_SPEKTAKL JOIN B_GATUNEK ON B_SPEKTAKL.ID_GATUNEK = B_GATUNEK.ID_GATUNEK
group by cube(B_Adres.Kraj, B_Gatunek.nazwa, B_Spektakl.Tytul);

SELECT B_Adres.Kraj AS "Kraj", B_Gatunek.nazwa AS "Gatunek",sum(B_Bilet_Rodzaj_Biletu.ILOSC) AS "Ilosc biletow"
FROM B_Impreza JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_ADRES ON B_IMPREZA.id_adres = B_ADRES.id_adres JOIN B_SPEKTAKL ON B_SPEKTAKL.ID_SPEKTAKL = B_IMPREZA.ID_SPEKTAKL JOIN B_GATUNEK ON B_SPEKTAKL.ID_GATUNEK = B_GATUNEK.ID_GATUNEK
group by cube(B_Adres.Kraj, B_Gatunek.nazwa);

--preferencje przewozowe
SELECT B_Adres.Kraj AS "Kraj", B_Rodzaj_Transportu.nazwa AS "Rodzaj Transportu",sum(B_Bilet_Rodzaj_Biletu.ILOSC) AS "Ilosc biletow"
FROM B_Impreza JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_ADRES ON B_IMPREZA.id_adres = B_ADRES.id_adres JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport JOIN B_Rodzaj_Transportu ON B_Transport.id_rodzaj_transportu = B_Rodzaj_Transportu.id_rodzaj_transportu
group by cube(B_Adres.Kraj, B_Rodzaj_Transportu.nazwa);

SELECT B_Adres.Kraj AS "Kraj", B_Rodzaj_Transportu.nazwa AS "Rodzaj Transportu", B_Transport.Nazwa "Pojazd",sum(B_Bilet_Rodzaj_Biletu.ILOSC) AS "Ilosc biletow"
FROM B_Impreza JOIN B_Bilet ON B_Bilet.id_impreza = B_Impreza.id_impreza JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet JOIN B_ADRES ON B_IMPREZA.id_adres = B_ADRES.id_adres JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport JOIN B_Rodzaj_Transportu ON B_Transport.id_rodzaj_transportu = B_Rodzaj_Transportu.id_rodzaj_transportu
group by cube(B_Adres.Kraj, B_Rodzaj_Transportu.nazwa,B_Transport.Nazwa);

--ile jaki pojazd zarobil pieniedzy
SELECT B_Adres.Kraj AS "Kraj", B_Rodzaj_Transportu.nazwa AS "Rodzaj Transportu",sum(B_Impreza.Cena_biletu*B_Bilet_Rodzaj_Biletu.ilosc) AS "Suma kwota"
FROM B_Impreza JOIN B_ADRES ON B_IMPREZA.id_adres = B_ADRES.id_adres JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport JOIN B_Rodzaj_Transportu ON B_Transport.id_rodzaj_transportu = B_Rodzaj_Transportu.id_rodzaj_transportu
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
group by cube(B_Adres.Kraj, B_Rodzaj_Transportu.nazwa);

SELECT B_Adres.Kraj AS "Kraj", B_Rodzaj_Transportu.nazwa AS "Rodzaj Transportu", B_Transport.Nazwa "Pojazd",sum(B_Impreza.Cena_biletu*B_Bilet_Rodzaj_Biletu.ilosc) AS "Suma kwota"
FROM B_Impreza JOIN B_ADRES ON B_IMPREZA.id_adres = B_ADRES.id_adres JOIN B_Transport ON B_Impreza.id_transport = B_Transport.id_transport JOIN B_Rodzaj_Transportu ON B_Transport.id_rodzaj_transportu = B_Rodzaj_Transportu.id_rodzaj_transportu
JOIN B_Bilet ON B_Bilet.id_impreza = B_IMPREZA.id_impreza
JOIN B_Bilet_Rodzaj_Biletu ON B_Bilet_Rodzaj_Biletu.id_bilet = B_Bilet.id_bilet
group by cube(B_Adres.Kraj, B_Rodzaj_Transportu.nazwa,B_Transport.Nazwa);