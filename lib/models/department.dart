import 'employee.dart';

class Department {
  final String name;
  final List<Employee> employees;

  Department({
    required this.name,
    required this.employees,
  });

  factory Department.fromJson(String name, Map<String, dynamic> json) {
    var employeesJson = json['employees'] as List<dynamic>;
    return Department(
      name: name,
      employees: employeesJson
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'employees': employees.map((e) => e.toJson()).toList(),
      };
}
