import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankAccountController extends GetxController {
  RxDouble balance = 5000.0.obs;

  void deposit(double amount) {
    balance.value += amount;
    Get.snackbar("Deposit Successful", "You added \$$amount", snackPosition: SnackPosition.BOTTOM);
  }

  void withdraw(double amount) {
    if (amount > balance.value) {
      Get.snackbar("Insufficient Funds", "Not enough balance!", snackPosition: SnackPosition.BOTTOM);
    } else {
      balance.value -= amount;
      Get.snackbar("Withdrawal Successful", "You withdrew \$$amount", snackPosition: SnackPosition.BOTTOM);
    }
  }
}

void main() {
  runApp(BankApp());
}

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BankAccountScreen(),
    );
  }
}

class BankAccountScreen extends StatelessWidget {
  final BankAccountController controller = Get.put(BankAccountController());
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bank Account")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "Balance: \$${controller.balance.value.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Amount",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double amount = double.tryParse(amountController.text) ?? 0;
                    controller.deposit(amount);
                    amountController.clear();
                  },
                  child: Text("Deposit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    double amount = double.tryParse(amountController.text) ?? 0;
                    controller.withdraw(amount);
                    amountController.clear();
                  },
                  child: Text("Withdraw"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
