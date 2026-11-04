# Lab 4: Enhanced Object-Oriented Programming (Inheritance, Polymorphism, Abstract Classes & Mixins)

**Course:** PC16 – Mobile Development with Lab  
**Student Name:** Jay-Roween B. Bumatay  
**Section:** 3.4BSIT

---

## Scenario Description
This console application simulates an **Advanced Public Transit Fleet Management System** showcasing core advanced OOP pillars in Dart: an abstract base class (`Vehicle`), specialized subclasses (`Jeepney`, `Bus`) implementing polymorphism, and a reusable `GPSLocatable` mixin.

---

## Technical Implementation Highlights
- **Abstract Classes:** Defines `Vehicle` as a template blueprint containing shared attributes.
- **Interface Contract:** Defines `FareCalculator` as an abstract contract and applies it with `implements` on `Jeepney` and `Bus`.
- **Inheritance & Polymorphism:** Extends `Vehicle` into subclasses that `@override` `calculateFare()` with distinct fare rules.
- **Mixins:** Applies `GPSLocatable` via `with` on vehicle subclasses and on `TransitDepot`, which sits outside the `Vehicle` inheritance tree.

---

## How to Run the Program

1. Open your terminal in this directory (`Lab4_Enhanced_OOP`).
2. Run the program using:

```bash
dart run bin/enhanced_oop.dart
```
