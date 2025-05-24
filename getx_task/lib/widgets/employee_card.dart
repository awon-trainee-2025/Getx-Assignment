import 'package:flutter/material.dart';
import 'package:getx_task/model/models.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employee});

  final Employees employee;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: const Color(0xFFFDFAF6),
          border: Border.all(color: Color(0xFF31511E), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${employee.name}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
            ),
            Text(
              'Role: ${employee.role}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
            ),
            Text(
              'Email: ${employee.contact?.email}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
            ),
            Text(
              'Phone: ${employee.contact?.phone}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
            ),
          ],
        ),
      ),
    );
  }
}
