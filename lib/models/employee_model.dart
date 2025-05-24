class Contact {
  final String email;
  final String phone;

  Contact({required this.email, required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
    };
  }
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
  final Contact contact;
  final List<Project> projects;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.contact,
    required this.projects,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    var projectList = <Project>[];
    if (json['projects'] != null) {
      projectList = (json['projects'] as List)
          .map((p) => Project.fromJson(p))
          .toList();
    }

    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      contact: Contact.fromJson(json['contact']),
      projects: projectList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'contact': contact.toJson(),
      'projects': projects.map((p) => p.toJson()).toList(),
    };
  }
}