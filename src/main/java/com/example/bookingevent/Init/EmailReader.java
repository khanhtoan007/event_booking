package com.example.bookingevent.Init;

import java.io.IOException;
import java.util.Arrays;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.search.FlagTerm;

public class EmailReader {
        public static void main(String[] args) {
        String host = "imap.gmail.com";
        String username = Config.email_address;
        String password = Config.email_password;
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.imap.ssl.enable", "true");
            Session emailSession = Session.getDefaultInstance(properties);
            Store store = emailSession.getStore("imap");
            store.connect(host, username, password);
            Folder emailFolder = store.getFolder("INBOX");
            emailFolder.open(Folder.READ_ONLY);
            Message[] messages = emailFolder.getMessages();
            System.out.println("messages.length---" + messages.length);
            for (int i = messages.length - 1; i >= 0; i--) {
                Message message = messages[i];
                Object body = message.getContent();
                System.out.println("---------------------------------");
                System.out.println("Email Number " + (i + 1));
                System.out.println("Subject: " + message.getSubject());
                System.out.println("From: " + message.getFrom()[0]);
                System.out.println("Text: " + body );

                if (message.isMimeType("multipart/*")) {
                    MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
                    System.out.println("TEXT: " + getTextFromMimeMultipart(mimeMultipart));
                }
            }
            emailFolder.close(false);
            store.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String getTextFromMimeMultipart(
            MimeMultipart mimeMultipart)  throws MessagingException, IOException {
        String result = "";
        for (int i = 0; i < mimeMultipart.getCount(); i++) {
            BodyPart bodyPart = mimeMultipart.getBodyPart(i);
            if (bodyPart.isMimeType("text/plain")) {
                return result + "\n" + bodyPart.getContent(); // without return, same text appears twice in my tests
            }
            result += EmailReader.parseBodyPart(bodyPart);
        }
        return result;
    }

    private static String parseBodyPart(BodyPart bodyPart) throws MessagingException, IOException {
        if (bodyPart.isMimeType("text/html")) {
            return "\n" + org.jsoup.Jsoup
                    .parse(bodyPart.getContent().toString())
                    .text();
        }
        if (bodyPart.getContent() instanceof MimeMultipart) {
            return getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent());
        }

        return "";
    }
}
