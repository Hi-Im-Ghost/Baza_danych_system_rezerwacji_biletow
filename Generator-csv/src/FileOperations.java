import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class FileOperations {

    static List<Integer> SalaAddresses = new ArrayList<Integer>();

    static List<Integer> Samoloty   = new ArrayList<Integer>();
    static List<Integer> Pociągi    = new ArrayList<Integer>();
    static List<Integer> Autokary   = new ArrayList<Integer>();
    static List<Integer> Tramwaje   = new ArrayList<Integer>();
    static List<Integer> Statki     = new ArrayList<Integer>();
    static List<Integer> Samochody  = new ArrayList<Integer>();

    static List<Bilet> Bilety = new ArrayList<Bilet>();
    static List<Impreza> Imprezy = new ArrayList<Impreza>();

    static int ilośćImprez = 10000;
    static int ilośćBiletów = 10000;

    static int[] imprezowicze = new int[ilośćBiletów + 1]; // int[id_osoby] = id_impreza

    enum EPlaceType {
        NULL,
        Kino,
        Teatr,
        Lotnisko,
        Przystanek_autobusowy,
        Port,
        Stacja_kolejowa,
        Sala_koncertowa,
        Obiekt_turystyczny
    }

    private static class Place {
        Integer addressId;
        EPlaceType placeType;
        //List<Integer> idImprez = new ArrayList<Integer>();
    }
    private static Map<Integer, Place> knownPlaces;
    //
    // MAIN
    //
    public static void main(String[] args) {
        Rodzaj_transpotu();
        Rodzaj_imprezy();

        Sala(1000);
        Sala_miejsca();

        Miejsca();

        Transport();

        Impreza();

        Rodzaj_Biletu();
        Bilet();
        Bilet_Rodzaj_Biletu();
    }


    static private void Impreza()
    {
        String fileName = "Impreza.csv";

        try {
            // Create file
            File myObj = new File(fileName);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            //Open file for writing
            FileWriter myWriter = new FileWriter(fileName);


            //////////// Main loop
            for (int id = 1; id <= ilośćImprez; id++) {

                //variables
                Place miejsce;
                int randomAddressId = (int) (Math.random() * 1000 + 1);
                //

                if (knownPlaces != null) {
                    miejsce = knownPlaces.get(randomAddressId);
                    if (miejsce != null) {
                        //If address is known already
                        myWriter.write(CreateInputString(id, miejsce));
                    } else {
                        myWriter.write(NewPlace(randomAddressId, id));
                    }
                } else {
                    knownPlaces = new HashMap<Integer, Place>();
                    myWriter.write(NewPlace(randomAddressId, id));
                }
            }
            /////////// End of main loop

            myWriter.close();
            System.out.println("Successfully wrote to the file Impreza.");

        } catch(IOException e){
            System.out.println("An error during creation of Impreza occurred.");
            e.printStackTrace();
        }


    }

    public static String CreateInputString(Integer id, Place miejsce)
    {
        //String insertString = "insert into Impreza (id_impreza, id_adres, id_rodzaj_imprezy, id_wykonawcy, id_spektakl, id_transport, data_rozpoczecia, cena_biletu) values (";
        String[] values = new String[8];
        boolean wycieczkiNaPiechotę = false;

        switch (miejsce.placeType)
        {
            case Kino:
                //id_impreza
                    values[0] = id.toString();
                //id_adres
                    values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                    values[2] = "1";
                //id_wykonawcy
                    values[3] = "";
                //id_spektakl
                    values[4] = "" + (int) (Math.random() * 1000 + 1);
                //id_transport
                    values[5] = "";
                //data_rozpoczecia
                    values[6] = GenerateDatetime();
                //cena_biletu
                    values[7] = "" + GetRandom.Price(14, 25);
                break;
            case Teatr:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "2";
                //id_wykonawcy
                values[3] = "" + GetRandom.GetWykonawca(GetRandom.EWykonawca.Trupa);
                //id_spektakl
                values[4] = "" + (int) (Math.random() * 1000 + 1);
                //id_transport
                values[5] = "";
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(50, 120);
                break;
            case Sala_koncertowa:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "3";
                //id_wykonawcy
                values[3] = "" + GetRandom.GetWykonawca(GetRandom.EWykonawca.Zespół);
                //id_spektakl
                values[4] = "";
                //id_transport
                values[5] = "";
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(30, 370);
                break;
            case Lotnisko:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "4";
                //id_wykonawcy
                values[3] = "";
                //id_spektakl
                values[4] = "";
                //id_transport
                values[5] = "" + GetRandom.GetTransport(HandwrittenTypes.ETransportType.Samolot);
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(60, 3000);
                break;
            case Przystanek_autobusowy:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "5";
                //id_wykonawcy
                values[3] = "";
                //id_spektakl
                values[4] = "";
                //id_transport
                values[5] = "" + GetRandom.GetTransport(HandwrittenTypes.ETransportType.Autokar);
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(15, 60);
                break;
            case Obiekt_turystyczny:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "6";
                //id_wykonawcy
                values[3] = "";
                //id_spektakl
                values[4] = "";
                //id_transport
                if (wycieczkiNaPiechotę = true && Math.random() < 0.3)
                    values[5] = "";
                else
                    values[5] = "" + GetRandom.GetTransport(HandwrittenTypes.ETransportType.Autokar);
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(30, 50);
                break;
            case Port:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "7";
                //id_wykonawcy
                values[3] = "";
                //id_spektakl
                values[4] = "";
                //id_transport
                values[5] = "" + GetRandom.GetTransport(HandwrittenTypes.ETransportType.Statek);
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(40, 120);
                break;
            case Stacja_kolejowa:
                //id_impreza
                values[0] = id.toString();
                //id_adres
                values[1] = miejsce.addressId.toString();
                //id_rodzaj_imprezy
                values[2] = "8";
                //id_wykonawcy
                values[3] = "";
                //id_spektakl
                values[4] = "";
                //id_transport
                values[5] = "" + GetRandom.GetTransport(HandwrittenTypes.ETransportType.Pociag);
                //data_rozpoczecia
                values[6] = GenerateDatetime();
                //cena_biletu
                values[7] = "" + GetRandom.Price(34, 200);
                break;
        }

        Imprezy.add(new Impreza(id, miejsce.addressId, values[2], values[3], values[4], values[5], values[6], values[7]));

        String insertString;
        insertString = (
                values[0] + "," +
                values[1] + "," +
                values[2] + "," +
                values[3] + "," +
                values[4] + "," +
                values[5] + "," +
                values[6] + "," +
                values[7] + "\n");

        return insertString;
    }

    static private String NewPlace(int address, int id)
    {
        Place miejsce = new Place();

        miejsce.addressId = address;

        // If given address has a hall then it must be one of these three types of buildings
        if (SalaAddresses.contains(address)) {
            //0 - Kino
            //1 - Teatr
            //2 - Sala koncertowa

            int wynikLosowania = (int) (Math.random() * 3);
            switch (wynikLosowania) {
                case 0:
                    miejsce.placeType = EPlaceType.Kino;
                    break;
                case 1:
                    miejsce.placeType = EPlaceType.Teatr;
                    break;
                case 2:
                    miejsce.placeType = EPlaceType.Sala_koncertowa;
            }
            //knownPlaces.put(id, miejsce);
            //return CreateInputString(id, miejsce);
        }
        else
        {
            switch (GetRandom.Number(1, 5))
            {
                case 1: miejsce.placeType = EPlaceType.Lotnisko;
                break;
                case 2: miejsce.placeType = EPlaceType.Przystanek_autobusowy;
                break;
                case 3: miejsce.placeType = EPlaceType.Port;
                break;
                case 4: miejsce.placeType = EPlaceType.Stacja_kolejowa;
                break;
                case 5: miejsce.placeType = EPlaceType.Obiekt_turystyczny;
            }
        }
        //Remembering the place
        knownPlaces.put(address, miejsce);

        return CreateInputString(id, miejsce);
    }

    //TODO: proper date format for csv
    static private String GenerateDatetime()
    {
        String datetime = "";

        Integer imonth = (int)(Math.random() * 12 + 1);
        Integer iday = (int)(Math.random() * 28 + 1);
        Integer ihour = GetRandom.Number(1, 12);
        Integer iminute = GetRandom.Number(0, 5) * 10;

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

    static private void Rodzaj_transpotu()
    {
        try {
            // Create file
            File myObj = new File("Rodzaj_transportu.csv");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            //Save to file
            FileWriter myWriter = new FileWriter("Rodzaj_transportu.csv");


            for (int i = 0; i < HandwrittenTypes.ETransportType.values().length; i++) {
                myWriter.write((i+1) + "," + HandwrittenTypes.ETransportType.values()[i] + "\n");
            }
            myWriter.close();
            System.out.println("Successfully wrote to the file Rodzaj_transportu.");

        } catch (IOException e) {
            System.out.println("An error during creation of Rodzaj_transportu occurred.");
            e.printStackTrace();
        }
    }

    static private void Rodzaj_imprezy()
    {
        try {
            // Create file
            File myObj = new File("Rodzaj_imprezy.csv");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            //Save to file
            FileWriter myWriter = new FileWriter("Rodzaj_imprezy.csv");


            for (int i = 0; i < HandwrittenTypes.Rodzaje_Imprezy.length; i++) {
                myWriter.write((i+1) + "," + HandwrittenTypes.Rodzaje_Imprezy[i] + "\n");
            }
            myWriter.close();
            System.out.println("Successfully wrote to the file Rodzaj_imprezy.");

        } catch (IOException e) {
            System.out.println("An error during creation of Rodzaj_imprezy occurred.");
            e.printStackTrace();
        }
    }

    public static void Sala(int numberOfRecords)
    {
        int id = 1;

        // Create file
        try {
            File myObj = new File("Sala.csv");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }
        } catch (IOException e) {
            System.out.println("An error during creation of Sala occurred.");
            e.printStackTrace();
        }
        ///

        //Save to file
        try {
            FileWriter myWriter = new FileWriter("Sala.csv");

            do {
                int salaCount = (int) (Math.random() * 5 + 1);
                int id_a = (int) (Math.random() * 1000 + 1);

                if (SalaAddresses.contains(id_a))
                    continue;

                SalaAddresses.add(id_a);

                for (int i = 1; i <= salaCount; i++) {
                    myWriter.write(id + "," + i + "," + id_a + "\n");
                    if (id > numberOfRecords)
                        break;
                    id++;
                }
            } while (id < numberOfRecords);

            myWriter.close();
            System.out.println("Successfully wrote to the file Sala.");

        } catch (IOException e) {
        System.out.println("An error during opening Sala occurred.");
        e.printStackTrace();
        }
        ///
    }

    static private void Sala_miejsca()
    {
        String filename = "Sala_miejsca.csv";

        try {
            // Create file
            File myObj = new File(filename);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            //Save to file
            FileWriter myWriter = new FileWriter(filename);

            int[][] possibleRowsSeats = {
                    {17, 32},
                    {20, 50},
                    {15, 20},
                    {12, 21},
                    {10, 30},
            };

            int id = 1;

            for (int i = 0; i < SalaAddresses.size(); i++) {

                //Randomize seat count
                int randomRow = (int) (Math.random() * possibleRowsSeats.length);
                int randomSeat = (int) (Math.random() * possibleRowsSeats.length);

                //System.out.println("Row: " + possibleRowsSeats[randomRow][0] + " - Seat: " + possibleRowsSeats[randomSeat][1]);

                int generatedMaxRows = possibleRowsSeats[randomRow][0];
                int generatedMaxSeats = possibleRowsSeats[randomSeat][1];

                for (int row = 1; row <= generatedMaxRows; row++) {
                    for (int seat = 1; seat <= generatedMaxSeats; seat++) {
                        int seatId = GetSeatId(row, seat);
                        myWriter.write(id + "," + (i + 1) + "," + seatId + "\n");
                        id++;
                    }
                }
            }
            myWriter.close();
            System.out.println("Successfully wrote to the file " + filename);

        }catch (IOException e) {
            System.out.println("An error during creation of" + filename + " occurred.");
            e.printStackTrace();
        }

    }

    private static void Miejsca()
    {
        String filename = "Miejsca.csv";

        try {
            // Create file
            File myObj = new File(filename);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            //Save to file
            FileWriter myWriter = new FileWriter(filename);

            String inputString = "";
            for(int id = 1; id <= 3000; id++)
            {
                inputString = id + "," + id + "\n";
                myWriter.write(inputString);
            }
            myWriter.close();
            System.out.println("Successfully wrote to the file " + filename);

        }catch (IOException e) {
            System.out.println("An error during creation of" + filename + " occurred.");
            e.printStackTrace();
        }
    }

    private static int GetSeatId(int row, int seatInRow)
    {
        int maxSeatsInRow = 100;

        return ( maxSeatsInRow * (row - 1) + seatInRow );
    }

    private static void Transport()
    {
        try {
            String filename = "Transport.csv";

            int id = 1;
            String inputString = "";

            // Create file
            File myObj = new File(filename);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            FileWriter myWriter = new FileWriter(filename);

            List<String> samolotLista = new ArrayList<String>();
            for ( int i = 0; i < HandwrittenTypes.Samoloty.length; i++)
                    samolotLista.add(HandwrittenTypes.Samoloty[i]);

            List<String> pociągLista = new ArrayList<String>();
            for ( int i = 0; i < HandwrittenTypes.Pociągi.length; i++)
                pociągLista.add(HandwrittenTypes.Pociągi[i]);

            List<String> autokarLista = new ArrayList<String>();
            for ( int i = 0; i < HandwrittenTypes.Autokary.length; i++)
                autokarLista.add(HandwrittenTypes.Autokary[i]);

            List<String> tramwajLista = new ArrayList<String>();
            for ( int i = 0; i < HandwrittenTypes.Tramwaje.length; i++)
                tramwajLista.add(HandwrittenTypes.Tramwaje[i]);

            List<String> statekLista = new ArrayList<String>();
            for ( int i = 0; i < HandwrittenTypes.Statki.length; i++)
                statekLista.add(HandwrittenTypes.Statki[i]);

            List<String> samochódLista = new ArrayList<String>();
            for ( int i = 0; i < HandwrittenTypes.Samochody.length; i++)
                samochódLista.add(HandwrittenTypes.Samochody[i]);

            //for (id = 1; id < 1000; id++) {
                for (int i = 0; i < HandwrittenTypes.Samoloty.length; i++) {
                    int ilośćMiejsc = (int) (Math.random() * 120 + 95); // 95 - 215
                    int index = (int) (Math.random() * samolotLista.size());

                    inputString = id + "," + 1 + "," + samolotLista.get(index) + "," + ilośćMiejsc + "\n";

                    Samoloty.add(id);
                    samolotLista.remove(index);

                    myWriter.write(inputString);

                    id++;
                }

                for (int i = 0; i < HandwrittenTypes.Pociągi.length-1; i++) {
                    int ilośćMiejsc = (int) (Math.random() * 135 + 180); // 180 - 315
                    int index = (int) (Math.random() * pociągLista.size());

                    inputString = id + ", " + 2 + "," + pociągLista.get(index) + "," + ilośćMiejsc + "\n";

                    Pociągi.add(id);
                    pociągLista.remove(index);

                    myWriter.write(inputString);
                    id++;
                }

                for (int i = 0; i < HandwrittenTypes.Autokary.length; i++) {
                    int ilośćMiejsc = (int) (Math.random() * 20 + 15); // 15 - 35
                    int index = (int) (Math.random() * autokarLista.size());

                    inputString = id + "," + 3 + "," + autokarLista.get(index) + "," + ilośćMiejsc + "\n";

                    Autokary.add(id);
                    autokarLista.remove(index);

                    myWriter.write(inputString);
                    id++;
                }

                for (int i = 0; i < HandwrittenTypes.Tramwaje.length; i++) {
                    int ilośćMiejsc = (int) (Math.random() * 51 + 25); // 25 - 76
                    int index = (int) (Math.random() * tramwajLista.size());

                    inputString = id + ", " + 4 + "," + tramwajLista.get(index) + ", " + ilośćMiejsc + "\n";

                    Tramwaje.add(id);
                    tramwajLista.remove(index);

                    myWriter.write(inputString);
                    id++;
                }

                for (int i = 0; i < HandwrittenTypes.Statki.length; i++) {
                    int ilośćMiejsc = (int) (Math.random() * 2400 + 600); // 600 - 3000
                    int index = (int) (Math.random() * statekLista.size());

                    inputString = id + ", " + 5 + "," + statekLista.get(index) + "," + ilośćMiejsc + "\n";

                    Statki.add(id);
                    statekLista.remove(index);

                    myWriter.write(inputString);
                    id++;
                }

                for (int i = 0; i < HandwrittenTypes.Samochody.length; i++) {
                    int ilośćMiejsc = (int) (Math.random() * 2 + 2); // 2 - 4
                    int index = (int) (Math.random() * samochódLista.size());

                    inputString = id + ", " + 6 + "," + samochódLista.get(index) + "," + ilośćMiejsc + "\n";

                    Samochody.add(id);
                    samochódLista.remove(index);

                    myWriter.write(inputString);
                    id++;
                }
            //}

            myWriter.close();

        } catch (IOException e) {
            System.out.println("An error during opening Sala occurred.");
            e.printStackTrace();
        }
    }

    private static void Rodzaj_Biletu()
    {
        String filename = "Rodzaj_Biletu.csv";
        String insertString = "";

        try {

            // Create file
            File myObj = new File(filename);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            FileWriter myWriter = new FileWriter(myObj);

            int id = 1;
            for (int r = 0; r < HandwrittenTypes.Rodzaje_biletów.length; r++) {


                if (r == 0 || r == 5 || r == 8 || r == 11 || r == 13 || r == 15 || r == 17 || r == 22 || r == 26 || r == 28) {
                    for (int i = 1; i <= 25; i++) {
                        insertString = id + "," + HandwrittenTypes.Rodzaje_biletów[r] + "," + i + "\n";
                        myWriter.write(insertString);
                        id++;
                    }
                } else { //TODO NULL? -test pending
                    insertString = id + "," + HandwrittenTypes.Rodzaje_biletów[r] + ",\n";
                    myWriter.write(insertString);
                    id++;
                }
            }

            myWriter.close();
            System.out.println("Successfully wrote to the file " + filename);

        } catch (IOException e) {
            System.out.println("An error during opening Sala occurred.");
            e.printStackTrace();
        }
    }

    private static void Bilet()
    {
        String filename = "Bilet.csv";

        try {
            // Create file
            File myObj = new File(filename);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            FileWriter myWriter = new FileWriter(myObj);

            ///
            int id = 1;
            String insertString = "";

            List<Integer> pozostałeOsoby = new ArrayList<Integer>();
            for (int i = 0; i < 1000; i++)
            {
                pozostałeOsoby.add(i);
            }

            for (int i = 0; i < ilośćBiletów; i++, id++)
            {
                int randOsobaID;
                int randImprezaID;
                do {
                    randOsobaID = GetRandom.Number(0, pozostałeOsoby.size());
                    randImprezaID = GetRandom.Number(1, ilośćImprez);
                } while (imprezowicze[randOsobaID] == randImprezaID);

                pozostałeOsoby.remove((Object)randOsobaID);

                Bilety.add(new Bilet(id, randOsobaID+1, randImprezaID));

                insertString = id + "," + (randOsobaID+1) + "," + randImprezaID + "\n";
                myWriter.write(insertString);
            }
            ///
            myWriter.close();

        } catch (IOException e) {
            System.out.println("An error during opening Sala occurred.");
            e.printStackTrace();
        }
    }

    private static void Bilet_Rodzaj_Biletu()
    {
        String filename = "Bilet_Rodzaj_Biletu.csv";

        try {
            // Create file
            File myObj = new File(filename);
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File " + myObj.getName() + " already exists.");
            }

            FileWriter myWriter = new FileWriter(myObj);

            ///
            int id = 1;
            String insertString = "";

            for (int i = 0; i < ilośćBiletów; i++)
            {
                int rbID = 0;

                Bilet blt = Bilety.get(i);
                Impreza imp = Imprezy.get(blt.id_impreza-1);

                if (imp == null)
                {
                    insertString = id + "," + id + ", " + "ERROR" + "ERROR" + "\n";
                    myWriter.write(insertString);
                    System.err.println("Error with Bilet ocured while writing Bilet_Rodzaj_Biletu");
                    return;
                }

                Place miejsce = knownPlaces.get(imp.id_adres);
                int[] pulaBiletów;

                switch (miejsce.placeType)
                {
                    case Kino, Teatr, Sala_koncertowa:

                        pulaBiletów = new int[25 + 2];
                        for (int x = 0; x < 25; x++)
                            pulaBiletów[x] = (x+1);
                        pulaBiletów[25] = 27;
                        pulaBiletów[26] = 28;

                        int randIndex = GetRandom.Number(0, pulaBiletów.length-1);
                        rbID = pulaBiletów[randIndex];
                        break;
                    case Przystanek_autobusowy:
                        rbID = GetRandom.Number(80, 208);
                        break;
                    case Port:
                        rbID = GetRandom.Number(54, 79);
                        break;
                    case Lotnisko:
                        rbID = GetRandom.Number(209, 234);
                        break;
                    case Stacja_kolejowa:
                        rbID = GetRandom.Number(235, 261);
                        break;
                    case Obiekt_turystyczny:
                        rbID = GetRandom.Number(182, 208);
                        break;
                }

                int ilość;
                if (Math.random() < 0.2)
                    ilość = GetRandom.Number(1, 5);
                else
                    ilość = 1;


                insertString = id + "," + id + "," + rbID + "," + ilość + "\n";
                myWriter.write(insertString);
                id++;
            }
            ///
            myWriter.close();

        } catch (IOException e) {
            System.out.println("An error during opening Sala occurred.");
            e.printStackTrace();
        }
    }
}
