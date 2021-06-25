load data
infile 'b_rzedy_fotele.csv'
append into table B_RZEDY_FOTELE
fields terminated by ','
trailing nullcols
(ID_RZEDY_FOTELE,ID_RZAD,ID_FOTEL)