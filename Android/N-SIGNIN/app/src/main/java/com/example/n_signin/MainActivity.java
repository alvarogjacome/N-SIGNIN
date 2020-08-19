package com.example.n_signin;

import android.content.Intent;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    @Override
    protected void onStart() {
        super.onStart();

        ImageView image = findViewById(R.id.imageView2);

        RotateAnimation rotate = new RotateAnimation(
                0, 1080,
                Animation.RELATIVE_TO_SELF, 0.5f,
                Animation.RELATIVE_TO_SELF, 0.5f
        );
        rotate.setDuration(3000);

        rotate.setAnimationListener(new Animation.AnimationListener() {
            @Override
            public void onAnimationStart(Animation animation) {

            }

            @Override
            public void onAnimationEnd(Animation animation) {
                try {
                    Intent k = new Intent(getBaseContext(), SignUpProcess.class);
                    startActivity(k);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onAnimationRepeat(Animation animation) {

            }
        });

        image.startAnimation(rotate);


    }

}