import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_assignment/data/data.dart';
import 'package:getx_assignment/model/employee_model.dart';

class EmployeeController extends GetxController{
  List<Employee> engineeringEmployees = [];

  loadEmployees() {
    engineeringEmployees = getEngineeringEmployees();
    update();
  }
}