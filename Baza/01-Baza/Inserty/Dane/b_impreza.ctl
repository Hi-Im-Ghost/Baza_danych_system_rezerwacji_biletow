load data
infile 'b_impreza.csv'
append into table B_IMPREZA
fields terminated by ',' optionally enclosed by "'"
trailing nullcols
(ID_IMPREZA,ID_ADRES,ID_RODZAJ_IMPREZY,ID_WYKONAWCY,ID_SPEKTAKL,ID_TRANSPORT,DATA_ROZPOCZECIA "TO_TIMESTAMP(:DATA_ROZPOCZECIA,'YYYY-MM-DD HH24:MI:SS')",CENA_BILETU)