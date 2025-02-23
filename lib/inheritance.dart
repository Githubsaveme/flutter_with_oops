import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Parent class
class Vehicle {
  String brand;
  int speed;

  Vehicle(this.brand, this.speed);

  void move() {
    print("$brand is moving at speed $speed km/h");
  }
}

// Child class (Car)
class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, int speed, this.numberOfDoors) : super(brand, speed);

  void showCarInfo() {
    print("$brand car with $numberOfDoors doors, speed: $speed km/h");
  }
}

// Child class (Bike)
class Bike extends Vehicle {
  bool hasCarrier;

  Bike(String brand, int speed, this.hasCarrier) : super(brand, speed);

  void showBikeInfo() {
    print(
        "$brand bike ${hasCarrier ? "with" : "without"} carrier, speed: $speed km/h");
  }
}

class VehicleController extends GetxController {
  var selectedVehicle = "Car".obs;
  var speed = 100.obs;
  var numberOfDoors = 4.obs;
  var hasCarrier = false.obs;
}

void main() {
  runApp(VehicleApp());
}

class VehicleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: VehicleScreen(),
    );
  }
}

class VehicleScreen extends StatelessWidget {
  final VehicleController controller = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle Info")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => DropdownButton<String>(
                  value: controller.selectedVehicle.value,
                  items: ["Car", "Bike"].map((String vehicle) {
                    return DropdownMenuItem<String>(
                      value: vehicle,
                      child: Text(vehicle),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    controller.selectedVehicle.value = newValue!;
                  },
                )),
            SizedBox(height: 20),
            Obx(() => Text(
                  "Speed: ${controller.speed.value} km/h",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            if (controller.selectedVehicle.value == "Car")
              Obx(() => Text("Doors: ${controller.numberOfDoors.value}")),
            if (controller.selectedVehicle.value == "Bike")
              Obx(() => Text(
                  "Carrier: ${controller.hasCarrier.value ? "Yes" : "No"}")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.selectedVehicle.value == "Car") {
                  Car car = Car("Tesla", controller.speed.value,
                      controller.numberOfDoors.value);
                  car.move();
                  Get.snackbar("Car Info",
                      "${car.brand} with ${car.numberOfDoors} doors at ${car.speed} km/h");
                } else {
                  Bike bike = Bike("Yamaha", controller.speed.value,
                      controller.hasCarrier.value);
                  bike.move();
                  Get.snackbar("Bike Info",
                      "${bike.brand} ${bike.hasCarrier ? "with" : "without"} carrier at ${bike.speed} km/h");
                }
              },
              child: Text("Show Vehicle Info"),
            ),
          ],
        ),
      ),
    );
  }
}
