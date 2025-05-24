import 'dart:convert';

import 'models/contact.dart';
import 'models/employee.dart';
import 'models/project.dart';
import 'models/department.dart';

// Sample employee list
final engineeringDepartment = Department(
  name: 'Engineering',
  employees: [
    Employee(
      id: 'E001',
      name: 'Ahmed',
      role: 'Software Engineer',
      contact: Contact(email: 'ahmed@example.com', phone: '+1234567890'),
    ),
    Employee(
      id: 'E002',
      name: 'Fatimah',
      role: 'DevOps Engineer',
      contact: Contact(email: 'fatimah@example.com', phone: '+0987654321'),
      projects: [
        Project(projectId: 'P001', projectName: 'Alpha', roleInProject: 'DevOps Specialist')
      ],
    ),
  ],
);

// Function to return engineering employees
String displayEngineeringEmployees() {
  return jsonEncode(engineeringDepartment.toJson());
}

// Function to return each employee’s projects
String displayEmployeeProjects() {
  var projectList = engineeringDepartment.employees.map((e) {
    return {
      'name': e.name,
      'projects': e.projects?.map((p) => p.toJson()).toList() ?? [],
    };
  }).toList();

  return jsonEncode(projectList);
}

void main() {
  print('Engineering Department Employees:');
  print(displayEngineeringEmployees());

  print('\nProjects for Each Engineering Employee:');
  print(displayEmployeeProjects());
}
