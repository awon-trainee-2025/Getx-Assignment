import 'dart:convert';
import 'package:dart_application_1/functions.dart';

void main() {
  final engineeringEmployees = getEngineeringEmployees();
  final employeeProjects = getEmployeeProjects();

  print("Engineering Employees:");
  print(
    JsonEncoder.withIndent('  ')
        .convert(engineeringEmployees.map((e) => e.toJson()).toList()),
  );

  print("\nProjects of Each Employee:");
  print(JsonEncoder.withIndent('  ').convert(employeeProjects));
}

