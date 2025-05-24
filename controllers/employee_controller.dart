import 'package:get/get.dart';
import '../models/employee.dart';
import '../models/project.dart';
import '../models/project_team_member.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  var projects = <Project>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    employees.addAll([
      Employee(id: 'E001', name: 'Ahmed'),
      Employee(id: 'E002', name: 'Fatimah'),
    ]);

    projects.addAll([
      Project(
        id: 'P001',
        name: 'Alpha',
        deadline: '2024-12-31',
        team: [
          ProjectTeamMember(employeeId: 'E001', role: 'Lead Developer'),
          ProjectTeamMember(employeeId: 'E002', role: 'DevOps Specialist'),
        ],
      ),
      Project(
        id: 'P003',
        name: 'Gamma',
        deadline: '2025-03-31',
        team: [
          ProjectTeamMember(employeeId: 'E001', role: 'Contributor'),
        ],
      ),
    ]);
  }

  List<Project> getProjectsForEmployee(String employeeId) {
    return projects.where((project) =>
      project.team.any((member) => member.employeeId == employeeId)
    ).toList();
  }
}