import 'package:get/get.dart';
import '../models/employee.dart';
import '../services/employee_service.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() {
    employees.value = EmployeeService().getEngineeringEmployees();
  }
}
