load data
infile 'b_rzedy.csv'
append into table B_RZEDY
fields terminated by ','
trailing nullcols
(ID_RZAD,NUMER)