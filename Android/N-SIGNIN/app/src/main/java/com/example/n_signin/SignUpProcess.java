package com.example.n_signin;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

public class SignUpProcess extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up_process);
        final String[] titles = {"Personal data", "Personal data: gender & age", "Log in Information", "Check your information"};
        final TextView title = findViewById(R.id.tv_title);
        title.setText(titles[0]);

        final ViewPager viewPager = findViewById(R.id.viewPager);

        final SignUpProcessPageAdapter pagerAdapter = new SignUpProcessPageAdapter(getSupportFragmentManager());
        pagerAdapter.addFragmet(new PersonalInformationFragment());
        pagerAdapter.addFragmet(new PersonalInformationGenderBirthFragment());
        pagerAdapter.addFragmet(new LogInInformationFragment());

        viewPager.setAdapter(pagerAdapter);

        final Button nextPageButton = findViewById(R.id.button2);
        final Button previousPageButton = findViewById(R.id.button);


        nextPageButton.setOnClickListener(new View.OnClickListener() {
                                              @Override
                                              public void onClick(View view) {
                                                  viewPager.setCurrentItem(viewPager.getCurrentItem() + 1);
                                                  previousPageButton.setVisibility(View.VISIBLE);
                                                  title.setText(titles[viewPager.getCurrentItem()]);
                                                  if (viewPager.getCurrentItem() == pagerAdapter.getCount() - 1) {
                                                      nextPageButton.setVisibility(View.INVISIBLE);
                                                  }
                                              }
                                          }
        );

        previousPageButton.setOnClickListener(new View.OnClickListener() {
                                                  @Override
                                                  public void onClick(View view) {
                                                      viewPager.setCurrentItem(viewPager.getCurrentItem() - 1);
                                                      nextPageButton.setVisibility(View.VISIBLE);
                                                      title.setText(titles[viewPager.getCurrentItem()]);
                                                      if (viewPager.getCurrentItem() == 0) {
                                                          previousPageButton.setVisibility(View.INVISIBLE);
                                                      }
                                                  }
                                              }
        );
    }
}
