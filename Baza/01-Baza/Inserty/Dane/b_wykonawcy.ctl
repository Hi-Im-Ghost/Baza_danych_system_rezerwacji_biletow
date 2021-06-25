load data
infile 'b_wykonawcy.csv'
append into table B_WYKONAWCY
fields terminated by ','
trailing nullcols
(ID_WYKONAWCY,NAZWA)