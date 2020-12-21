package com.example.giftcenter;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link PurchaseCardFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class PurchaseCardFragment extends Fragment {

    //making instance of interface
    private MainActivity myActvity=null;
    private GiftCardModel giftcam=null;
    public PurchaseCardFragment() {
        // Required empty public constructor
    }

    // TODO: Rename and change types and number of parameters
    public static PurchaseCardFragment newInstance() {
        PurchaseCardFragment fragment = new PurchaseCardFragment();
        Bundle args = new Bundle();

        fragment.setArguments(args);
        return fragment;
    }
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);
        myActvity = (MainActivity)context;
        giftcam= GiftCardModel.getModel();

    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {

        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        final View v =inflater.inflate(R.layout.fragment_purchase, container, false);
        Button swapBTN = v.findViewById(R.id.ToRedeem);
        swapBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                myActvity.swapToRedeem();
            }
        });
        Button purchaseBTN = v.findViewById(R.id.purchaseBTN);
        purchaseBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    EditText amountTV = v.findViewById(R.id.amountToPurchase);
                    double amount = Double.parseDouble(amountTV.getText().toString());
                    giftcam.purchaseCard(amount, getContext());
                    myActvity.update();
                }
                catch(Exception e){
                    EditText amountTV = v.findViewById(R.id.amountToPurchase);
                    amountTV.setText("An error has occured");
                }

            }
        });
        return v;

    }

}
