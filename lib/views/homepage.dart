import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_assignment/controllers/controller.dart';
import 'package:getx_assignment/models/employees.dart';
import 'package:getx_assignment/widgets/employees_card.dart';
import 'package:getx_assignment/widgets/projects_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      
      body: SafeArea(
        child: GetBuilder<Controller>(
          init: Controller(), // initializes your controller once
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...controller.engineer
                  .map((employee) => EmployeesCard(employee: employee ))
                  .toList(),
              const SizedBox(height: 16),
              ...controller.projectsList
                  .map((project) => ProjectCard(project: project as ProjectA))
                  .toList(),
            ],
              ),
            );                    
          },
        ),
      ),
    );
  }
}
