load data
infile 'b_miejsca.csv'
append into table B_MIEJSCA
fields terminated by ','
trailing nullcols
(ID_MIEJSCA,ID_RZEDY_FOTELE)