import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/controller/employee_controller.dart';
import 'package:getx_task/model/models.dart';
import 'package:getx_task/widgets/employee_card.dart';
import 'package:getx_task/widgets/project_card.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF1E6),
        appBar: AppBar(
          title: const Text(
            'Employees and Projects Data',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3D8D7A),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFAF1E6),
        ),
        body: GetBuilder<EmployeeController>(
          init: EmployeeController(),
          builder: (controller) {
            final employees = controller.getEngineeringEmployees();
            final projects = controller.getEmployeesProjects();
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    ' Engineering Employees ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3D8D7A),
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...employees.map((employee) {
                        return EmployeeCard(employee: employee);
                      }),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    ' Employees Projects ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3D8D7A),
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...projects.map((project) {
                        return ProjectCard(
                          employeeName: project["employeeName"],
                          projects:
                              project["Projects"] as List<EmployeeProject>,
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
