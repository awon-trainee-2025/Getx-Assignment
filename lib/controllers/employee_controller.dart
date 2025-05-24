import '../data/data.dart';
import '../models/employee_model.dart';

class EmployeeController {
  List<Employee> getEngineeringEmployees() {
    final employeesJson = companyData['departments']['engineering']['employees'] as List;
    return employeesJson.map((e) => Employee.fromJson(e)).toList();
  }

  List<Map<String, dynamic>> getEngineeringEmployeesJson() {
    return getEngineeringEmployees().map((e) => e.toJson()).toList();
  }

  Map<String, List<Map<String, dynamic>>> getEmployeesProjectsJson() {
    final employees = getEngineeringEmployees();
    Map<String, List<Map<String, dynamic>>> result = {};

    for (var emp in employees) {
      result[emp.id] = emp.projects.map((p) => p.toJson()).toList();
    }

    return result;
  }
}