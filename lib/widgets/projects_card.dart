import 'package:flutter/material.dart';
import 'package:getx_assignment/models/employees.dart';

class ProjectCard extends StatelessWidget {
  final ProjectA project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
            width: 250.0,
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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Project ID: ${project.id}", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
            Text("Name: ${project.name}",style: const TextStyle(color: Colors.white)),
            Text("Deadline: ${project.deadline}",style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            const Text("Team Members:", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            const SizedBox(height: 6),
            ...project.team!.map((member) => Text("- ${member.employeeId} (${member.role})")),
        ],
          ),
        ),
      ),
    );
  }
}
