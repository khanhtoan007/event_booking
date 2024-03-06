package com.example.bookingevent.controller.Auto;


import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ScheduledTask implements ServletContextListener {
    private ScheduledExecutorService scheduler;
    @Override
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        long initialDelay = 0;
        long period = 30 * 1000; // 10 seconds in milliseconds
        scheduler.scheduleAtFixedRate(new MyScheduledTask(), initialDelay, period,TimeUnit.MILLISECONDS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
    }
}
