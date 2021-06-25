import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;

public class SalaMain {
    static int id = 1;
    static int numberOfRecords = 1000;


    public static void main(String[] args) {

        for (int i = 0; i < 10; i++)
            Price();
    }

    static void Price()
    {
        String priceFormat = "###0.0'0'";

        DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
        unusualSymbols.setDecimalSeparator('.');
        unusualSymbols.setGroupingSeparator(',');

        DecimalFormat formatter = new DecimalFormat(priceFormat, unusualSymbols);

        double liczba = (Math.random() * (300 - 20 + 1) + 20);

        String wynik = formatter.format(liczba);
        System.out.println(wynik);
    }

    public static int Number(int start, int end)
    {
        if (end < start)
            return 0;

        int wynik = (int) (Math.random() * (end - start + 1) + start);
        return wynik;
    }

    static private String GenerateDatetime()
    {
        String datetime = "";

        Integer imonth = (int)(Math.random() * 12 + 1);
        Integer iday = (int)(Math.random() * 29 + 1);
        Integer ihour = (int)(Math.random() * 24);
        Integer iminute = (int)((Math.random() * 7) * 10);

        String smonth = imonth.toString();
        String sday = iday.toString();
        String shour = ihour.toString();
        String sminute = iminute.toString();

        if (smonth.length() == 1)
            smonth = "0" + smonth;
        if (sday.length() == 1)
            sday = "0" + sday;
        if (shour.length() == 1)
            shour = "0" + shour;
        if (sminute.length() == 1)
            sminute = "0" + sminute;

        datetime = "2021-" + smonth + "-" + sday + " " + shour + ":" + sminute + ":00";
        return datetime;
    }


}
