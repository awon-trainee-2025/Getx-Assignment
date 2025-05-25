import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeProjectsView extends StatelessWidget {
  final Employee employee;

  const EmployeeProjectsView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${employee.name}'s Projects")),
      body: employee.projects.isEmpty
          ? Center(child: Text("No projects assigned."))
          : ListView.builder(
              itemCount: employee.projects.length,
              itemBuilder: (context, index) {
                final project = employee.projects[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(project.projectName),
                    subtitle: Text("Role: ${project.roleInProject}"),
                  ),
                );
              },
            ),
    );
  }
}
