package com.example.bookingevent.controller.Auto;

import com.example.bookingevent.Init.EmailReader;

public class MyScheduledTask implements Runnable{
    @Override
    public void run() {
        EmailReader.verifyBill();
    }
}
