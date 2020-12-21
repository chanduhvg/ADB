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
 * Use the {@link RedeemFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class RedeemFragment extends Fragment {

    //creaing instance of interface
    private MainActivity m1Actvity = null;
    private GiftCardModel giftcam = null;

    public RedeemFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     * @return A new instance of fragment RedeemFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static RedeemFragment newInstance() {
        RedeemFragment fragment = new RedeemFragment();
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);
        m1Actvity = (MainActivity)context;


    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
        }
        giftcam= GiftCardModel.getModel();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        final View v =inflater.inflate(R.layout.fragment_redeem, container, false);
        Button swapBTN = v.findViewById(R.id.ToPurchase);
        swapBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                m1Actvity.swapToPurchase();
            }
        });

        Button redeemBTN = v.findViewById(R.id.redeemBTN);
        redeemBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    EditText redeemTV = v.findViewById(R.id.redeem);
                    int cardCode = Integer.parseInt(redeemTV.getText().toString());
                    giftcam.redeemCard(cardCode, getContext());
                    m1Actvity.update();
                }
                catch(Exception e){
                    EditText redeemTV = v.findViewById(R.id.redeem);
                    redeemTV.setText("An Error has occured");
                }

            }
        });
        return v;
    }
}
