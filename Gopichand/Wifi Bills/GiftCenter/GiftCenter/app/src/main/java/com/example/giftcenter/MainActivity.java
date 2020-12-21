package com.example.giftcenter;


import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements PurchaseCallBack, RedeemCallBack{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        if (savedInstanceState ==null) {
            PurchaseCardFragment purcaft = PurchaseCardFragment.newInstance();
            RedeemFragment redeemf = RedeemFragment.newInstance();
            FragmentManager fragman = getSupportFragmentManager();
            FragmentTransaction trans = fragman.beginTransaction();
            trans.add(R.id.myFramelayout, purcaft, "purchase");
            trans.add(R.id.myFramelayout, redeemf, "redeem");
            trans.hide(redeemf);
            trans.commit();
        }
        gcm= GiftCardModel.getModel();
    }
    //creating swap to purchase method change the two fragments so the PurchaseFragment is shown.
    public void swapToPurchase() {
        FragmentManager fragman = getSupportFragmentManager();
        PurchaseCardFragment purcaft =(PurchaseCardFragment)fragman.findFragmentByTag("purchase");
        RedeemFragment redeemf = (RedeemFragment)fragman.findFragmentByTag("redeem");
        FragmentTransaction trans = fragman.beginTransaction();
        trans.hide(redeemf);
        trans.show(purcaft);
        trans.commit();
    }
    // creating swap to redeem method
    public void swapToRedeem() {
        FragmentManager fragman = getSupportFragmentManager();
        PurchaseCardFragment purcaft =(PurchaseCardFragment)fragman.findFragmentByTag("purchase");
        RedeemFragment redeemf = (RedeemFragment)fragman.findFragmentByTag("redeem");
        FragmentTransaction trans = fragman.beginTransaction();
        trans.hide(purcaft);
        trans.show(redeemf);
        trans.commit();
    }
    private GiftCardModel gcm;
    //update method Will get the values from the model and set the text in the main activities text views.
    public void update(){
        TextView redeemText = findViewById(R.id.ReedemNum);
        redeemText.setText(gcm.numOfReedemed +" cards redeemed worth "+gcm.tolReemedVal);
        TextView purchaseText = findViewById(R.id.puchaseNum);
        purchaseText.setText(gcm.totalPurvalue+" cards purchased worth "+gcm.totalPurvalue);
    }
}