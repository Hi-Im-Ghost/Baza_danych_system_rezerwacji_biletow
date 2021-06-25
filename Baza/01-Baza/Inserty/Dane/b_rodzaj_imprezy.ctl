load data
infile 'b_rodzaj_imprezy.csv'
append into table B_RODZAJ_IMPREZY
fields terminated by ','
trailing nullcols
(ID_RODZAJ_IMPREZY,NAZWA)