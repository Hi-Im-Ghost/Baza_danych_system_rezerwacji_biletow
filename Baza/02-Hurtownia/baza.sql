--DROPY
drop table H_Adres cascade constraints PURGE;
drop table H_Rodzaj_Biletu cascade constraints PURGE;
drop table H_Data cascade constraints PURGE;
drop table H_Impreza cascade constraints PURGE;
drop table H_Rodzaj_Imprezy cascade constraints PURGE;
drop table H_Spektakl cascade constraints PURGE;
drop table H_Transport cascade constraints PURGE;
drop table H_Wykonawcy cascade constraints PURGE;

drop sequence H_ADRES_ID_ADRES_SEQ;
drop sequence H_DATA_ID_DATA_SEQ;
drop sequence H_IMPREZA_ID_IMPREZA_SEQ;
drop sequence H_RODZAJ_BILETU_ID_RODZAJ_BILETU_SEQ;
drop sequence H_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY_SEQ;
drop sequence H_SPEKTAKL_ID_SPEKTAKL_SEQ;
drop sequence H_TRANSPORT_ID_TRANSPORT_SEQ;
drop sequence H_WYKONAWCY_ID_WYKONAWCY_SEQ;


CREATE TABLE H_Adres (
	id_adres NUMBER NOT NULL,
	Kraj VARCHAR2(20) NOT NULL,
	constraint H_ADRES_PK PRIMARY KEY (id_adres));

CREATE sequence H_ADRES_ID_ADRES_SEQ;

CREATE trigger H_BI_ADRES_ID_ADRES
  before insert on H_Adres
  for each row
begin
  select H_ADRES_ID_ADRES_SEQ.nextval into :NEW.id_adres from dual;
end;

/
CREATE TABLE H_Impreza (
	id_impreza NUMBER NOT NULL,
	id_rodzaj_biletu NUMBER NOT NULL,
	id_adres NUMBER NOT NULL,
	id_rodzaj_imprezy NUMBER NOT NULL,
	id_wykonawcy NUMBER,
	id_spektakl NUMBER,
	id_transport NUMBER,
	id_data NUMBER,
	cena_biletu NUMBER NOT NULL,
	ilosc NUMBER NOT NULL,
	constraint H_IMPREZA_PK PRIMARY KEY (id_impreza));

CREATE sequence H_IMPREZA_ID_IMPREZA_SEQ;

CREATE trigger H_BI_IMPREZA_ID_IMPREZA
  before insert on H_Impreza
  for each row
begin
  select H_IMPREZA_ID_IMPREZA_SEQ.nextval into :NEW.id_impreza from dual;
end;

/
CREATE TABLE H_Rodzaj_Imprezy (
	id_rodzaj_imprezy NUMBER NOT NULL,
	Nazwa VARCHAR2(50) NOT NULL,
	constraint H_RODZAJ_IMPREZY_PK PRIMARY KEY (id_rodzaj_imprezy));

CREATE sequence H_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY_SEQ;

CREATE trigger H_BI_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY
  before insert on H_Rodzaj_Imprezy
  for each row
begin
  select H_RODZAJ_IMPREZY_ID_RODZAJ_IMPREZY_SEQ.nextval into :NEW.id_rodzaj_imprezy from dual;
end;

/
CREATE TABLE H_Wykonawcy (
	id_wykonawcy NUMBER NOT NULL,
	Nazwa VARCHAR2(50) NOT NULL,
	constraint H_WYKONAWCY_PK PRIMARY KEY (id_wykonawcy));

CREATE sequence H_WYKONAWCY_ID_WYKONAWCY_SEQ;

CREATE trigger H_BI_WYKONAWCY_ID_WYKONAWCY
  before insert on H_Wykonawcy
  for each row
begin
  select H_WYKONAWCY_ID_WYKONAWCY_SEQ.nextval into :NEW.id_wykonawcy from dual;
end;

/
CREATE TABLE H_Spektakl (
	id_spektakl NUMBER NOT NULL,
	Gatunek VARCHAR2(30) NOT NULL,
	Tytul VARCHAR2(100) NOT NULL,
	constraint H_SPEKTAKL_PK PRIMARY KEY (id_spektakl));

CREATE sequence H_SPEKTAKL_ID_SPEKTAKL_SEQ;

CREATE trigger H_BI_SPEKTAKL_ID_SPEKTAKL
  before insert on H_Spektakl
  for each row
begin
  select H_SPEKTAKL_ID_SPEKTAKL_SEQ.nextval into :NEW.id_spektakl from dual;
end;

/
CREATE TABLE H_Transport (
	id_transport NUMBER NOT NULL,
	Rodzaj_transportu VARCHAR2(30) NOT NULL,
	nazwa VARCHAR2(50) NOT NULL,
	ilosc_miejsc NUMBER NOT NULL,
	constraint H_TRANSPORT_PK PRIMARY KEY (id_transport));

CREATE sequence H_TRANSPORT_ID_TRANSPORT_SEQ;

CREATE trigger H_BI_TRANSPORT_ID_TRANSPORT
  before insert on H_Transport
  for each row
begin
  select H_TRANSPORT_ID_TRANSPORT_SEQ.nextval into :NEW.id_transport from dual;
end;

/
CREATE TABLE H_Data (
	id_data NUMBER NOT NULL,
	Miesiac NUMBER NOT NULL,
	Rok NUMBER(4) NOT NULL,
	constraint H_DATA_PK PRIMARY KEY (id_data));

CREATE sequence H_DATA_ID_DATA_SEQ;

CREATE trigger H_BI_DATA_ID_DATA
  before insert on H_Data
  for each row
begin
  select H_DATA_ID_DATA_SEQ.nextval into :NEW.id_data from dual;
end;

/
CREATE TABLE H_Rodzaj_biletu (
	id_rodzaj_biletu NUMBER NOT NULL,
	nazwa VARCHAR2(70) NOT NULL,
	rodzaj_ulgi VARCHAR2(55),
	ulga NUMBER,
	constraint H_RODZAJ_BILETU_PK PRIMARY KEY (id_rodzaj_biletu));

CREATE sequence H_RODZAJ_BILETU_ID_RODZAJ_BILETU_SEQ;

CREATE trigger H_BI_RODZAJ_BILETU_ID_RODZAJ_BILETU
  before insert on H_Rodzaj_biletu
  for each row
begin
  select H_RODZAJ_BILETU_ID_RODZAJ_BILETU_SEQ.nextval into :NEW.id_rodzaj_biletu from dual;
end;

/

ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk0 FOREIGN KEY (id_rodzaj_biletu) REFERENCES H_Rodzaj_biletu(id_rodzaj_biletu);
ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk1 FOREIGN KEY (id_adres) REFERENCES H_Adres(id_adres);
ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk2 FOREIGN KEY (id_rodzaj_imprezy) REFERENCES H_Rodzaj_Imprezy(id_rodzaj_imprezy);
ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk3 FOREIGN KEY (id_wykonawcy) REFERENCES H_Wykonawcy(id_wykonawcy);
ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk4 FOREIGN KEY (id_spektakl) REFERENCES H_Spektakl(id_spektakl);
ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk5 FOREIGN KEY (id_transport) REFERENCES H_Transport(id_transport);
ALTER TABLE H_Impreza ADD CONSTRAINT H_Impreza_fk6 FOREIGN KEY (id_data) REFERENCES H_Data(id_data);






