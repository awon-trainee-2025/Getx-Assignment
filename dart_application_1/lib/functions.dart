import 'models/employee.dart';
import 'repository.dart';

List<Employee> getEngineeringEmployees() {
  final engData =
      repositoryData['departments']?['engineering']?['employees'] ?? [];
  return List<Map<String, dynamic>>.from(
    engData,
  ).map((e) => Employee.fromJson(e)).toList();
}

List<Map<String, dynamic>> getEmployeeProjects() {
  final employees = getEngineeringEmployees();

  return employees.map((emp) {
    return {
      'employeeId': emp.id,
      'name': emp.name,
      'projects': emp.projects.map((p) => p.toJson()).toList(),
    };
  }).toList();
}
