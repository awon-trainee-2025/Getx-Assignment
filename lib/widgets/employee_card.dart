import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(employee.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(employee.role),
            Text("Email: ${employee.contact.email}"),
            Text("Phone: ${employee.contact.phone}"),
            if (employee.projects.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text("Projects:", style: TextStyle(fontWeight: FontWeight.bold)),
              for (var p in employee.projects)
                Text("- ${p.projectName} as ${p.roleInProject}"),
            ]
          ],
        ),
      ),
    );
  }
}