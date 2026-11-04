# Lab 5: Asynchronous Programming in Dart (Futures, async/await & Error Handling)

**Course:** PC16 – Mobile Development with Lab  
**Student Name:** Jay-Roween B. Bumatay  
**Section:** 3.4BSIT

---

## Scenario Description
This console application simulates a **Real-time Transit Telemetry & API Dispatch System** in Dart. It demonstrates non-blocking asynchronous programming paradigms using `Future`, `async`, `await`, concurrent execution via `Future.wait`, and graceful asynchronous error handling with `try/catch`.

---

## Technical Implementation Highlights
- **OOP Async Method:** Extends the Week 10 `Bus` class with `fetchTelemetry()`, which returns a typed `Future<String>`.
- **Futures & Async/Await:** `Bus.fetchTelemetry()` simulates network latency using `Future.delayed` and is consumed with `await`.
- **Non-Blocking Proof:** A status message is printed immediately before `await Future.delayed(...)`.
- **Concurrent Execution:** Uses `Future.wait()` to batch multiple network requests concurrently, optimizing total execution time.
- **Asynchronous Error Handling:** Catches and recovers from a simulated telemetry failure without crashing the event loop.

---

## How to Run the Program

1. Open your terminal in this directory (`Lab5_Async_Dart`).
2. Run the program using:

```bash
dart run bin/async_dart.dart
```
