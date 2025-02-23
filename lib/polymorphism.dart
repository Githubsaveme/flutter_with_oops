abstract class NotificationService {
  void send(String message);
}

// Email Notification
class EmailNotification extends NotificationService {
  @override
  void send(String message) {
    print("Sending Email: $message");
  }
}

// SMS Notification
class SMSNotification extends NotificationService {
  @override
  void send(String message) {
    print("Sending SMS: $message");
  }
}

void main() {
  NotificationService email = EmailNotification();
  email.send("Your OTP is 1234");

  NotificationService sms = SMSNotification();
  sms.send("Your package has been shipped!");
}
