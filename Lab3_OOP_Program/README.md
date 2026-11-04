# Lab 3: Object-Oriented Programming (Classes, Constructors & Encapsulation)

**Course:** PC16 – Mobile Development with Lab  
**Student Name:** Jay-Roween B. Bumatay  
**Section:** 3.4BSIT

---

## Scenario Description
This console application simulates a **University Student Enrollment and Profile Management System** utilizing Dart object-oriented programming principles, including custom classes, standard and named constructors, private fields with getters/setters for encapsulation, and instance methods.

---

## Technical Implementation Highlights
- **Classes & Objects:** Defines a `Student` class with encapsulated attributes and behaviors.
- **Constructors:** Implements both a standard parameter constructor and a named constructor (`Student.freshman`).
- **Encapsulation:** Uses private fields (`_studentId`, `_fullName`, `_gpa`) protected by getters and validated setters.
- **Methods:** Includes business logic methods (`checkDeansList()`, `displayProfile()`).
- **Collections:** Stores `Student` instances in a `List<Student>` roster and a `Map<String, Student>` keyed by student ID, then iterates the list and looks up records from the map.

---

## How to Run the Program

1. Open your terminal in this directory (`Lab3_OOP_Program`).
2. Run the program using:

```bash
dart run bin/oop_program.dart
```
