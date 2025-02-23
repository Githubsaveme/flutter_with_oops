# How OOP is Used in This Flutter UI
Encapsulation:

BankAccountController keeps _balance private and exposes it via an RxDouble observable.
Users can only modify balance via deposit() and withdraw(), preventing direct access.
Abstraction:

The UI (BankAccountScreen) doesn’t directly manipulate balance; it calls controller functions.
The controller abstracts the logic for depositing and withdrawing.
Inheritance:

BankAccountController extends GetxController, inheriting state management capabilities.
Polymorphism (Indirectly Applied):

The Get.snackbar() function dynamically shows different messages based on transaction type.
