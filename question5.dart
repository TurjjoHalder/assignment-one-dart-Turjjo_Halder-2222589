// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/**
 * EXPECTED OUTPUT:
 * Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
 * Job Title: Manager
 * Base Salary: 8000.0
 * Calculated Salary: 9000.0
 * Payment processed: 9000.0
 * Report: Monthly report for John Smith in IT department
 * 
 * Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
 * Job Title: Senior Developer
 * Base Salary: 6000.0
 * Calculated Salary: 6500.0
 * Payment processed: 6500.0
 */

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) => baseSalary + bonus;
  // TO-DO: Calculate total salary (base + bonus)

  void processPayment(double amount) {
    // TO-DO: Process payment and print "Payment processed: <amount>"
    print('Payment processed: $amount');
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) =>
      // TO-DO: Generate and return report string: "Report: Monthly report for <name> in <department> department"
      'Report: Monthly report for $employeeName in $department department';
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    // TO-DO: Display employee information
    print('$name (ID: $id, Department: $department)');
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);

  @override
  String getJobTitle() => 'Manager';
  // TO-DO: Return manager job title

  @override
  double getBaseSalary() => 8000.0;
  // TODO: Return manager base salary

  @override
  void displayInfo() {
    // TODO: Override to show manager-specific info as shown in expected output
    print(
        'Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)');
  }
}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);

  @override
  String getJobTitle() => 'Senior Developer'; // Return developer job title

  @override
  double getBaseSalary() => 6000.0; // Return developer base salary

  @override
  void displayInfo() {
    // TODO: Override to show developer-specific info as shown in expected output
    print(
        'Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)');
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //    - Salary calculation with bonus
  //    - Payment processing
  //    - Report generation (for managers)
  //    - Display all employee information

  // TODO: Create one Manager and one Developer with the details shown in expected output
  Manager manager = Manager('John Smith', 'M001', 'IT', 5);
  Developer developer = Developer('Alice Johnson', 'D001', 'IT', 'Dart');

  // TODO: Demonstrate salary calculation and payment processing for both
  double managerBonus = 1000.0;
  double developerBonus = 500.0;

  double managerSalary =
      manager.calculateSalary(manager.getBaseSalary(), managerBonus);
  double developerSalary =
      developer.calculateSalary(developer.getBaseSalary(), developerBonus);
  // manager.processPayment(managerSalary);
  // developer.processPayment(developerSalary);
  // // TODO: Generate and print report for the Manager
  // var report = manager.generateReport(manager.name, manager.department);
  // print(report);

  // // TODO: Display information for both employees
  // manager.displayInfo();
  // developer.displayInfo();
  print('${manager.runtimeType}: ${manager.name} (ID: ${manager.id}, Department: ${manager.department}, Team Size: ${manager.teamSize})');
  print('Job Title: ${manager.getJobTitle()}');
  print('Base Salary: ${manager.getBaseSalary()}');
  print('Calculated Salary: $managerSalary');
  manager.processPayment(managerSalary);
  var report = manager.generateReport(manager.name, manager.department);
  print(report);
  print('');
  print('${developer.runtimeType}: ${developer.name} (ID: ${developer.id}, Department: ${developer.department}, Language: ${developer.programmingLanguage})');
  print('Job Title: ${developer.getJobTitle()}');
  print('Base Salary: ${developer.getBaseSalary()}');
  print('Calculated Salary: $developerSalary');
  developer.processPayment(developerSalary);
  

}


//  * EXPECTED OUTPUT:
//  * Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
//  * Job Title: Manager
//  * Base Salary: 8000.0
//  * Calculated Salary: 9000.0
//  * Payment processed: 9000.0
//  * Report: Monthly report for John Smith in IT department
//  * 
//  * Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
//  * Job Title: Senior Developer
//  * Base Salary: 6000.0
//  * Calculated Salary: 6500.0
//  * Payment processed: 6500.0
//  */