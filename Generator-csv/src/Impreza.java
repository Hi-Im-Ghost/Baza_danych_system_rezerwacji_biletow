public class Impreza {
    int id_impreza;
    int id_adres;
    String id_rodzaj_imprezy;
    String id_wykonawcy;
    String id_spektakl;
    String id_transport;
    String data_rozpoczecia;
    String cena_biletu;

    public Impreza(int id_impreza, int id_adres, String id_rodzaj_imprezy, String id_wykonawcy, String id_spektakl, String id_transport, String data_rozpoczecia, String cena_biletu)
    {
        this.id_impreza = id_impreza;
        this.id_adres = id_adres;
        this.id_rodzaj_imprezy = id_rodzaj_imprezy;
        this.id_wykonawcy = id_wykonawcy;
        this.id_spektakl = id_spektakl;
        this.id_transport = id_transport;
        this.data_rozpoczecia = data_rozpoczecia;
        this.cena_biletu = cena_biletu;
    }
}
