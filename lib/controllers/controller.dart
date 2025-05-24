import 'package:get/get.dart';
import 'package:getx_assignment/models/employees.dart';

class Controller extends GetxController {
  List<Employees> engineer = [];
  List<ProjectA> projectsList = [];

  @override
  void onInit() {
    loadEngineers();
    loadProjects();
    super.onInit();
  }

  void loadEngineers() {
    final data = {
      "departments": {
        "engineering": {
          "employees": [
            {
              "id": "E001",
              "name": "Ahmed",
              "role": "Software Engineer",
              "contact": {
                "email": "ahmed@example.com",
                "phone": "+1234567890"
              }
            },
            {
              "id": "E002",
              "name": "Fatimah",
              "role": "DevOps Engineer",
              "contact": {
                "email": "fatimah@example.com",
                "phone": "+0987654321"
              },
              "projects": [
                {
                  "projectId": "P001",
                  "projectName": "Alpha",
                  "roleInProject": "DevOps Specialist"
                }
              ]
            }
          ]
        }
      }
    };

    final employeesList = data['departments']?['engineering']?['employees'] as List;
engineer = employeesList.map((e) => Employees.fromJson(e)).toList();

    update(); // triggers UI update
  }

  void loadProjects() {
    final data1 = {
      "projects": {
        "projectA": {
          "id": "P001",
          "name": "Alpha",
          "deadline": "2024-12-31",
          "team": [
            {"employeeId": "E001", "role": "Lead Developer"},
            {"employeeId": "E002", "role": "DevOps Specialist"}
          ]
        },
        "projectB": {
          "id": "P002",
          "name": "Beta",
          "deadline": "2024-09-30",
          "team": [
            {"employeeId": "E003", "role": "Project Lead"},
            {"employeeId": "E004", "role": "Content Developer"}
          ]
        },
        "projectC": {
          "id": "P003",
          "name": "Gamma",
          "deadline": "2025-03-31",
          "team": [
            {"employeeId": "E001", "role": "Contributor"}
          ]
        },
        "projectD": {
          "id": "P004",
          "name": "Delta",
          "deadline": "2025-06-30",
          "team": [
            {"employeeId": "E004", "role": "Content Strategist"}
          ]
        }
      }
    };

    final projectMap = data1['projects'] as Map<String, dynamic>;
    projectsList = projectMap.values.map((e) => ProjectA.fromJson(e)).toList();

    update(); // triggers UI update
  }
}
