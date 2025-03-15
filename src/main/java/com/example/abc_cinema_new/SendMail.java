package com.example.abc_cinema_new;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.MailerBuilder;

import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Properties;


public class SendMail  {
    public void send(String emailAddress) {




        LocalDateTime rightNow = LocalDateTime.now();

        final String sender = "chamali.r@hotmail.com";
        final String urpass = "Chama@23305";

        var username = "chamali.r@hotmail.com";
        var password = "Chama@23305";
        var host = "smtp-mail.outlook.com";
        var port = 587;

        Email email = EmailBuilder.startingBlank()
                .from("John Doe", "chamali.r@hotmail.com")
                .to("Jane Doe", emailAddress)
                .withSubject("Thank you for your order")
                .withHTMLText("" +
                        "<h1> Thank you for your order!  </h1>" +"Seat No:"+
                        "<h3> </h3> " +rightNow+
                        "")
                .buildEmail();

        MailerBuilder
                .withSMTPServer(host, port, username, password)
                .buildMailer()
                .sendMail(email);

        System.out.println("Email sent successfully");
    }
    }
