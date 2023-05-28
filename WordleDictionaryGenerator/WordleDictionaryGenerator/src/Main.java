import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) {
        try {
            File myObj = new File("english.txt");

            File threeLetters = new File("3-letters.txt");
            if (threeLetters.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }

            File fourLetters = new File("4-letters.txt");
            if (fourLetters.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }

            File fiveLetters = new File("5-letters.txt");
            if (fiveLetters.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }

            FileWriter threeWriter = new FileWriter("3-letters.txt");
            FileWriter fourWriter = new FileWriter("4-letters.txt");
            FileWriter fiveWriter = new FileWriter("5-letters.txt");


            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                Pattern pattern = Pattern.compile("[^a-zA-z]", Pattern.CASE_INSENSITIVE);
                Matcher matcher = pattern.matcher(data);

                if (!matcher.find()) {


                    switch (data.length()) {
                        case 3:
                            threeWriter.append(data);
                            threeWriter.append("\n");
                            break;
                        case 4:
                            fourWriter.append(data);
                            fourWriter.append("\n");

                            break;
                        case 5:
                            fiveWriter.append(data);
                            fiveWriter.append("\n");

                            break;
                        default:
                            continue;
                    }
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}