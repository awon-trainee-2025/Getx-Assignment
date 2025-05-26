import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/employee_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Engineering Employees',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EmployeeListView(),
    );
  }
}
