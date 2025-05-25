import 'package:app/model/employee_model.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;

  void fetchEngineeringEmployees(Map<String, dynamic> jsonData) {
    final engineeringEmployees = jsonData['departments']['engineering']['employees'];
    employees.value =
        engineeringEmployees.map<Employee>((e) => Employee.fromJson(e)).toList();
  }

  List<Map<String, dynamic>> getEmployeesAsJson() {
    return employees.map((e) => e.toJson()).toList();
  }

  List<Map<String, dynamic>> getEmployeeProjectsAsJson() {
    return employees.map((emp) => {
      'id': emp.id,
      'name': emp.name,
      'projects': emp.projects.map((p) => p.toJson()).toList(),
    }).toList();
  }
}
