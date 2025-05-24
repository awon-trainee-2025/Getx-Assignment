import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_assignment/controller/controller_departments.dart';
import 'package:getx_assignment/widget/employeeCard.dart';



class employeePage extends StatefulWidget {
  const employeePage({super.key});

  @override
  State<employeePage> createState() => _employeePageState();
}

class _employeePageState extends State<employeePage> {
  int select = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      Text('engineering'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            select = 1;
                          });
                        },
                        icon:
                            select == 1
                                ? Icon(Icons.circle)
                                : Icon(Icons.circle_outlined),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text('marketing'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            select = 2;
                          });
                        },
                        icon:
                            select == 2
                                ? Icon(Icons.circle)
                                : Icon(Icons.circle_outlined),
                      ),
                    ],
                  ),
                ],
              ),

              select == 1
                  ? Expanded(child: engineeringEmployees())
                  : Expanded(child: marketingEmployees()),
            ],
          ),
        ),
      ),
    );
  }
}

class engineeringEmployees extends StatelessWidget {
  const engineeringEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<deparController>(
      init: deparController(),
      builder: (controller) {
        final engineeringEmployees =
            controller.depar
                .expand((dep) => dep.departments?.engineering?.employees ?? [])
                .toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            itemCount: engineeringEmployees.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
            itemBuilder: (context, index) {
              return EmployeeCard(employee: engineeringEmployees[index]);
            },
          ),
        );


      },
    );
  }
}

class marketingEmployees extends StatelessWidget {
  const marketingEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<deparController>(
      init: deparController(),
      builder: (controller) {
        final marketingEmployees =
            controller.depar
                .expand((dep) => dep.departments?.marketing?.employees ?? [])
                .toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            itemCount: marketingEmployees.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
            itemBuilder: (context, index) {
              return EmployeeCard(employee: marketingEmployees[index]);
            },
          ),
        );
      },
    );
  }
}

