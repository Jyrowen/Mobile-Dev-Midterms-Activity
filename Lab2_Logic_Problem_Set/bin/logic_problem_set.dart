/// Course: PC16 – Mobile Development with Lab
/// Activity: Lab 2 (Week 8) – Logic Problem Set
/// Student: Jay-Roween B. Bumatay
/// Section: 3.4BSIT
/// Scenario: Student Grade Evaluation and Batch Processing System

String evaluateGrade(double score) {
  if (score < 0 || score > 100) {
    throw FormatException('Score must be between 0 and 100. Received: $score');
  }

  if (score >= 90.0) {
    return 'Passed with Highest Honors';
  } else if (score >= 75.0) {
    return 'Passed';
  } else {
    return 'Failed - Needs Remediation';
  }
}

void main() {
  print('==================================================');
  print('       STUDENT GRADE BATCH PROCESSOR              ');
  print('Student: Jay-Roween B. Bumatay | Section: 3.4BSIT');
  print('==================================================');

  List<double> rawScores = [95.5, 82.0, 68.5, -15.0, 88.0];

  int processedCount = 0;
  int errorCount = 0;

  for (int i = 0; i < rawScores.length; i++) {
    double currentScore = rawScores[i];
    print('\n[Record #${i + 1}] Evaluating score: $currentScore');

    try {
      String result = evaluateGrade(currentScore);
      print('Status: $result');
      processedCount++;
    } catch (e) {
      print('Caught Error: $e');
      print('Resolution: Skipped invalid record safely.');
      errorCount++;
    }
  }

  print('\n==================================================');
  print('               BATCH PROCESSING SUMMARY           ');
  print('==================================================');
  print('Total Records Processed Successfully: $processedCount');
  print('Total Erroneous Records Handled:      $errorCount');
  print('Batch Status: Complete (Zero crashes encountered)');
  print('==================================================');
}
