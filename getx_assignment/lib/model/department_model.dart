import 'employee_model.dart';

class Department {
  final List<Employee> employees;

  Department({required this.employees});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      employees: List<Employee>.from(
        json['employees'].map((x) => Employee.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employees': employees.map((x) => x.toJson()).toList(),
    };
  }
}