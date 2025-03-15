package com.example.abc_cinema_new;

import com.example.abc_cinema_new.OrderDetail;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import java.util.ArrayList;
import java.util.List;


public class paymentService {
    private static final String CLIENT_ID = "Abon07rhchUZVbYQ07aAs2jO-Fq7IBvy8W8Jm-ZfBg9e4O6X8UHu70n0mGNh3ElBn3kMnJObC2czg2gU";
    private static final String CLIENT_SECRET = "EAK3tiBJfjHHKd0Qs_KMbLT3arQrT7H5xyGlI17jQisC_U_QSXBdapI55KO2Js6RnsnKa4PzBc82WSlj";
    private static final String MODE = "sandbox";

    public String authorizePayment(OrderDetail orderDetail) throws PayPalRESTException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction)
                .setRedirectUrls(redirectUrls)
                .setPayer(payer)
                .setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
        Payment approvedPayment = requestPayment.create(apiContext);

        System.out.println(approvedPayment);

        return getApprovedLink(approvedPayment);
    }
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    private String getApprovedLink(Payment approvedPayment){
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links){
            if(link.getRel().equalsIgnoreCase("approval_url")){
                approvalLink = link.getHref();
                break;
            }
        }
        return approvalLink;
    }


    private List<Transaction> getTransactionInformation(OrderDetail orderDetail){
        Details details = new Details();
        details.setShipping(orderDetail.getId());

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.valueOf(orderDetail.getTotal()));
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getDetail());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        Item item = new Item();
        item.setName("Seats").setQuantity("1").setCurrency("USD").setPrice(String.valueOf(orderDetail.getTotal()));
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);
        return transactions;
    }

    private RedirectUrls getRedirectURLs(){
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/cinema_new-master/done.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/cinema_new-master/done.jsp");

        return redirectUrls;
    }

    private Payer getPayerInformation(){
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Test")
                .setLastName("last")
                .setEmail("supun2001hasanka@gmail.com");
        payer.setPayerInfo(payerInfo);

        return payer;
    }

}
