package com.example.bookingevent.Init;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import com.example.bookingevent.controller.MyWebSocket;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.search.FlagTerm;
import jakarta.mail.search.FromTerm;
import jakarta.mail.search.AndTerm;

public class EmailReader {
        public static void main(String[] args) {
            /*String host = "imap.gmail.com";
            String username = Config.email_address;
            String password = Config.email_password;
            String specificSender = "support@timo.vn";
            try {
                Properties properties = new Properties();
                properties.setProperty("mail.imap.ssl.enable", "true");
                Session emailSession = Session.getDefaultInstance(properties);
                Store store = emailSession.getStore("imap");
                store.connect(host, username, password);
                Folder emailFolder = store.getFolder("INBOX");
                emailFolder.open(Folder.READ_WRITE);
                FromTerm senderTerm = new FromTerm(new InternetAddress(specificSender));
                FlagTerm unreadFlagTerm = new FlagTerm(new Flags(Flags.Flag.SEEN), false);
                AndTerm combinedTerm = new AndTerm(senderTerm, unreadFlagTerm);

                Message[] messages = emailFolder.search(combinedTerm);
                System.out.println("messages.length---" + messages.length);
                for (int i = messages.length - 1; i >= 0; i--) {
                    Message message = messages[i];
                    messages[i].setFlag(Flags.Flag.SEEN, true);
                    if (message.isMimeType("multipart/*") && message.getSubject().equals("Thông báo thay đổi số dư tài khoản")) {
                        MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
                        String text_body = getTextFromMimeMultipart(mimeMultipart);
                        String[] arr = text_body.split("\\.");
                        String transfer_content = arr[7];
                        System.out.println(transfer_content);
                    }
                }
                emailFolder.close(false);
                store.close();
            } catch (Exception e) {
                e.printStackTrace();
            }*/
            long startTime = System.currentTimeMillis();
            System.out.println(verifyBill());
            long endTime = System.currentTimeMillis();
            long elapsedTime = endTime - startTime;
            System.out.println("Time taken: " + elapsedTime + " milliseconds");
        }

    public static boolean verifyBill(){
        String host = "imap.gmail.com";
        String username = Config.email_address;
        String password = Config.email_password;
        String specificSender = "support@timo.vn";
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.imap.ssl.enable", "true");
            Session emailSession = Session.getDefaultInstance(properties);
            Store store = emailSession.getStore("imap");
            store.connect(host, username, password);
            Folder emailFolder = store.getFolder("INBOX");
            emailFolder.open(Folder.READ_WRITE);
            FromTerm senderTerm = new FromTerm(new InternetAddress(specificSender));
            FlagTerm unreadFlagTerm = new FlagTerm(new Flags(Flags.Flag.SEEN), false);
            AndTerm combinedTerm = new AndTerm(senderTerm, unreadFlagTerm);
            Message[] messages = emailFolder.search(combinedTerm);
            ArrayList<String> transfer_contents = new ArrayList<>();
            ArrayList<Integer> set_read = new ArrayList<>();
            for (int i = messages.length - 1; i >= 0; i--) {
                Message message = messages[i];
                if (message.isMimeType("multipart/*") && message.getSubject().equals("Thông báo thay đổi số dư tài khoản")) {
                    MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
                    String text_body = getTextFromMimeMultipart(mimeMultipart);
                    String[] arr = text_body.split("\\.");
                    if (arr.length > 7){
                        String transfer_content = arr[7];
                        transfer_contents.add(transfer_content);
                        set_read.add(i);
                    }
                }
            }
            String sql = "";
            String[] vars = new String[transfer_contents.size()];
            String in_query = "(";
            for (int i = 0; i < transfer_contents.size(); i++) {
                sql += "update bills set status = 'true' where transfer_content = ?;";
                vars[i] = transfer_contents.get(i);
                in_query += "'" + transfer_contents.get(i) + "'" + ",";
            }
            in_query += ")";
            in_query = replaceLast(in_query, ",", "");
            boolean check = DB.executeUpdate(sql, vars);
            if (check){
                for (int i = 0; i < set_read.size(); i++){
                    messages[set_read.get(i)].setFlag(Flags.Flag.SEEN, true);
                    MyWebSocket.broadcastToChannel(transfer_contents.get(i), String.valueOf(true));
                }
                ArrayList<MyObject> carts = DB.getData("select * from carts inner join bills on carts.bill_id = bills.id where bills.transfer_content in " + in_query, new String[]{"id"});
                sql = "";
                vars = new String[carts.size()];
                for (int i = 0; i < carts.size(); i++) {
                    sql += "update carts set price = (select e.price from events e where e.id = carts.event_id) where carts.id = ?;";
                    vars[i] = carts.get(i).id;
                }
                DB.executeUpdate(sql, vars);
                emailFolder.close(false);
                store.close();
                return true;
            }
            emailFolder.close(false);
            store.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static String replaceLast(String original, String search, String replacement) {
        int lastIndex = original.lastIndexOf(search);

        if (lastIndex == -1) {
            // If the search string is not found, return the original string
            return original;
        }

        // Construct the modified string
        String prefix = original.substring(0, lastIndex);
        String suffix = original.substring(lastIndex + search.length());

        return prefix + replacement + suffix;
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
