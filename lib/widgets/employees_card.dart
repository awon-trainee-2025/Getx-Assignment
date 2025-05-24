import 'package:flutter/material.dart';
import 'package:getx_assignment/models/employees.dart';

class EmployeesCard extends StatelessWidget {
  final Employees employee;

  const EmployeesCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(  
             color: Colors.blueAccent,
             border: Border.all(
               color: Colors.black,
               width: 2.0,
             ),
             borderRadius: BorderRadius.circular(10.0),
             gradient: LinearGradient(
               colors: [
                Colors.indigo,
                Colors.blueAccent
               ]
             ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(employee.name ?? ''),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Role: ${employee.role}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              Text("Email: ${employee.contact?.email}", style: const TextStyle(color: Colors.white)),
              Text("Phone: ${employee.contact?.phone}",style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
