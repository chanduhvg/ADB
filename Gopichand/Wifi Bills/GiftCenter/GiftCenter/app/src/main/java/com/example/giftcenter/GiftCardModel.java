package com.example.giftcenter;



import android.content.Context;
import android.widget.Toast;

import java.util.ArrayList;

public class GiftCardModel {
    //creating instance variables for the gift card model
    int numOfReedemed;
    int numOfPurchased;
    double totalPurvalue;
    double tolReemedVal;
    public ArrayList<Giftcard> giftcard;

    //making non argument constructor
    private GiftCardModel()
    {

        giftcard = new ArrayList<Giftcard>();
    }
    //making a singleton
    private static GiftCardModel theModel = null;
    public static GiftCardModel getModel(){
        if (theModel == null){
            theModel = new GiftCardModel();
        }
        return theModel;
    }
    // giftcard class with two instance variables
    public static class Giftcard{
        public double amount;
        public boolean redeemed;
        //two argument constuctor for  giftcard
        public Giftcard(double amount, boolean redeemed) {
            this.amount = amount;
            this.redeemed = redeemed;
        }
    }


    //creating a method that will allow users will add a Gift Card to the list and Display a toast message with code (position in the list) of the card and the amount.
    public void purchaseCard(double amount, Context context){
        amount =Double.parseDouble(String.format("%.2f", amount));
        // adding a Gift Card to the list
        giftcard.add(new Giftcard(amount,false));
        //Display a toast message with code (position in the list) of the card and the amount
        String returnquest = giftcard.size()-1+ " , "+ amount;
        Toast.makeText(context,returnquest,Toast.LENGTH_SHORT).show();
        //Update the number purchased and total purchased.
        numOfReedemed = numOfReedemed +1;
        totalPurvalue=totalPurvalue +amount;
    }

    //will check to make sure that the code is a legal position and if it is set redeemed to true
    public Boolean redeemCard(int Code, Context context){
        if(giftcard.size()>Code) {
            if(giftcard.get(Code).redeemed){
                //card has already been redeemed
            }
            else{
                //card has not been redeemed
                giftcard.get(Code).redeemed =true;
                //updating counts
                numOfReedemed = numOfReedemed+1;
                tolReemedVal = tolReemedVal+giftcard.get(Code).amount;
                Toast.makeText(context,"Gift Card was successfully redeemed",Toast.LENGTH_SHORT).show();
                return true;
            }
        }
        Toast.makeText(context,"Gift Card could not be redeemed",Toast.LENGTH_SHORT).show();
        return false;
    }
}
