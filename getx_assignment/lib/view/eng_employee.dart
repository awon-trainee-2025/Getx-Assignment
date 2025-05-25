import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_assignment/controller/employee_controller.dart';
import 'package:getx_assignment/custom/employee_card.dart';
import 'package:getx_assignment/model/employee_model.dart';
class EngEmployee extends StatefulWidget {
  const EngEmployee({super.key});

  @override
  State<EngEmployee> createState() => _EngEmployeeState();
}

class _EngEmployeeState extends State<EngEmployee> {

  final EmployeeController controller= EmployeeController();

  @override
  void initState(){
    super.initState();
    controller.loadEmployees();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Engineering Employees')),
      body: GetBuilder<EmployeeController>(
        init: EmployeeController(),
        builder: (controller) {
          if (controller.engineeringEmployees.isEmpty) {
            controller.loadEmployees();  // هنا نحمل البيانات
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.engineeringEmployees.length,
            itemBuilder: (context, index) {
              return EmployeeCard(employee: controller.engineeringEmployees[index]);
            },
          );
        },
      ),
    );
  }
}
