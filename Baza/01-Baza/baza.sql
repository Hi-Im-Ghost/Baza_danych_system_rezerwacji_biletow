--DROPY
drop table B_Adres cascade constraints PURGE;
drop table B_Bilet cascade constraints PURGE;
drop table B_Bilet_Rodzaj_Biletu cascade constraints PURGE;
drop table B_Fotele cascade constraints PURGE;
drop table B_Gatunek cascade constraints PURGE;
drop table B_Impreza cascade constraints PURGE;
drop table B_Miejsca cascade constraints PURGE;
drop table B_Osoba cascade constraints PURGE;
drop table B_Rodzaj_Biletu cascade constraints PURGE;
drop table B_Rodzaj_Imprezy cascade constraints PURGE;
drop table B_Rodzaj_Transportu cascade constraints PURGE;
drop table B_Rodzaj_ulgi cascade constraints PURGE;
drop table B_Rzedy cascade constraints PURGE;
drop table B_Rzedy_fotele cascade constraints PURGE;
drop table B_Sala cascade constraints PURGE;
drop table B_Sala_miejsca cascade constraints PURGE;
drop table B_Spektakl cascade constraints PURGE;
drop table B_Transport cascade constraints PURGE;
drop table B_Wykonawcy cascade constraints PURGE;

drop sequence B_ADRES_ID_ADRES_SEQ;
drop sequence B_BILET_ID_BILET_SEQ;
drop sequence B_FOTELE_ID_FOTEL_SEQ;
drop sequence B_GATUNEK_ID_GATUNEK_SEQ;
drop sequence B_IMPREZA_ID_IMPREZA_SEQ;
drop sequence B_MIEJSCA_ID_MIEJSCA_SEQ;
drop sequence B_OSOBA_ID_OSOBY_SEQ;
drop sequence B_RODZAJ_BILETU_ID_RODZAJ_BILETU_SEQ;
drop sequence B_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY_SEQ;
drop sequence B_RODZAJ_TRANSPORTU_ID_RODZAJ_TRANSPORTU_SEQ;
drop sequence B_RZEDY_FOTELE_ID_RZEDY_FOTELE_SEQ;
drop sequence B_RZEDY_ID_RZAD_SEQ;
drop sequence B_SALA_ID_SALA_SEQ;
drop sequence B_SALA_MIEJSCA_ID_SALA_MIEJSCA_SEQ;
drop sequence B_SPEKTAKL_ID_SPEKTAKL_SEQ;
drop sequence B_TRANSPORT_ID_TRANSPORT_SEQ;
drop sequence B_WYKONAWCY_ID_WYKONAWCY_SEQ;

--CREATY
CREATE TABLE B_Adres (
	id_adres NUMBER NOT NULL,
	Kraj VARCHAR2(50) NOT NULL,
	Miasto VARCHAR2(50) NOT NULL,
	Ulica VARCHAR2(30) NOT NULL,
	Nr_budynku NUMBER NOT NULL,
	constraint B_ADRES_PK PRIMARY KEY (id_adres));

CREATE sequence B_ADRES_ID_ADRES_SEQ;

CREATE trigger B_BI_ADRES_ID_ADRES
  before insert on B_Adres
  for each row
begin
  select B_ADRES_ID_ADRES_SEQ.nextval into :NEW.id_adres from dual;
end;

/
CREATE TABLE B_Impreza (
	id_impreza NUMBER NOT NULL,
	id_adres NUMBER NOT NULL,
	id_rodzaj_imprezy NUMBER NOT NULL,
	id_wykonawcy NUMBER,
	id_spektakl NUMBER,
	id_transport NUMBER,
	data_rozpoczecia TIMESTAMP NOT NULL,
	cena_biletu NUMBER NOT NULL,
	constraint B_IMPREZA_PK PRIMARY KEY (id_impreza));

CREATE sequence B_IMPREZA_ID_IMPREZA_SEQ;

CREATE trigger B_BI_IMPREZA_ID_IMPREZA
  before insert on B_Impreza
  for each row
begin
  select B_IMPREZA_ID_IMPREZA_SEQ.nextval into :NEW.id_impreza from dual;
end;

/
CREATE TABLE B_Rodzaj_Imprezy (
	id_rodzaj_imprezy NUMBER NOT NULL,
	Nazwa VARCHAR2(50) NOT NULL,
	constraint B_RODZAJ_IMPREZY_PK PRIMARY KEY (id_rodzaj_imprezy));

CREATE sequence B_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY_SEQ;

CREATE trigger B_BI_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY
  before insert on B_Rodzaj_Imprezy
  for each row
begin
  select B_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY_SEQ.nextval into :NEW.id_rodzaj_imprezy from dual;
end;

/
CREATE TABLE B_Wykonawcy (
	id_wykonawcy NUMBER NOT NULL,
	Nazwa VARCHAR2(50) NOT NULL,
	constraint B_WYKONAWCY_PK PRIMARY KEY (id_wykonawcy));

CREATE sequence B_WYKONAWCY_ID_WYKONAWCY_SEQ;

CREATE trigger B_BI_WYKONAWCY_ID_WYKONAWCY
  before insert on B_Wykonawcy
  for each row
begin
  select B_WYKONAWCY_ID_WYKONAWCY_SEQ.nextval into :NEW.id_wykonawcy from dual;
end;

/
CREATE TABLE B_Sala (
	id_sala NUMBER NOT NULL,
	Numer_sali NUMBER(2) NOT NULL,
	id_adres NUMBER NOT NULL,
	constraint B_SALA_PK PRIMARY KEY (id_sala));

CREATE sequence B_SALA_ID_SALA_SEQ;

CREATE trigger B_BI_SALA_ID_SALA
  before insert on B_Sala
  for each row
begin
  select B_SALA_ID_SALA_SEQ.nextval into :NEW.id_sala from dual;
end;

/
CREATE TABLE B_Miejsca (
	id_miejsca NUMBER NOT NULL,
	id_rzedy_fotele NUMBER NOT NULL,
	constraint B_MIEJSCA_PK PRIMARY KEY (id_miejsca));

CREATE sequence B_MIEJSCA_ID_MIEJSCA_SEQ;

CREATE trigger B_BI_MIEJSCA_ID_MIEJSCA
  before insert on B_Miejsca
  for each row
begin
  select B_MIEJSCA_ID_MIEJSCA_SEQ.nextval into :NEW.id_miejsca from dual;
end;

/
CREATE TABLE B_Sala_miejsca (
	id_sala_miejsca NUMBER NOT NULL,
	id_sala NUMBER NOT NULL,
	id_miejsca NUMBER NOT NULL,
	constraint B_SALA_MIEJSCA_PK PRIMARY KEY (id_sala_miejsca));

CREATE sequence B_SALA_MIEJSCA_ID_SALA_MIEJSCA_SEQ;

CREATE trigger B_BI_SALA_MIEJSCA_ID_SALA_MIEJSCA
  before insert on B_Sala_miejsca
  for each row
begin
  select B_SALA_MIEJSCA_ID_SALA_MIEJSCA_SEQ.nextval into :NEW.id_sala_miejsca from dual;
end;

/
CREATE TABLE B_Rzedy_fotele (
	id_rzedy_fotele NUMBER NOT NULL,
	id_rzad NUMBER NOT NULL,
	id_fotel NUMBER NOT NULL,
	constraint B_RZEDY_FOTELE_PK PRIMARY KEY (id_rzedy_fotele));

CREATE sequence B_RZEDY_FOTELE_ID_RZEDY_FOTELE_SEQ;

CREATE trigger B_BI_RZEDY_FOTELE_ID_RZEDY_FOTELE
  before insert on B_Rzedy_fotele
  for each row
begin
  select B_RZEDY_FOTELE_ID_RZEDY_FOTELE_SEQ.nextval into :NEW.id_rzedy_fotele from dual;
end;

/
CREATE TABLE B_Rzedy (
	id_rzad NUMBER NOT NULL,
	Numer NUMBER NOT NULL,
	constraint B_RZEDY_PK PRIMARY KEY (id_rzad));

CREATE sequence B_RZEDY_ID_RZAD_SEQ;

CREATE trigger B_BI_RZEDY_ID_RZAD
  before insert on B_Rzedy
  for each row
begin
  select B_RZEDY_ID_RZAD_SEQ.nextval into :NEW.id_rzad from dual;
end;

/
CREATE TABLE B_Fotele (
	id_fotel NUMBER NOT NULL,
	Numer NUMBER NOT NULL,
	constraint B_FOTELE_PK PRIMARY KEY (id_fotel));

CREATE sequence B_FOTELE_ID_FOTEL_SEQ;

CREATE trigger B_BI_FOTELE_ID_FOTEL
  before insert on B_Fotele
  for each row
begin
  select B_FOTELE_ID_FOTEL_SEQ.nextval into :NEW.id_fotel from dual;
end;

/
CREATE TABLE B_Osoba (
	id_osoby NUMBER NOT NULL,
	Imie VARCHAR2(30),
	Nazwisko VARCHAR2(40),
	Nr_telefonu VARCHAR2(18),
	constraint B_OSOBA_PK PRIMARY KEY (id_osoby));

CREATE sequence B_OSOBA_ID_OSOBY_SEQ;

CREATE trigger B_BI_OSOBA_ID_OSOBY
  before insert on B_Osoba
  for each row
begin
  select B_OSOBA_ID_OSOBY_SEQ.nextval into :NEW.id_osoby from dual;
end;

/
CREATE TABLE B_Bilet (
	id_bilet NUMBER NOT NULL,
	id_osoby NUMBER NOT NULL,
	id_impreza NUMBER NOT NULL,
	constraint BILET_PK PRIMARY KEY (id_bilet));

CREATE sequence B_BILET_ID_BILET_SEQ;

CREATE trigger B_BI_BILET_ID_BILET
  before insert on B_Bilet
  for each row
begin
  select B_BILET_ID_BILET_SEQ.nextval into :NEW.id_bilet from dual;
end;

/
CREATE TABLE B_Rodzaj_Biletu (
	id_rodzaj_biletu NUMBER NOT NULL,
	nazwa VARCHAR2(70) NOT NULL,
	id_rodzaj_ulgi NUMBER,
	constraint B_RODZAJ_BILETU_PK PRIMARY KEY (id_rodzaj_biletu));

CREATE sequence B_RODZAJ_BILETU_ID_RODZAJ_BILETU_SEQ;

CREATE trigger B_BI_RODZAJ_BILETU_ID_RODZAJ_BILETU
  before insert on B_Rodzaj_Biletu
  for each row
begin
  select B_RODZAJ_BILETU_ID_RODZAJ_BILETU_SEQ.nextval into :NEW.id_rodzaj_biletu from dual;
end;

/
CREATE TABLE B_Rodzaj_ulgi (
	id_rodzaj_ulgi NUMBER NOT NULL,
	nazwa VARCHAR2(55) NOT NULL,
	ulga NUMBER NOT NULL,
	constraint B_RODZAJ_ULGI_PK PRIMARY KEY (id_rodzaj_ulgi));


/
CREATE TABLE B_Bilet_Rodzaj_Biletu (
	id_bilet_rodzaj_biletu NUMBER NOT NULL,
	id_bilet NUMBER NOT NULL,
	id_rodzaj_biletu NUMBER NOT NULL,
	ilosc NUMBER NOT NULL,
	constraint B_BILET_RODZAJ_BILETU_PK PRIMARY KEY (id_bilet_rodzaj_biletu));


/
CREATE TABLE B_Spektakl (
	id_spektakl NUMBER NOT NULL,
	Tytul VARCHAR2(160) NOT NULL,
	Czas_trwania NUMBER NOT NULL,
	id_gatunek NUMBER NOT NULL,
	constraint B_SPEKTAKL_PK PRIMARY KEY (id_spektakl));

CREATE sequence B_SPEKTAKL_ID_SPEKTAKL_SEQ;

CREATE trigger B_BI_SPEKTAKL_ID_SPEKTAKL
  before insert on B_Spektakl
  for each row
begin
  select B_SPEKTAKL_ID_SPEKTAKL_SEQ.nextval into :NEW.id_spektakl from dual;
end;

/
CREATE TABLE B_Gatunek (
	id_gatunek NUMBER NOT NULL,
	nazwa VARCHAR2(30) NOT NULL,
	constraint B_GATUNEK_PK PRIMARY KEY (id_gatunek));

CREATE sequence B_GATUNEK_ID_GATUNEK_SEQ;

CREATE trigger B_BI_GATUNEK_ID_GATUNEK
  before insert on B_Gatunek
  for each row
begin
  select B_GATUNEK_ID_GATUNEK_SEQ.nextval into :NEW.id_gatunek from dual;
end;

/
CREATE TABLE B_Transport (
	id_transport NUMBER NOT NULL,
	id_rodzaj_transportu NUMBER NOT NULL,
	nazwa VARCHAR2(50) NOT NULL,
	ilosc_miejsc NUMBER NOT NULL,
	constraint B_TRANSPORT_PK PRIMARY KEY (id_transport));

CREATE sequence B_TRANSPORT_ID_TRANSPORT_SEQ;

CREATE trigger B_BI_TRANSPORT_ID_TRANSPORT
  before insert on B_Transport
  for each row
begin
  select B_TRANSPORT_ID_TRANSPORT_SEQ.nextval into :NEW.id_transport from dual;
end;

/
CREATE TABLE B_Rodzaj_Transportu (
	id_rodzaj_transportu NUMBER NOT NULL,
	nazwa VARCHAR2(30) NOT NULL,
	constraint B_RODZAJ_TRANSPORTU_PK PRIMARY KEY (id_rodzaj_transportu));

CREATE sequence B_RODZAJ_TRANSPORTU_ID_RODZAJ_TRANSPORTU_SEQ;

CREATE trigger B_BI_RODZAJ_TRANSPORTU_ID_RODZAJ_TRANSPORTU
  before insert on B_Rodzaj_Transportu
  for each row
begin
  select B_RODZAJ_TRANSPORTU_ID_RODZAJ_TRANSPORTU_SEQ.nextval into :NEW.id_rodzaj_transportu from dual;
end;

/

ALTER TABLE B_Impreza ADD CONSTRAINT B_Impreza_fk0 FOREIGN KEY (id_adres) REFERENCES B_Adres(id_adres);
ALTER TABLE B_Impreza ADD CONSTRAINT B_Impreza_fk1 FOREIGN KEY (id_rodzaj_imprezy) REFERENCES B_Rodzaj_Imprezy(id_rodzaj_imprezy);
ALTER TABLE B_Impreza ADD CONSTRAINT B_Impreza_fk2 FOREIGN KEY (id_wykonawcy) REFERENCES B_Wykonawcy(id_wykonawcy);
ALTER TABLE B_Impreza ADD CONSTRAINT B_Impreza_fk3 FOREIGN KEY (id_spektakl) REFERENCES B_Spektakl(id_spektakl);
ALTER TABLE B_Impreza ADD CONSTRAINT B_Impreza_fk4 FOREIGN KEY (id_transport) REFERENCES B_Transport(id_transport);



ALTER TABLE B_Sala ADD CONSTRAINT B_Sala_fk0 FOREIGN KEY (id_adres) REFERENCES B_Adres(id_adres);

ALTER TABLE B_Miejsca ADD CONSTRAINT B_Miejsca_fk0 FOREIGN KEY (id_rzedy_fotele) REFERENCES B_Rzedy_fotele(id_rzedy_fotele);

ALTER TABLE B_Sala_miejsca ADD CONSTRAINT B_Sala_miejsca_fk0 FOREIGN KEY (id_sala) REFERENCES B_Sala(id_sala);
ALTER TABLE B_Sala_miejsca ADD CONSTRAINT B_Sala_miejsca_fk1 FOREIGN KEY (id_miejsca) REFERENCES B_Miejsca(id_miejsca);

ALTER TABLE B_Rzedy_fotele ADD CONSTRAINT B_Rzedy_fotele_fk0 FOREIGN KEY (id_rzad) REFERENCES B_Rzedy(id_rzad);
ALTER TABLE B_Rzedy_fotele ADD CONSTRAINT B_Rzedy_fotele_fk1 FOREIGN KEY (id_fotel) REFERENCES B_Fotele(id_fotel);




ALTER TABLE B_Bilet ADD CONSTRAINT B_Bilet_fk0 FOREIGN KEY (id_osoby) REFERENCES B_Osoba(id_osoby);
ALTER TABLE B_Bilet ADD CONSTRAINT B_Bilet_fk1 FOREIGN KEY (id_impreza) REFERENCES B_Impreza(id_impreza);

ALTER TABLE B_Rodzaj_Biletu ADD CONSTRAINT B_Rodzaj_Biletu_fk0 FOREIGN KEY (id_rodzaj_ulgi) REFERENCES B_Rodzaj_ulgi(id_rodzaj_ulgi);


ALTER TABLE B_Bilet_Rodzaj_Biletu ADD CONSTRAINT B_Bilet_Rodzaj_Biletu_fk0 FOREIGN KEY (id_bilet) REFERENCES B_Bilet(id_bilet);
ALTER TABLE B_Bilet_Rodzaj_Biletu ADD CONSTRAINT B_Bilet_Rodzaj_Biletu_fk1 FOREIGN KEY (id_rodzaj_biletu) REFERENCES B_Rodzaj_Biletu(id_rodzaj_biletu);

ALTER TABLE B_Spektakl ADD CONSTRAINT B_Spektakl_fk0 FOREIGN KEY (id_gatunek) REFERENCES B_Gatunek(id_gatunek);


ALTER TABLE B_Transport ADD CONSTRAINT B_Transport_fk0 FOREIGN KEY (id_rodzaj_transportu) REFERENCES B_Rodzaj_Transportu(id_rodzaj_transportu);


