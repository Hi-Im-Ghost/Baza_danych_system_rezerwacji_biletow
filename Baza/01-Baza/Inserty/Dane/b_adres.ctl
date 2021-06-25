load data
infile 'b_adres.csv'
replace into table B_ADRES
fields terminated by ','
trailing nullcols
(ID_ADRES,KRAJ,MIASTO,ULICA,NR_BUDYNKU)