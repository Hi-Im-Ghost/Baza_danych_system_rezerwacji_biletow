load data
infile 'b_rodzaj_transportu.csv'
append into table B_RODZAJ_TRANSPORTU
fields terminated by ','
trailing nullcols
(ID_RODZAJ_TRANSPORTU,NAZWA)