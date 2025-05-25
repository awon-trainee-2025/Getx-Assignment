import 'package:flutter/material.dart';
import 'package:getx_assignment/model/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(color: Colors.amber),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              employee.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              employee.role,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 12),
            Text('Contact:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Email: ${employee.contact.email}'),
            Text('Phone: ${employee.contact.phone}'),
            SizedBox(height: 12),
            Text('Projects:', style: TextStyle(fontWeight: FontWeight.bold)),
            employee.projects.isEmpty
                ? Text('No projects assigned')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: employee.projects
                        .map((p) => Text(
                            '- ${p.projectName} (Role: ${p.roleInProject})'))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}