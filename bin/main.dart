import 'dart:convert';

import 'package:getx_assignment/functions.dart' as funcs;

void main() {
  String jsonData = ''' 
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
      }
    }
  }
  ''';

  var data = jsonDecode(jsonData);

  var engineeringEmployees = funcs.displayEngineeringEmployees(data);
  var projectsOfEmployees = funcs.displayProjectsOfEmployees(data);

  var encoder = JsonEncoder.withIndent('  ');

  print('Engineering Employees:');
  print(encoder.convert(engineeringEmployees));

  print('\nProjects of each employee:');
  print(encoder.convert(projectsOfEmployees));
}
