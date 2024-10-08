package utils;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.Timer;
import java.util.TimerTask;

public class expirationTimer {
    
    //Start a timer, when the timer end, delete user OTP in database
    public void timerOTP(int sec, HttpServletRequest request, String name) {
        //Convert minutes to miliseconds
        long milliseconds = sec * 1000;
        
        Timer timer = new Timer();
        HttpSession sessionRE = request.getSession();
//        String sessionName = (String) sessionRE.getAttribute(name);

        // Schedule the task to run after given minutes
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                // Delete OTP from user database when timer expire
                System.out.println("Timer expired.");
                sessionRE.removeAttribute(name);
                // Stop the timer
                timer.cancel();
            }
        }, milliseconds); //In milliseconds
    }
}
