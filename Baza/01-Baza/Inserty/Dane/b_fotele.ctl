load data
infile 'b_fotele.csv'
append into table B_FOTELE
fields terminated by ','
trailing nullcols
(ID_FOTEL,NUMER)