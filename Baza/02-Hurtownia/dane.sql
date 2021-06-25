--ADRES
INSERT INTO H_ADRES(id_adres,kraj)
SELECT ROW_NUMBER() OVER(ORDER BY s.kraj), s.kraj
FROM
    (SELECT DISTINCT kraj FROM B_adres) s;
/
--Rodzaj imprezy
INSERT INTO H_RODZAJ_IMPREZY(id_rodzaj_imprezy, nazwa)
SELECT id_rodzaj_imprezy, nazwa FROM B_rodzaj_imprezy;
/
--Spektakl
INSERT INTO H_SPEKTAKL(id_spektakl,gatunek,tytul)
SELECT id_spektakl, nazwa, tytul FROM B_spektakl
JOIN B_gatunek ON B_spektakl.id_gatunek = B_gatunek.id_gatunek;
/
--DATA
INSERT INTO H_DATA(id_data,miesiac,rok) SELECT ROW_NUMBER() OVER(ORDER BY s.rok, s.miesiac), s.miesiac, s.rok
FROM
    (SELECT DISTINCT EXTRACT(MONTH FROM data_rozpoczecia) as miesiac, EXTRACT(YEAR FROM data_rozpoczecia) as rok FROM B_impreza) s;
/
--Rodzaj_biletu
INSERT INTO h_rodzaj_biletu(id_rodzaj_biletu, nazwa, rodzaj_ulgi, ulga)
SELECT rb.id_rodzaj_biletu AS id_rodzaj_biletu, rb.nazwa AS nazwa, ru.nazwa AS rodzaj_ulgi, ru.ulga AS ulga
FROM B_Rodzaj_Biletu rb
LEFT JOIN B_Rodzaj_ulgi ru ON ru.id_rodzaj_ulgi = rb.id_rodzaj_ulgi;
/
--Wykonawcy
INSERT INTO H_WYKONAWCY(id_wykonawcy,nazwa)
SELECT * FROM B_wykonawcy;
/
--Transport
INSERT INTO H_TRANSPORT(id_transport, rodzaj_transportu, nazwa, ilosc_miejsc)
SELECT t.id_transport, rt.nazwa AS rodzaj_transportu, t.nazwa AS nazwa, t.ilosc_miejsc AS ilosc_miejsc FROM B_transport t
JOIN B_rodzaj_transportu rt ON t.id_rodzaj_transportu = rt.id_rodzaj_transportu;
/
--IMPREZA
--Te funkcje sa wymagane do dzialania imprezy
CREATE OR REPLACE FUNCTION getDate (impreza_id NUMBER)
    RETURN NUMBER
    IS data_id NUMBER;
    BEGIN
        SELECT hd.id_data INTO data_id
        FROM H_DATA hd, (SELECT id_impreza, EXTRACT(MONTH FROM B_impreza.data_rozpoczecia) as miesiac, EXTRACT(YEAR FROM B_impreza.data_rozpoczecia) as rok FROM B_impreza) s
        WHERE hd.miesiac = s.miesiac AND hd.rok = s.rok AND s.id_impreza = impreza_id;
        RETURN (data_id);
    END;
/

CREATE OR REPLACE FUNCTION getAdres (B_adres_id NUMBER)
    RETURN NUMBER
    IS H_adres_id NUMBER;
    BEGIN
        SELECT id_adres INTO H_adres_id FROM H_ADRES
        WHERE kraj =
        (
            SELECT kraj FROM B_ADRES WHERE id_adres = B_adres_id
        );
        RETURN (H_adres_id);
    END;
/

CREATE OR REPLACE FUNCTION getSpektakl (old_id NUMBER)
    RETURN NUMBER
    IS new_id NUMBER;
    BEGIN
        SELECT id_spektakl INTO new_id FROM H_SPEKTAKL
        WHERE tytul LIKE
        (
            SELECT tytul FROM B_SPEKTAKL WHERE id_spektakl = old_id
        );
        RETURN (new_id);
    END;
/

CREATE OR REPLACE FUNCTION getTransport (old_id NUMBER)
    RETURN NUMBER
    IS new_id NUMBER;
    BEGIN
        SELECT id_transport INTO new_id FROM H_TRANSPORT
        WHERE nazwa LIKE
        (
            SELECT nazwa FROM B_TRANSPORT WHERE id_transport = old_id
        );
        RETURN (new_id);
    END;
/

CREATE OR REPLACE FUNCTION getRodzajImprezy (old_id NUMBER)
    RETURN NUMBER
    IS new_id NUMBER;
    BEGIN
        SELECT id_rodzaj_imprezy INTO new_id FROM H_RODZAJ_IMPREZY
        WHERE nazwa LIKE
        (
            SELECT nazwa FROM B_RODZAJ_IMPREZY WHERE id_rodzaj_imprezy = old_id
        );
        RETURN (new_id);
    END;
/

CREATE OR REPLACE FUNCTION getWykonawca (old_id NUMBER)
    RETURN NUMBER
    IS new_id NUMBER;
    BEGIN
        SELECT id_wykonawcy INTO new_id FROM H_WYKONAWCY
        WHERE nazwa LIKE
        (
            SELECT nazwa FROM B_WYKONAWCY WHERE id_wykonawcy = old_id
        );
        RETURN (new_id);
    END;
/
----
INSERT INTO H_IMPREZA(id_impreza, id_rodzaj_biletu, id_adres, id_rodzaj_imprezy,
    id_wykonawcy, id_spektakl, id_transport, id_data, cena_biletu, ilosc)
SELECT i.id_impreza,
    brb.id_rodzaj_biletu,
    getAdres(i.id_adres),
    getRodzajImprezy(i.id_rodzaj_imprezy),
    getWykonawca(i.id_wykonawcy),
    getSpektakl(i.id_spektakl),
    getTransport(i.id_transport),
    getDate(i.id_impreza),
    i.cena_biletu,
    brb.ilosc
FROM B_impreza i
JOIN B_Bilet ON b_bilet.id_impreza = i.id_impreza
JOIN B_Bilet_rodzaj_biletu brb ON brb.id_bilet = b_bilet.id_bilet;
/
--dropy funkcji
    DROP FUNCTION getDate;
    DROP FUNCTION getAdres;
    DROP FUNCTION getSpektakl;
    DROP FUNCTION getTransport;
    DROP FUNCTION getRodzajImprezy;
    DROP FUNCTION getWykonawca;