import 'contact.dart';
import 'project.dart';

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
    this.projects = const [],
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    var projectList = <Project>[];
    if (json['projects'] != null) {
      projectList =
          List<Map<String, dynamic>>.from(
            json['projects'],
          ).map((p) => Project.fromJson(p)).toList();
    }

    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      contact: Contact.fromJson(json['contact']),
      projects: projectList,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'role': role,
    'contact': contact.toJson(),
    'projects': projects.map((p) => p.toJson()).toList(),
  };
}
