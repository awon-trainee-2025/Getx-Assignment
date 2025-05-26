import 'package:flutter/material.dart';
import '../model/employee_model.dart';

class EmployeeProjectsView extends StatelessWidget {
  final Employee employee;

  const EmployeeProjectsView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${employee.name} Projects')),
      body:
          (employee.projects == null || employee.projects!.isEmpty)
              ? const Center(child: Text('No projects found'))
              : ListView.builder(
                itemCount: employee.projects!.length,
                itemBuilder: (context, index) {
                  final project = employee.projects![index];
                  return ListTile(
                    title: Text(project.projectName ?? ''),
                    subtitle: Text(project.roleInProject ?? ''),
                    leading: const Icon(Icons.work_outline),
                  );
                },
              ),
    );
  }
}
