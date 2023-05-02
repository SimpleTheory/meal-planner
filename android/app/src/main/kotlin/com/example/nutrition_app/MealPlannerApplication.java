package com.example.nutrition_app;

import android.content.Context;
import androidx.multidex.MultiDex;
import io.flutter.app.FlutterApplication;

public class MealPlannerApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();

        // Perform initialization tasks for your app here
        // For example, configure third-party libraries or set up the Flutter engine
    }

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);

        // Enable multidex support if needed
        MultiDex.install(this);
    }
}
