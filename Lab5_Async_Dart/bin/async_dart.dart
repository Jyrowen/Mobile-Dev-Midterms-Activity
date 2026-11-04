/// Course: PC16 – Mobile Development with Lab
/// Activity: Lab 5 (Week 11) – Asynchronous Programming in Dart
/// Student: Jay-Roween B. Bumatay
/// Section: 3.4BSIT
/// Scenario: Real-time Transit Telemetry & API Dispatch Simulator

class TelemetryService {
  String operatorName;
  String section;

  TelemetryService(this.operatorName, this.section);

  Future<String> fetchVehicleTelemetry(
      String plateNumber, int delaySeconds) async {
    print('Connecting to satellite grid for unit $plateNumber...');

    await Future.delayed(Duration(seconds: delaySeconds));

    return 'Telemetry Received: Unit $plateNumber is online and transmitting smoothly.';
  }

  Future<String> fetchDriverSchedule(
      String driverId, bool simulateError) async {
    print('Querying database for driver ID: $driverId...');

    await Future.delayed(const Duration(seconds: 2));

    if (simulateError) {
      throw Exception(
          'Database Timeout: Unable to retrieve schedule for driver $driverId.');
    }

    return 'Driver Schedule: Morning Shift (05:00 AM - 01:00 PM)';
  }
}

Future<void> main() async {
  print('==================================================');
  print('      METRO TRANSIT ASYNCHRONOUS DISPATCH HUB     ');
  print('Operator: Jay-Roween B. Bumatay | Section: 3.4BSIT');
  print('==================================================\n');

  TelemetryService hub = TelemetryService('Jay-Roween B. Bumatay', '3.4BSIT');

  print('--- Step 1: Sequential Telemetry Fetch ---');
  try {
    String telemetry1 = await hub.fetchVehicleTelemetry('JEEP-2026-01', 2);
    print(telemetry1);

    String telemetry2 = await hub.fetchVehicleTelemetry('BUS-2026-99', 3);
    print(telemetry2);
  } catch (e) {
    print('Error during telemetry fetch: $e');
  }

  print('\n--- Step 2: Concurrent Operations (Future.wait) ---');
  print('Fetching multiple unit statuses simultaneously...');

  Stopwatch stopwatch = Stopwatch()..start();
  try {
    List<String> concurrentResults = await Future.wait([
      hub.fetchVehicleTelemetry('TAXI-101', 2),
      hub.fetchVehicleTelemetry('VAN-202', 2),
      hub.fetchVehicleTelemetry('TRUCK-303', 2),
    ]);

    for (String result in concurrentResults) {
      print('  -> $result');
    }
  } catch (e) {
    print('Concurrent fetch error: $e');
  }
  stopwatch.stop();
  print('Concurrent batch completed in ${stopwatch.elapsedMilliseconds}ms.');

  print('\n--- Step 3: Handling Asynchronous Errors (try / catch) ---');
  try {
    String schedule = await hub.fetchDriverSchedule('DRV-999', false);
    print(schedule);
  } catch (e) {
    print('Caught error: $e');
  }

  try {
    String failedSchedule = await hub.fetchDriverSchedule('DRV-404', true);
    print(failedSchedule);
  } catch (e) {
    print('Caught Expected Asynchronous Error: $e');
    print('Recovery Protocol: Assigned default fallback roster.');
  }

  print('\n==================================================');
  print('Asynchronous Dispatch Hub Operations Completed.');
  print('Operator ${hub.operatorName} (${hub.section}) signed off.');
  print('==================================================');
}
