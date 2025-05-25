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
    this.projects = const [],
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      contact: Contact.fromJson(json['contact']),
      projects: json['projects'] != null
          ? List<Project>.from(json['projects'].map((x) => Project.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'contact': contact.toJson(),
      'projects': projects.map((x) => x.toJson()).toList(),
    };
  }
}