import 'package:flutter/material.dart';
import '../controllers/employee_controller.dart';
import '../widgets/employee_card.dart';

class EmployeeView extends StatelessWidget {
  final controller = EmployeeController();

  EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    final employees = controller.getEngineeringEmployees();

    return Scaffold(
      appBar: AppBar(title: const Text("Engineering Employees")),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return EmployeeCard(employee: employees[index]);
        },
      ),
    );
  }
}