
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_assignment/controller/employee_controller.dart';
import 'package:getx_assignment/view/eng_employee.dart';

void main() {
  Get.put(EmployeeController());  // سجل الكنترولر هنا مرة وحدة
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const EngEmployee(),
    );
  }
}