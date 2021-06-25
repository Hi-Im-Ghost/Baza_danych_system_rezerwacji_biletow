load data
infile 'b_sala_miejsca.csv'
append into table B_SALA_MIEJSCA
fields terminated by ','
trailing nullcols
(ID_SALA_MIEJSCA,ID_SALA,ID_MIEJSCA)