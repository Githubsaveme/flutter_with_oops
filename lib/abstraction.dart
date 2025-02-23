abstract class Payment {
  void pay(double amount);  // Abstract method (no implementation)
}

// Implementing different payment methods
class UpiPayment extends Payment {
  @override
  void pay(double amount) {
    print("Paid \$${amount} using UPI.");
  }
}

class CreditCardPayment extends Payment {
  @override
  void pay(double amount) {
    print("Paid \$${amount} using Credit Card.");
  }
}

class PayPalPayment extends Payment {
  @override
  void pay(double amount) {
    print("Paid \$${amount} using PayPal.");
  }
}

void main() {
  Payment payment = UpiPayment();
  payment.pay(500);

  payment = CreditCardPayment();
  payment.pay(1500);

  payment = PayPalPayment();
  payment.pay(1000);
}
