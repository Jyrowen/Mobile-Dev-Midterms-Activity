[1mdiff --git a/Lab2_Logic_Problem_Set/README.md b/Lab2_Logic_Problem_Set/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..6c64e53[m
[1m--- /dev/null[m
[1m+++ b/Lab2_Logic_Problem_Set/README.md[m
[36m@@ -0,0 +1,29 @@[m
[32m+[m[32m# Lab 2: Logic Problem Set (Conditionals, Loops, Functions & Error Handling)[m
[32m+[m
[32m+[m[32m**Course:** PC16 – Mobile Development with Lab[m[41m  [m
[32m+[m[32m**Student Name:** Jay-Roween B. Bumatay[m[41m  [m
[32m+[m[32m**Section:** 3.4BSIT[m
[32m+[m
[32m+[m[32m---[m
[32m+[m
[32m+[m[32m## Scenario Description[m
[32m+[m[32mThis console application simulates a **Student Grade Batch Processing System** that iterates through grade records, evaluates standing using a reusable function with conditional branching, and incorporates error handling (`try/catch`) to process invalid scores gracefully without crashing.[m
[32m+[m
[32m+[m[32m---[m
[32m+[m
[32m+[m[32m## Technical Implementation Highlights[m
[32m+[m[32m- **Conditional Logic:** Uses multi-way `if / else if / else` branching in `evaluateGrade()` to categorize scores.[m
[32m+[m[32m- **Loops:** Uses a structured `for` loop to systematically iterate over student records.[m
[32m+[m[32m- **Functions:** Implements `evaluateGrade(double score)`, which accepts a score parameter and returns a `String` rating.[m
[32m+[m[32m- **Error Handling:** Encloses function execution in a `try/catch` block that intercepts bad input (`-15.0`) and logs a recovery message without crashing.[m
[32m+[m
[32m+[m[32m---[m
[32m+[m
[32m+[m[32m## How to Run the Program[m
[32m+[m
[32m+[m[32m1. Open your terminal in this directory (`Lab2_Logic_Problem_Set`).[m
[32m+[m[32m2. Run the program using:[m
[32m+[m
[32m+[m[32m```bash[m
[32m+[m[32mdart run bin/logic_problem_set.dart[m
[32m+[m[32m```[m
[1mdiff --git a/Lab2_Logic_Problem_Set/bin/logic_problem_set.dart b/Lab2_Logic_Problem_Set/bin/logic_problem_set.dart[m
[1mnew file mode 100644[m
[1mindex 0000000..a8dc077[m
[1m--- /dev/null[m
[1m+++ b/Lab2_Logic_Problem_Set/bin/logic_problem_set.dart[m
[36m@@ -0,0 +1,54 @@[m
[32m+[m[32m/// Course: PC16 – Mobile Development with Lab[m
[32m+[m[32m/// Activity: Lab 2 (Week 8) – Logic Problem Set[m
[32m+[m[32m/// Student: Jay-Roween B. Bumatay[m
[32m+[m[32m/// Section: 3.4BSIT[m
[32m+[m[32m/// Scenario: Student Grade Evaluation and Batch Processing System[m
[32m+[m
[32m+[m[32mString evaluateGrade(double score) {[m
[32m+[m[32m  if (score < 0 || score > 100) {[m
[32m+[m[32m    throw FormatException('Score must be between 0 and 100. Received: $score');[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  if (score >= 90.0) {[m
[32m+[m[32m    return 'Passed with Highest Honors';[m
[32m+[m[32m  } else if (score >= 75.0) {[m
[32m+[m[32m    return 'Passed';[m
[32m+[m[32m  } else {[m
[32m+[m[32m    return 'Failed - Needs Remediation';[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mvoid main() {[m
[32m+[m[32m  print('==================================================');[m
[32m+[m[32m  print('       STUDENT GRADE BATCH PROCESSOR              ');[m
[32m+[m[32m  print('Student: Jay-Roween B. Bumatay | Section: 3.4BSIT');[m
[32m+[m[32m  print('==================================================');[m
[32m+[m
[32m+[m[32m  List<double> rawScores = [95.5, 82.0, 68.5, -15.0, 88.0];[m
[32m+[m
[32m+[m[32m  int processedCount = 0;[m
[32m+[m[32m  int errorCount = 0;[m
[32m+[m
[32m+[m[32m  for (int i = 0; i < rawScores.length; i++) {[m
[32m+[m[32m    double currentScore = rawScores[i];[m
[32m+[m[32m    print('\n[Record #${i + 1}] Evaluating score: $currentScore');[m
[32m+[m
[32m+[m[32m    try {[m
[32m+[m[32m      String result = evaluateGrade(currentScore);[m
[32m+[m[32m      print('Status: $result');[m
[32m+[m[32m      processedCount++;[m
[32m+[m[32m    } catch (e) {[m
[32m+[m[32m      print('Caught Error: $e');[m
[32m+[m[32m      print('Resolution: Skipped invalid record safely.');[m
[32m+[m[32m      errorCount++;[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  print('\n==================================================');[m
[32m+[m[32m  print('               BATCH PROCESSING SUMMARY           ');[m
[32m+[m[32m  print('==================================================');[m
[32m+[m[32m  print('Total Records Processed Successfully: $processedCount');[m
[32m+[m[32m  print('Total Erroneous Records Handled:      $errorCount');[m
[32m+[m[32m  print('Batch Status: Complete (Zero crashes encountered)');[m
[32m+[m[32m  print('==================================================');[m
[32m+[m[32m}[m
[1mdiff --git a/Lab2_Logic_Problem_Set/output.txt b/Lab2_Logic_Problem_Set/output.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..38c3873[m
[1m--- /dev/null[m
[1m+++ b/Lab2_Logic_Problem_Set/output.txt[m
[36m@@ -0,0 +1,28 @@[m
[32m+[m[32m==================================================[m
[32m+[m[32m       STUDENT GRADE BATCH PROCESSOR[m[41m              [m
[32m+[m[32mStudent: Jay-Roween B. Bumatay | Section: 3.4BSIT[m
[32m+[m[32m==================================================[m
[32m+[m
[32m+[m[32m[Record #1] Evaluating score: 95.5[m
[32m+[m[32mStatus: Passed with Highest Honors[m
[32m+[m
[32m+[m[32m[Record #2] Evaluating score: 82.0[m
[32m+[m[32mStatus: Passed[m
[32m+[m
[32m+[m[32m[Record #3] Evaluating score: 68.5[m
[32m+[m[32mStatus: Failed - Needs Remediation[m
[32m+[m
[32m+[m[32m[Record #4] Evaluating score: -15.0[m
[32m+[m[32mCaught Error: FormatException: Score must be between 0 and 100. Received: -15.0[m
[32m+[m[32mResolution: Skipped invalid record safely.[m
[32m+[m
[32m+[m[32m[Record #5] Evaluating score: 88.0[m
[32m+[m[32mStatus: Passed[m
[32m+[m
[32m+[m[32m==================================================[m
[32m+[m[32m               BATCH PROCESSING SUMMARY[m[41m           [m
[32m+[m[32m==================================================[m
[32m+[m[32mTotal Records Processed Successfully: 4[m
[32m+[m[32mTotal Erroneous Records Handled:      1[m
[32m+[m[32mBatch Status: Complete (Zero crashes encountered)[m
[32m+[m[32m==================================================[m
[1mdiff --git a/Lab2_Logic_Problem_Set/pubspec.yaml b/Lab2_Logic_Problem_Set/pubspec.yaml[m
[1mnew file mode 100644[m
[1mindex 0000000..7a51fa5[m
[1m--- /dev/null[m
[1m+++ b/Lab2_Logic_Problem_Set/pubspec.yaml[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mname: logic_problem_set[m
[32m+[m[32mdescription: Week 8 Logic Problem Set demonstrating conditionals, loops, functions, and try/catch.[m
[32m+[m[32mversion: 1.0.0[m
[32m+[m
[32m+[m[32menvironment:[m
[32m+[m[32m  sdk: '>=3.0.0 <4.0.0'[m
