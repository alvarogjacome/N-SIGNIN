package com.example.n_signin;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.core.content.ContextCompat;

public class StepLabel extends androidx.appcompat.widget.AppCompatTextView {

    private String pageNumber;
    private Context thisContext;

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR1)
    public StepLabel(@NonNull Context context) {
        super(context);
        thisContext = context;
        setPageNumber();
    }

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR1)
    public StepLabel(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        thisContext = context;

        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.StepLabel);
        int count = typedArray.getIndexCount();

        try {
            for (int i = 0; i < count; ++i) {
                int attr = typedArray.getIndex(i);
                if (attr == R.styleable.StepLabel_pageNumber) {
                    this.pageNumber = typedArray.getString(attr);
                    setPageNumber();
                }
            }
        } finally {
            typedArray.recycle();
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR1)
    public StepLabel(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setPageNumber();
    }

    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR1)
    @SuppressLint({"UseCompatLoadingForDrawables", "ResourceAsColor"})
    private void setPageNumber() {
        if (this.pageNumber != null) {
            setText(this.pageNumber);
            setBackground(ContextCompat.getDrawable(thisContext, R.drawable.incomplete_step));
            setTextColor(this.getResources().getColor(R.color.Kettleman));
            setTextAlignment(TEXT_ALIGNMENT_CENTER);
            setTextSize(20);
        }
    }

    public void setToComplete() {
        setBackground(ContextCompat.getDrawable(thisContext, R.drawable.complete_step));
    }

    public void setToIncomplete() {
        setBackground(ContextCompat.getDrawable(thisContext, R.drawable.incomplete_step));
    }
}