import 'package:get/get.dart';
import '../model/employee_model.dart';
import '../data/data.dart';

class EmployeeController extends GetxController {
  List<Employee> employees = [];

  @override
  void onInit() {
    super.onInit();
    loadEmployees();
  }

  void loadEmployees() {
    for (var item in engineeringData) {
      employees.add(Employee.fromJson(item));
    }
  }
}
