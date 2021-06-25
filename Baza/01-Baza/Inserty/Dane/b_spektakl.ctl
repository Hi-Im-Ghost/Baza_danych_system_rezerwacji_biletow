load data
infile 'b_spektakl.csv'
append into table B_SPEKTAKL
fields terminated by ','
trailing nullcols
(ID_SPEKTAKL,TYTUL,CZAS_TRWANIA,ID_GATUNEK)