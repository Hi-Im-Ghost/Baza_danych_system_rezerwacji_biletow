cd Inserty/Dane
set user=STUDENT_DB/student
sqlldr USERID=%user% control=b_osoba.ctl
sqlldr USERID=%user% control=b_rodzaj_ulgi.ctl
sqlldr USERID=%user% control=b_rodzaj_biletu.ctl
sqlldr USERID=%user% control=b_rodzaj_transportu.ctl
sqlldr USERID=%user% control=b_transport.ctl
sqlldr USERID=%user% control=b_gatunek.ctl
sqlldr USERID=%user% control=b_spektakl.ctl
sqlldr USERID=%user% control=b_wykonawcy.ctl
sqlldr USERID=%user% control=b_rodzaj_imprezy.ctl
sqlldr USERID=%user% control=b_adres.ctl
sqlldr USERID=%user% control=b_sala.ctl
sqlldr USERID=%user% control=b_fotele.ctl
sqlldr USERID=%user% control=b_rzedy.ctl
sqlldr USERID=%user% control=b_rzedy_fotele.ctl
sqlldr USERID=%user% control=b_miejsca.ctl
sqlldr USERID=%user% control=b_sala_miejsca.ctl
sqlldr USERID=%user% control=b_impreza.ctl
sqlldr USERID=%user% control=b_bilet.ctl
sqlldr USERID=%user% control=b_bilet_rodzaj_biletu.ctl
pause