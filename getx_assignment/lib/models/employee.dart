import 'contact.dart';
import 'project.dart';

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'role': role,
    'contact': contact.toJson(),
    if (projects != null)
      'projects': projects!.map((p) => p.toJson()).toList(),
  };
}
