import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employee});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: ${employee.name}'),
          Text('Job: ${employee.role}'),
          Text('Email: ${employee.email}'),
          Text('Phone: ${employee.phone}'),
          const SizedBox(height: 8),
          if (employee.projects.isNotEmpty) ...[
            const Text(
              "Projects:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (var project in employee.projects)
              Text('- ${project.projectName} (${project.roleInProject})'),
          ],
        ],
      ),
    );
  }
}
