import 'package:eng_assignment/view/employee_projects_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/employee_controller.dart';

class EmployeeListView extends StatelessWidget {
  const EmployeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeController controller = Get.put(EmployeeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Engineering Employees')),
      body: ListView.builder(
        itemCount: controller.employees.length,
        itemBuilder: (context, index) {
          final employee = controller.employees[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(employee.name ?? ''),
              subtitle: Text(employee.role ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.to(
                  () => EmployeeProjectsView(employee: employee),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
