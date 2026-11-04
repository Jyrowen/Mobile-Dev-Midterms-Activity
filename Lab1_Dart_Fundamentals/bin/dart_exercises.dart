/// Course: PC16 – Mobile Development with Lab
/// Activity: Lab 1 (Week 7) – Dart Fundamentals
/// Student: Jay-Roween B. Bumatay
/// Section: 3.4BSIT
/// Scenario: Campus Coffee Shop Ordering & Discount System

void main() {
  String customerName = 'Jay-Roween B. Bumatay';
  int itemQuantity = 5;
  double unitPrice = 125.50;
  bool isVIPMember = true;

  double grossTotal = itemQuantity * unitPrice;

  int loyaltyPointsEarned = grossTotal.toInt() ~/ 50;

  int leftoverItems = itemQuantity % 2;

  bool qualifiesForBulkDiscount = grossTotal >= 500.0;

  bool isSpecialCustomer = isVIPMember == true;

  print('==================================================');
  print('          CAMPUS CAFE ORDER SUMMARY               ');
  print('Student: Jay-Roween B. Bumatay | Section: 3.4BSIT');
  print('==================================================');
  print('Customer Name: $customerName');
  print('VIP Status: $isVIPMember');
  print('Quantity Ordered: $itemQuantity cups');
  print('Unit Price: PHP ${unitPrice.toStringAsFixed(2)}');
  print('--------------------------------------------------');
  print('Gross Subtotal: PHP ${grossTotal.toStringAsFixed(2)}');
  print('Loyalty Points Earned: $loyaltyPointsEarned pts');
  print('Leftover Items (Unpaired): $leftoverItems');
  print('--------------------------------------------------');
  print('Qualifies for Bulk Discount (>= PHP 500): $qualifiesForBulkDiscount');
  print('Is Special VIP Customer: $isSpecialCustomer');
  print('==================================================');
}
