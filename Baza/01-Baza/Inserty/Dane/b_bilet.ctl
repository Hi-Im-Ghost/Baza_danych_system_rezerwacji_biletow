load data
infile 'b_bilet.csv'
append into table B_BILET
fields terminated by ','
trailing nullcols
(ID_BILET,ID_OSOBY,ID_IMPREZA)