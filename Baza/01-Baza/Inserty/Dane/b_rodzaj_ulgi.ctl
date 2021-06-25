load data
infile 'b_rodzaj_ulgi.csv'
append into table B_RODZAJ_ULGI
fields terminated by ','
trailing nullcols
(ID_RODZAJ_ULGI,NAZWA,ULGA)