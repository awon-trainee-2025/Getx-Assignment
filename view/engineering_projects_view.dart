import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';

class EngineeringProjectsView extends StatelessWidget {
  final controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Engineering Projects')),
      body: Obx(() => ListView.builder(
        itemCount: controller.employees.length,
        itemBuilder: (context, index) {
          final employee = controller.employees[index];
          final employeeProjects = controller.getProjectsForEmployee(employee.id);

          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${employee.name} (${employee.id})', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  ...employeeProjects.map((project) {
                    final role = project.team.firstWhere(
                      (member) => member.employeeId == employee.id,
                    ).role;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Project: ${project.name}', style: TextStyle(fontSize: 16)),
                          Text('Role: $role'),
                          Text('Deadline: ${project.deadline}'),
                          Divider(),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}