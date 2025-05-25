import '../models/employee.dart';
import '../data/repository.dart';

class EmployeeService {
  List<Employee> getEngineeringEmployees() {
    final employeeList = repositoryData['departments']['engineering']['employees'] as List;
    return employeeList.map((e) => Employee.fromJson(e)).toList();
  }
}
