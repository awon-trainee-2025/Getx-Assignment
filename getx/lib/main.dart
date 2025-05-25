import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/employee_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Engineering Employees',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmployeeListView(),
    );
  }
}
