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
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class GenerateQR {

    @WebServlet("/GenerateQRServlet")
    public static class GenerateQRServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Handle GET requests if needed
            response.getWriter().write("GET method is not supported. Please use POST.");
        }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String apiUrl = "https://api.vietqr.io/v2/generate";
            String clientId = "e6049258-1661-4bab-8bce-97425fdcee07";
            String apiKey = "d537d39f-a760-4fcf-8056-88b178527063";
            int price = Integer.parseInt(request.getParameter("price"));

            // Request payload
            String payload = "{" +
                    "accountNo: 0311000746048," +
                    "accountName: Local Xplorer," +
                    "acqId: 970415," +
                    "addInfo: Local Xplorer," +
                    "amount: " + price + "," +
                    "template: compact" +
                    "}";

            // Create HTTP connection
            URI uri = null;
            try {
                uri = new URI(apiUrl);
            } catch (URISyntaxException e) {
                throw new RuntimeException(e);
            }
            URL url = uri.toURL();
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
                    request.setAttribute("apiResponse", apiResponse.toString());

                    // Process the response as needed
                    request.getRequestDispatcher("/views/test.jsp").forward(request,response);
                }
            } else {
                request.setAttribute("errorMessage", "API Request Failed with response code: " + responseCode);
                request.getRequestDispatcher("/views/test.jsp").forward(request,response);
            }

            // Close connection
            connection.disconnect();
        }
    }

}
