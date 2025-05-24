import 'package:get/get.dart';
import '../models/employee_model.dart';
import '../data/company_data.dart';

class EmployeeController extends GetxController {
  List<Employee> employees = [];

  @override
  void onInit() {
    fetchEngineeringEmployees();
    super.onInit();
  }

  void fetchEngineeringEmployees() {
    final engineeringJson =
        companyData['departments']['engineering']['employees'];

    employees = (engineeringJson as List)
        .map((e) => Employee.fromJson(e))
        .toList();

    update();
  }

  List<Map<String, dynamic>> getProjectsPerEmployee() {
    return employees.map((employee) {
      return {
        "employeeName": employee.name,
        "projects": employee.projects.map((p) => p.toJson()).toList(),
      };
    }).toList();
  }
}
