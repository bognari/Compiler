package minijava;

import java.io.FileReader;

/**
 * Created by stephan on 22.06.15.
 */
public class Test {
    public static void main(String[] args) {
        String inputFileName;
        if(args.length != 1) {
            System.out.println("EX2: missing file command line argument");
            //System.exit(1);
            inputFileName = "tests/MainTest.java";
        }
        else {
            System.out.println("EX2: starting on file " + args[0]);
            System.out.flush();
            inputFileName = args[0];
        }
        try {
            MJScanner lexer  = new MJScanner(new FileReader(inputFileName));
            MJParser parser = new MJParser();

            parser.parse(lexer);

            //double result = (double) parser.parse(lexer);
            //System.out.println("Ausgabe");
            //System.out.println(String.format("%.2f", result).replace(',', '.'));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
