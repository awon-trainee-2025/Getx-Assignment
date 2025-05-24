import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:display/models/model_eng.dart';

class EngView extends StatelessWidget {
  const EngView({super.key});

  @override
  Widget build(BuildContext context) {

    final jsonString = ''' 
      [
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
      },
      "marketing": {
        "employees": [
          {
            "id": "E003",
            "name": "Saeed",
            "role": "Marketing Manager",
            "contact": {
              "email": "saeed@example.com",
              "phone": "+1122334455"
            },
            "projects": [
              {
                "projectId": "P003",
                "projectName": "Beta",
                "roleInProject": "Project Lead"
              }
            ]
          },
          {
            "id": "E004",
            "name": "Noura",
            "role": "Content Creator",
            "contact": {
              "email": "noura@example.com",
              "phone": "+5544332211"
            },
            "projects": [
              {
                "projectId": "P003",
                "projectName": "Beta",
                "roleInProject": "Content Developer"
              },
              {
                "projectId": "P004",
                "projectName": "Delta",
                "roleInProject": "Content Strategist"
              }
            ]
          }
        ],
        "budget": {
          "total": 800000,
          "expenses": [
            {
              "item": "Advertising",
              "amount": 300000
            },
            {
              "item": "Market Research",
              "amount": 150000
            }
          ]
        }
      }
    },
    "projects": {
      "projectA": {
        "id": "P001",
        "name": "Alpha",
        "deadline": "2024-12-31",
        "team": [
          {
            "employeeId": "E001",
            "role": "Lead Developer"
          },
          {
            "employeeId": "E002",
            "role": "DevOps Specialist"
          }
        ]
      },
      "projectB": {
        "id": "P002",
        "name": "Beta",
        "deadline": "2024-09-30",
        "team": [
          {
            "employeeId": "E003",
            "role": "Project Lead"
          },
          {
            "employeeId": "E004",
            "role": "Content Developer"
          }
        ]
      },
      "projectC": {
        "id": "P003",
        "name": "Gamma",
        "deadline": "2025-03-31",
        "team": [
          {
            "employeeId": "E001",
            "role": "Contributor"
          }
        ]
      },
      "projectD": {
        "id": "P004",
        "name": "Delta",
        "deadline": "2025-06-30",
        "team": [
          {
            "employeeId": "E004",
            "role": "Content Strategist"
          }
        ]
      }
    }
  }
]
    ''';

    final decoded = jsonDecode(jsonString);
    final companyData = CompanyData.fromJson(decoded[0]);

    final engineering = companyData.departments['engineering'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Engineering Employees'),
      ),
      body: engineering == null
          ? const Center(child: Text("No engineering data"))
          : ListView.builder(
              itemCount: engineering.employees.length,
              itemBuilder: (context, index) {
                final employee = engineering.employees[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${employee.name} - ${employee.role}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 10),
                        const Text('Projects:', style: TextStyle(fontSize: 14)),
                        if (employee.projects != null)
                          ...employee.projects!.map(
                            (project) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                '• ${project.projectName} (${project.roleInProject})',
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'No projects assigned',
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}