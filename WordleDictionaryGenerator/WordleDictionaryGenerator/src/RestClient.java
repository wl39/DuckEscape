import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class RestClient {

    public static void main(String[] args) throws IOException, InterruptedException {

        File threeLetters = new File("5-letters.txt");
        Scanner myReader = new Scanner(threeLetters);

        File threeLettersFiltered = new File("5-letters-in-dictionary.txt");
        if (threeLettersFiltered.createNewFile()) {
            System.out.println("File created: " + threeLettersFiltered.getName());
        } else {
            System.out.println("File already exists.");
        }

        FileWriter threeWriter = new FileWriter("5-letters-in-dictionary.txt");

        while (myReader.hasNextLine()) {
            String data = myReader.nextLine();
            // Step 1: Create an HTTP client
            HttpURLConnection httpClient = (HttpURLConnection) new URL("https://api.dictionaryapi.dev/api/v2/entries/en/" + data).openConnection();

            // Step 2: Set the HTTP method (GET)
            httpClient.setRequestMethod("GET");

            // Step 3: Send the request
            int responseCode = httpClient.getResponseCode();

            if (responseCode == 429) {
                // Get the recommended wait time from the Retry-After header
                int waitTime = httpClient.getHeaderFieldInt("Retry-After", 5);

                System.out.println("Rate limit exceeded, waiting for " + waitTime + " seconds...");

                // Wait for the recommended amount of time
                Thread.sleep(waitTime * 1000);

                httpClient = (HttpURLConnection) new URL("https://api.dictionaryapi.dev/api/v2/entries/en/" + data).openConnection();

                // Step 2: Set the HTTP method (GET)
                httpClient.setRequestMethod("GET");

                // Step 3: Send the request
                responseCode = httpClient.getResponseCode();
            }

            // Step 4: Process the response
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(httpClient.getInputStream()));
                String line;
                StringBuffer response = new StringBuffer();

                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                in.close();




                threeWriter.append(data);
                threeWriter.append("\n");
            } else {
                System.out.println(data);
            }

            Thread.sleep(50);
        }
        threeWriter.close();
    }
}