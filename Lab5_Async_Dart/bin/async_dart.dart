/// Course: PC16 – Mobile Development with Lab
/// Activity: Lab 5 (Week 11) – Asynchronous Programming in Dart
/// Student: Jay-Roween B. Bumatay
/// Section: 3.4BSIT
/// Scenario: Real-time Transit Telemetry & API Dispatch Simulator

import '../../Lab4_Enhanced_OOP/bin/enhanced_oop.dart' show Bus;

Future<void> main() async {
  print('==================================================');
  print('      METRO TRANSIT ASYNCHRONOUS DISPATCH HUB     ');
  print('Operator: Jay-Roween B. Bumatay | Section: 3.4BSIT');
  print('==================================================\n');

  Bus cityBus = Bus('BUS-2026-99', 'Manila - Baguio', true);
  Bus shuttleBus = Bus('BUS-2026-12', 'Cubao - Makati', false);

  print('--- Step 1: Sequential Telemetry Fetch ---');
  try {
    String telemetry1 = await cityBus.fetchTelemetry();
    print(telemetry1);

    String telemetry2 = await shuttleBus.fetchTelemetry(delaySeconds: 3);
    print(telemetry2);
  } catch (e) {
    print('Error during telemetry fetch: $e');
  }

  print('\n--- Step 2: Concurrent Operations (Future.wait) ---');
  print('Fetching multiple unit statuses simultaneously...');

  Stopwatch stopwatch = Stopwatch()..start();
  try {
    List<String> concurrentResults = await Future.wait([
      Bus('BUS-101', 'Route 101', false).fetchTelemetry(),
      Bus('BUS-202', 'Route 202', false).fetchTelemetry(),
      Bus('BUS-303', 'Route 303', false).fetchTelemetry(),
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
  Bus backupBus = Bus('BUS-404', 'Route 404', false);
  try {
    String telemetry = await backupBus.fetchTelemetry();
    print(telemetry);
  } catch (e) {
    print('Caught error: $e');
  }

  Bus offlineBus = Bus('BUS-404-OFFLINE', 'Route 404', false);
  try {
    String failedTelemetry =
        await offlineBus.fetchTelemetry(simulateError: true);
    print(failedTelemetry);
  } catch (e) {
    print('Caught Expected Asynchronous Error: $e');
    print('Recovery Protocol: Assigned default fallback roster.');
  }

  print('\n==================================================');
  print('Asynchronous Dispatch Hub Operations Completed.');
  print('Operator Jay-Roween B. Bumatay (3.4BSIT) signed off.');
  print('==================================================');
}
