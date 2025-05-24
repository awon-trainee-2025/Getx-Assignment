import 'employee.dart';

class Department {
  final String name;
  final List<Employee> employees;

  Department({required this.name, required this.employees});

  Map<String, dynamic> toJson() => {
    'name': name,
    'employees': employees.map((e) => e.toJson()).toList(),
  };
}
