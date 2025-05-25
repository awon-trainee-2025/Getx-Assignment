class Contact {
  final String email;
  final String phone;

  Contact({required this.email, required this.phone});

  Map<String, dynamic> toJson() => {
        'email': email,
        'phone': phone,
      };
}

class Project {
  final String projectId;
  final String projectName;
  final String roleInProject;

  Project({
    required this.projectId,
    required this.projectName,
    required this.roleInProject,
  });

  Map<String, dynamic> toJson() => {
        'projectId': projectId,
        'projectName': projectName,
        'roleInProject': roleInProject,
      };
}

class Employee {
  final String id;
  final String name;
  final String role;
  final Contact contact;
  final List<Project> projects;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.contact,
    required this.projects,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role,
        'contact': contact.toJson(),
        'projects': projects.map((p) => p.toJson()).toList(),
      };
}

List<Employee> getEngineeringEmployees() {
  return [
    Employee(
      id: 'E001',
      name: 'Ahmed',
      role: 'Software Engineer',
      contact: Contact(email: 'ahmed@example.com', phone: '+1234567890'),
      projects: [],
    ),
    Employee(
      id: 'E002',
      name: 'Fatimah',
      role: 'DevOps Engineer',
      contact: Contact(email: 'fatimah@example.com', phone: '+0987654321'),
      projects: [
        Project(
          projectId: 'P001',
          projectName: 'Alpha',
          roleInProject: 'DevOps Specialist',
        ),
      ],
    ),
  ];
}

List<Map<String, dynamic>> getEmployeeProjects() {
  return getEngineeringEmployees().map((e) {
    return {
      'employeeId': e.id,
      'name': e.name,
      'projects': e.projects.map((p) => p.toJson()).toList(),
    };
  }).toList();
}

