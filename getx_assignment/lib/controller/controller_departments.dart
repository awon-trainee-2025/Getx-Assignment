import 'package:get/get.dart';
import 'package:getx_assignment/models/departments_model.dart';

class deparController extends GetxController {
  List<departmentsData> depar = [];

  @override
  void onInit() {
    getAlldepar();
    super.onInit();
  }

  void getAlldepar() {
    final data = [
      {
        "departments": {
          "engineering": {
            "employees": [
              {
                "id": "E001",
                "name": "Ahmed",
                "role": "Software Engineer",
                "contact": {
                  "email": "ahmed@example.com",
                  "phone": "+1234567890",
                },
                "projects": [
                  {
                    "projectId": "P001",
                    "projectName": "Alpha",
                    "roleInProject": "Lead Developer",
                  },
                  {
                    "projectId": "P003",
                    "projectName": "Gamma",
                    "roleInProject": "Contributor",
                  },               
                ],

              },
              {
                "id": "E002",
                "name": "Fatimah",
                "role": "DevOps Engineer",
                "contact": {
                  "email": "fatimah@example.com",
                  "phone": "+0987654321",
                },
                "projects": [
                  {
                    "projectId": "P001",
                    "projectName": "Alpha",
                    "roleInProject": "DevOps Specialist",
                  },
                ],
              },
            ],
          },
          "marketing": {
            "employees": [
              {
                "id": "E003",
                "name": "Saeed",
                "role": "Marketing Manager",
                "contact": {
                  "email": "saeed@example.com",
                  "phone": "+1122334455",
                },
                "projects": [
                  {
                    "projectId": "P003",
                    "projectName": "Beta",
                    "roleInProject": "Project Lead",
                  },
                ],
              },
              {
                "id": "E004",
                "name": "Noura",
                "role": "Content Creator",
                "contact": {
                  "email": "noura@example.com",
                  "phone": "+5544332211",
                },
                "projects": [
                  {
                    "projectId": "P003",
                    "projectName": "Beta",
                    "roleInProject": "Content Developer",
                  },
                  {
                    "projectId": "P004",
                    "projectName": "Delta",
                    "roleInProject": "Content Strategist",
                  },
                ],
              },
            ],
            "budget": {
              "total": 800000,
              "expenses": [
                {"item": "Advertising", "amount": 300000},
                {"item": "Market Research", "amount": 150000},
              ],
            },
          },
        },
        "projects": {
          "projectA": {
            "id": "P001",
            "name": "Alpha",
            "deadline": "2024-12-31",
            "team": [
              {"employeeId": "E001", "role": "Lead Developer"},
              {"employeeId": "E002", "role": "DevOps Specialist"},
            ],
          },
          "projectB": {
            "id": "P002",
            "name": "Beta",
            "deadline": "2024-09-30",
            "team": [
              {"employeeId": "E003", "role": "Project Lead"},
              {"employeeId": "E004", "role": "Content Developer"},
            ],
          },
          "projectC": {
            "id": "P003",
            "name": "Gamma",
            "deadline": "2025-03-31",
            "team": [
              {"employeeId": "E001", "role": "Contributor"},
            ],
          },
          "projectD": {
            "id": "P004",
            "name": "Delta",
            "deadline": "2025-06-30",
            "team": [
              {"employeeId": "E004", "role": "Content Strategist"},
            ],
          },
        },
      },
    ];

    depar = data.map((d) => departmentsData.fromJson(d)).toList();

    update();
  }

  List<Map<String, dynamic>> getAllEngineering() {
    final engineeringEmp = depar[0].departments?.engineering?.employees ?? [];
    return engineeringEmp.map((d) => d.toJson()).toList();
  }

  List<Map<String, dynamic>> getAllMarketing() {
    final marketingEmp = depar[0].departments?.marketing?.employees ?? [];
    return marketingEmp.map((d) => d.toJson()).toList();
  }

  List<Map<String, dynamic>> getEmployeesProjects() {
  final List<Map<String, dynamic>> result = [];

  final allEmployees = [
    ...depar[0].departments?.engineering?.employees ?? [],
    ...depar[0].departments?.marketing?.employees ?? [],
  ];

  for (var emp in allEmployees) {
    if (emp.projects != null && emp.projects!.isNotEmpty) {
      result.add({
        "id": emp.id,
        "name": emp.name,
        "role": emp.role,
        "projects": emp.projects!.map((p) => {
          "projectId": p.projectId,
          "projectName": p.projectName,
          "roleInProject": p.roleInProject,
        }).toList(),
      });
    }
  }

  return result;
}

}