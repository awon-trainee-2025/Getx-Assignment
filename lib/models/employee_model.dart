class Project {
  final String projectId;
  final String projectName;
  final String roleInProject;

  Project({
    required this.projectId,
    required this.projectName,
    required this.roleInProject,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['projectId'],
      projectName: json['projectName'],
      roleInProject: json['roleInProject'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'projectName': projectName,
      'roleInProject': roleInProject,
    };
  }
}

class Employee {
  final String id;
  final String name;
  final String role;
  final String email;
  final String phone;
  final List<Project> projects;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    this.projects = const [],
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      email: json['contact']['email'],
      phone: json['contact']['phone'],
      projects: json['projects'] != null
          ? (json['projects'] as List).map((p) => Project.fromJson(p)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'email': email,
      'phone': phone,
      'projects': projects.map((p) => p.toJson()).toList(),
    };
  }
}
