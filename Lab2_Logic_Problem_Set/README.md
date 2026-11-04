# Lab 2: Logic Problem Set (Conditionals, Loops, Functions & Error Handling)

**Course:** PC16 – Mobile Development with Lab  
**Student Name:** Jay-Roween B. Bumatay  
**Section:** 3.4BSIT

---

## Scenario Description
This console application simulates a **Student Grade Batch Processing System** that iterates through grade records, evaluates standing using a reusable function with conditional branching, and incorporates error handling (`try/catch`) to process invalid scores gracefully without crashing.

---

## Technical Implementation Highlights
- **Conditional Logic:** Uses multi-way `if / else if / else` branching in `evaluateGrade()` to categorize scores.
- **Loops:** Uses a structured `for` loop to systematically iterate over student records.
- **Functions:** Implements `evaluateGrade(double score)`, which accepts a score parameter and returns a `String` rating.
- **Error Handling:** Encloses function execution in a `try/catch` block that intercepts bad input (`-15.0`) and logs a recovery message without crashing.

---

## How to Run the Program

1. Open your terminal in this directory (`Lab2_Logic_Problem_Set`).
2. Run the program using:

```bash
dart run bin/logic_problem_set.dart
```
