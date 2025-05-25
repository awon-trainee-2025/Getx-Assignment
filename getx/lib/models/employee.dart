import 'contact.dart';
import 'project.dart';

class Employee {
  String id;
  String name;
  String role;
  Contact contact;
  List<Project> projects;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.contact,
    required this.projects,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    List<Project> projectList = [];

    if (json.containsKey('projects')) {
      projectList = (json['projects'] as List)
          .map((item) => Project.fromJson(item))
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
