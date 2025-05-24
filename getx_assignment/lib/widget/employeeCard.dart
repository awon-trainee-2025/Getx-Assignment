import 'package:flutter/material.dart';
import 'package:getx_assignment/models/departments_model.dart';



class EmployeeCard extends StatelessWidget {
  final Employees employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
      print("Employee: ${employee.name}, Projects: ${employee.projects}");

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              employee.name ?? 'No Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(employee.role ?? 'No Role'),
            Text('Email: ${employee.contact?.email ?? "N/A"}'),
            Text('Phone: ${employee.contact?.phone ?? "N/A"}'),
            if (employee.projects != null && employee.projects!.isNotEmpty)
            
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Projects:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...employee.projects!.map(
                      (proj) => Text(
                        '- ${proj.projectName} (${proj.roleInProject})',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    
                  ],
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('No Projects Assigned'),
              ),
          ],
        ),
      ),
    );
    
  }
}

