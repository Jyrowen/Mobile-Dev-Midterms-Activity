/// Course: PC16 – Mobile Development with Lab
/// Activity: Lab 4 (Week 10) – Enhanced Object-Oriented Programming
/// Student: Jay-Roween B. Bumatay
/// Section: 3.4BSIT
/// Scenario: Advanced Public Transit Fleet Management System

mixin GPSLocatable {
  double _latitude = 14.5995;
  double _longitude = 120.9842;

  void updateLocation(double lat, double lng) {
    _latitude = lat;
    _longitude = lng;
    print('GPS Update: Coordinates updated to [$_latitude, $_longitude]');
  }

  void broadcastLocation() {
    print(
        'Broadcasting live GPS signal from coordinates: [$_latitude, $_longitude]');
  }
}

abstract class FareCalculator {
  double calculateFare(double distanceKm);
}

abstract class Vehicle {
  String plateNumber;
  String route;

  Vehicle(this.plateNumber, this.route);

  void displayBaseInfo() {
    print('Plate Number : $plateNumber');
    print('Assigned Route: $route');
  }
}

class Jeepney extends Vehicle with GPSLocatable implements FareCalculator {
  int passengerCapacity;

  Jeepney(String plateNumber, String route, this.passengerCapacity)
      : super(plateNumber, route);

  @override
  double calculateFare(double distanceKm) {
    // PHP 13 covers the first 4 km; each additional kilometer costs PHP 2.50.
    const double baseFare = 13.00;
    if (distanceKm <= 4.0) {
      return baseFare;
    }
    return baseFare + ((distanceKm - 4.0) * 2.50);
  }

  void displayJeepneyDetails(double distanceKm) {
    print('--------------------------------------------------');
    print('[Jeepney Unit]');
    displayBaseInfo();
    print('Seating Cap  : $passengerCapacity passengers');
    print('Trip Distance: ${distanceKm.toStringAsFixed(1)} km');
    print('Computed Fare: PHP ${calculateFare(distanceKm).toStringAsFixed(2)}');
    broadcastLocation();
    print('--------------------------------------------------');
  }
}

class Bus extends Vehicle with GPSLocatable implements FareCalculator {
  bool isAirConditioned;

  Bus(String plateNumber, String route, this.isAirConditioned)
      : super(plateNumber, route);

  Future<String> fetchTelemetry({
    int delaySeconds = 2,
    bool simulateError = false,
  }) async {
    print('Connecting to satellite grid for unit $plateNumber...');
    await Future.delayed(Duration(seconds: delaySeconds));

    if (simulateError) {
      throw Exception('Telemetry request failed for unit $plateNumber.');
    }

    return 'Telemetry Received: Unit $plateNumber is online and transmitting smoothly.';
  }

  @override
  double calculateFare(double distanceKm) {
    const double baseFare = 15.00;
    double total = baseFare + (distanceKm * 3.50);
    return isAirConditioned ? total * 1.10 : total;
  }

  void displayBusDetails(double distanceKm) {
    print('--------------------------------------------------');
    print('[City Bus Unit]');
    displayBaseInfo();
    print(
        'Air-Con Unit : ${isAirConditioned ? "Yes (Deluxe)" : "No (Regular)"}');
    print('Trip Distance: ${distanceKm.toStringAsFixed(1)} km');
    print('Computed Fare: PHP ${calculateFare(distanceKm).toStringAsFixed(2)}');
    broadcastLocation();
    print('--------------------------------------------------');
  }
}

class TransitDepot with GPSLocatable {
  String name;
  String dispatcher;

  TransitDepot(this.name, this.dispatcher);
}

void main() {
  print('==================================================');
  print('     ENHANCED TRANSIT FLEET DISPATCH SYSTEM       ');
  print('Student: Jay-Roween B. Bumatay | Section: 3.4BSIT');
  print('==================================================');

  Jeepney modernJeep = Jeepney('JEEP-2026-01', 'Quiapo - Cubao', 22);
  Bus provincialBus = Bus('BUS-2026-99', 'Manila - Baguio', true);
  TransitDepot cubaoDepot =
      TransitDepot('Cubao Terminal', 'Jay-Roween B. Bumatay');

  FareCalculator jeepFare = modernJeep;
  FareCalculator busFare = provincialBus;

  modernJeep.updateLocation(14.6010, 121.0508);
  modernJeep.displayJeepneyDetails(6.5);
  print(
      'Interface fare check (Jeepney): PHP ${jeepFare.calculateFare(6.5).toStringAsFixed(2)}');

  provincialBus.updateLocation(15.4802, 120.5979);
  provincialBus.displayBusDetails(45.0);
  print(
      'Interface fare check (Bus): PHP ${busFare.calculateFare(45.0).toStringAsFixed(2)}');

  print('--------------------------------------------------');
  print(
      '[Transit Depot] ${cubaoDepot.name} | Dispatcher: ${cubaoDepot.dispatcher}');
  cubaoDepot.updateLocation(14.6176, 121.0569);
  cubaoDepot.broadcastLocation();
  print('--------------------------------------------------');

  print('==================================================');
  print('Enhanced OOP Dispatch Completed Successfully.');
  print('==================================================');
}
