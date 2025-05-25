import 'package:app/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeView extends StatelessWidget {
  final Map<String, dynamic> mockJson; 
  final EmployeeController controller = Get.put(EmployeeController());

  EmployeeView({super.key, required this.mockJson}) {
    controller.fetchEngineeringEmployees(mockJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Engineering Employees")),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.employees.length,
          itemBuilder: (context, index) {
            final emp = controller.employees[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 3,
              child: ListTile(
                title: Text(emp.name),
                subtitle: Text(emp.role),
                trailing: IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Projects for ${emp.name}",
                      content: emp.projects.isNotEmpty
                          ? Column(
                              children: emp.projects
                                  .map((p) => Text("${p.projectName} - ${p.roleInProject}"))
                                  .toList(),
                            )
                          : const Text("No projects assigned."),
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
