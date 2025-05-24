import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';
import '../widgets/employee_card.dart';
import '../models/employee_model.dart';

class AllEmployeesView extends StatelessWidget {
  const AllEmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<EmployeeController>(
          init: EmployeeController(),
          builder: (controller) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: controller.employees
                  .map((emp) => EmployeeCard(employee: emp))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
