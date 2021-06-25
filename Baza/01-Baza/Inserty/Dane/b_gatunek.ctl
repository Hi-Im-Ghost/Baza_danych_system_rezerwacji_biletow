load data
infile 'b_gatunek.csv'
append into table B_GATUNEK
fields terminated by ','
trailing nullcols
(ID_GATUNEK,NAZWA)