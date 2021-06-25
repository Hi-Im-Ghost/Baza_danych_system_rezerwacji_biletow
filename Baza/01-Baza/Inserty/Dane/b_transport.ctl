load data
infile 'b_transport.csv'
append into table B_TRANSPORT
fields terminated by ','
trailing nullcols
(ID_TRANSPORT,ID_RODZAJ_TRANSPORTU,NAZWA,ILOSC_MIEJSC)