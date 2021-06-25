import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.Map;

public class GetRandom {

    static Map<Integer, EWykonawca> wykonawcy = new HashMap<Integer, EWykonawca>();

    public enum EWykonawca {
        Trupa,
        Zespół
    }

    public static int GetWykonawca(EWykonawca typ)
    {
        if (wykonawcy == null)
        {
            // Generate wykonawcy
            for (int i = 0; i < 1000; i++)
            {
                int rand = (int) (Math.random() * 2 + 1);

                switch (rand)
                {
                    case 1: wykonawcy.put(i, EWykonawca.Trupa);
                        break;
                    case 2: wykonawcy.put(i, EWykonawca.Zespół);
                        break;
                }
            }
        }

        // main function
        int rand = 0;
        while (true) {
            rand = (int) (Math.random() * 1000 + 1);

            if (wykonawcy.get(rand) != typ)
                break;
        }
        return rand;
    }

    public static int GetTransport(HandwrittenTypes.ETransportType typ)
    {
        int id = 0;

        switch (typ) {
            case Samolot: return Number(FileOperations.Samoloty.get(0), FileOperations.Samoloty.get(FileOperations.Samoloty.size()-1));
            case Pociag: return Number(FileOperations.Pociągi.get(0), FileOperations.Pociągi.get(FileOperations.Pociągi.size()-1));
            case Autokar: return Number(FileOperations.Autokary.get(0), FileOperations.Autokary.get(FileOperations.Autokary.size()-1));
            case Tramwaj: return Number(FileOperations.Tramwaje.get(0), FileOperations.Tramwaje.get(FileOperations.Tramwaje.size()-1));
            case Statek: return Number(FileOperations.Statki.get(0), FileOperations.Statki.get(FileOperations.Statki.size()-1));
            case Samochod: return Number(FileOperations.Samochody.get(0), FileOperations.Samochody.get(FileOperations.Samochody.size()-1));
            default: return id;
        }
    }

    public static int Number(int start, int end)
    {
        if (end < start)
            return 0;

        int wynik = (int) (Math.random() * (end - start + 1) + start);
        return wynik;
    }

    public static String Price(int start, int end)
    {
        if (end < start)
            return "0";

        String priceFormat = "###0.0'0'";

        DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
        unusualSymbols.setDecimalSeparator('.');
        unusualSymbols.setGroupingSeparator(',');

        DecimalFormat formatter = new DecimalFormat(priceFormat, unusualSymbols);

        double liczba = (Math.random() * (end - start + 1) + start);

        String wynik = formatter.format(liczba);
        return wynik;
    }


}
