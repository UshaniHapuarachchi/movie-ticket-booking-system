import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class GMailer {
    public static void sendMail(String recipient) throws Exception {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String account = "abccinema21.1@gmail.com";
        String password = "abccinema!@#";

        //atxydyravtkvmodk
        // Create a session with the account and password
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(account, password);
            }
        });

        Message message = prepareMessage(session, account, recipient);
        Transport.send(message);
        System.out.println("Email sent successfully");
    }

    private static Message prepareMessage(Session session, String account, String recipient) {
        try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(account));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject("Test Email");
            message.setText("This is a test email sent using the JavaMail API.");
            return message;
        } catch (MessagingException e) {
            System.out.println("Error preparing message: " + e.getMessage());
            return null;
        }
    }
}
