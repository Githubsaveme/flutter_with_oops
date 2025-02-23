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

# Flutter’s entire widget system is built on OOP principles!

Encapsulation → Private variables in StatefulWidget.
Inheritance → Extending StatelessWidget or StatefulWidget.
Polymorphism → Overriding build() method.
Abstraction → Abstract classes like ChangeNotifier in Provider.