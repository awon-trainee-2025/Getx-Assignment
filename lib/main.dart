import 'package:flutter/material.dart';
import 'views/employee_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmployeeView(),
    );
  }
}