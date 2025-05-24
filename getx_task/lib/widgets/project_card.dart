import 'package:flutter/material.dart';
import 'package:getx_task/model/models.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.employeeName,
    required this.projects,
  });

  final String employeeName;
  final List<EmployeeProject> projects;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: $employeeName',
                style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
              ),
              SizedBox(height: 8),
              Text(
                'Projects:',
                style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
              ),
              SizedBox(height: 4),
              if (projects.isEmpty)
                Text(
                  'no projects',
                  style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
                )
              else
                ...projects.map(
                  (p) => Text(
                    '${p.projectName} (${p.roleInProject})',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 126, 154, 109)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
