/// Course: PC16 – Mobile Development with Lab
/// Activity: Lab 3 (Week 9) – Object-Oriented Programming (OOP)
/// Student: Jay-Roween B. Bumatay
/// Section: 3.4BSIT
/// Scenario: University Student Enrollment and Profile Management System

class Student {
  String _studentId;
  String _fullName;
  double _gpa;

  Student(this._studentId, this._fullName, this._gpa);

  Student.freshman(this._studentId, this._fullName) : _gpa = 1.00;

  String get studentId => _studentId;
  String get fullName => _fullName;
  double get gpa => _gpa;

  set gpa(double newGpa) {
    if (newGpa >= 1.0 && newGpa <= 5.0) {
      _gpa = newGpa;
    } else {
      print('Error: Invalid GPA $newGpa. Must be between 1.0 and 5.0.');
    }
  }

  bool checkDeansList() {
    return _gpa <= 1.75;
  }

  void displayProfile() {
    print('--------------------------------------------------');
    print('Student ID   : $_studentId');
    print('Full Name    : $_fullName');
    print('Section      : 3.4BSIT');
    print('GPA          : ${_gpa.toStringAsFixed(2)}');
    print('Dean\'s List  : ${checkDeansList() ? "Yes (Qualified)" : "No"}');
    print('--------------------------------------------------');
  }
}

void main() {
  print('==================================================');
  print('     UNIVERSITY STUDENT MANAGEMENT SYSTEM         ');
  print('Student: Jay-Roween B. Bumatay | Section: 3.4BSIT');
  print('==================================================');

  List<Student> roster = <Student>[
    Student('IT-2026-001', 'Jay-Roween B. Bumatay', 1.25),
    Student('IT-2026-002', 'Maria Santos', 2.00),
    Student.freshman('IT-2026-003', 'Juan Dela Cruz'),
  ];

  Map<String, Student> byId = <String, Student>{
    for (Student s in roster) s.studentId: s,
  };

  for (Student student in roster) {
    student.displayProfile();
  }

  print(
      '\nRoster size: ${roster.length} | Lookup keys: ${byId.keys.join(', ')}');

  print('\n[Testing Setter Validation]');
  Student student3 = byId['IT-2026-003']!;
  print('Attempting to set invalid GPA (6.0) for ${student3.fullName}...');
  student3.gpa = 6.0;

  print('Setting valid GPA (1.50) for ${student3.fullName}...');
  student3.gpa = 1.50;
  student3.displayProfile();

  print('==================================================');
  print('Batch OOP Processing Complete. Zero errors.');
  print('==================================================');
}
