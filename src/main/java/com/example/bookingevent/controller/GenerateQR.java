package com.example.bookingevent.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class GenerateQR {

    @WebServlet("/GenerateQRServlet")
    public static class GenerateQRServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String apiUrl = "https://api.vietqr.io/v2/generate";
            String clientId = "e6049258-1661-4bab-8bce-97425fdcee07";
            String apiKey = "d537d39f-a760-4fcf-8056-88b178527063";

            // Request payload
            String payload = "curl --location --request POST '"+ apiUrl+"' " +
                    "--header 'x-client-id: "+ clientId+"' " +
                    "--header 'x-api-key: "+ apiKey+"' " +
                    "--header 'Content-Type: application/json' " +
                    "--data-raw '{" +
                    "    accountNo: 0311000746048," +
                    "    accountName: Local Xplorer," +
                    "    acqId: 970415," +
                    "    addInfo: Local Xplorer," +
                    "    amount: "+ clientId+"," +
                    "    template: compact" +
                    "}'";

            // Create HTTP connection
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("x-client-id", clientId);
            connection.setRequestProperty("x-api-key", apiKey);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Send request payload
            try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
                outputStream.write(payload.getBytes(StandardCharsets.UTF_8));
                outputStream.flush();
            }

            // Get response
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    String line;
                    StringBuilder apiResponse = new StringBuilder();
                    while ((line = reader.readLine()) != null) {
                        apiResponse.append(line);
                    }

                    // Process the response as needed
                    response.getWriter().write("API Response: " + apiResponse.toString());
                }
            } else {
                response.getWriter().write("API Request Failed with response code: " + responseCode);
            }

            // Close connection
            connection.disconnect();
        }
    }

}
