import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';
import 'employee_projects_view.dart';

class EmployeeListView extends StatelessWidget {
  final EmployeeController controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Engineering Employees")),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.employees.length,
          itemBuilder: (context, index) {
            final emp = controller.employees[index];
            return ListTile(
              title: Text(emp.name),
              subtitle: Text(emp.role),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.to(() => EmployeeProjectsView(employee: emp));
              },
            );
          },
        );
      }),
    );
  }
}
