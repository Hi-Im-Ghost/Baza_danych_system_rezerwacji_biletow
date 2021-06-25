load data
infile 'b_rodzaj_biletu.csv'
append into table B_RODZAJ_BILETU
fields terminated by ','
trailing nullcols
(ID_RODZAJ_BILETU,NAZWA,ID_RODZAJ_ULGI)