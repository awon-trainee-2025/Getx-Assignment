import 'contact_model.dart';
import 'project_model.dart';

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
    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      contact: Contact.fromJson(json['contact']),
      projects: (json['projects'] != null)
          ? (json['projects'] as List).map((p) => Project.fromJson(p)).toList()
          : [],
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
