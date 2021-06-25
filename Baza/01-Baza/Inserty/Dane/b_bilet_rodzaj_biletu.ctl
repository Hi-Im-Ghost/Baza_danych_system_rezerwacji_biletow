load data
infile 'b_bilet_rodzaj_biletu.csv'
append into table B_BILET_RODZAJ_BILETU
fields terminated by ','
trailing nullcols
(ID_BILET_RODZAJ_BILETU,ID_BILET,ID_RODZAJ_BILETU,ILOSC)