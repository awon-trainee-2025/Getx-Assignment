import 'package:getx_assignment/models/project.dart';

class Employee {
  final String id;
  final String name;
  final String role;
  final Contact contact;
  final List<Project>? projects;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.contact,
    this.projects,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    var projectsJson = json['projects'] as List<dynamic>?;
    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      contact: Contact.fromJson(json['contact']),
      projects: projectsJson?.map((p) => Project.fromJson(p)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role,
        'contact': contact.toJson(),
        'projects': projects?.map((p) => p.toJson()).toList(),
      };
}

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

  Map<String, dynamic> toJson() => {
        'email': email,
        'phone': phone,
      };
}
