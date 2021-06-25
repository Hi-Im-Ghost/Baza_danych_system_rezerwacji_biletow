load data
infile 'b_sala.csv'
append into table B_SALA
fields terminated by ','
trailing nullcols
(ID_SALA,NUMER_SALI,ID_ADRES)