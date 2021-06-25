load data
infile 'b_osoba.csv'
append into table B_OSOBA
fields terminated by ','
trailing nullcols
(ID_OSOBY,IMIE,NAZWISKO,NR_TELEFONU)