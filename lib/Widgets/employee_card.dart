import 'dart:developer';

import 'package:employeemanagement/Models/employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EmployeeProvider>(context);
    Employee employee = provider.empList[index];
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(employee.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.purple.shade100),
                      onPressed: () {
                        Navigator.pushNamed(context, 'editEmployee',
                            arguments: {index: index});
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.red.shade300),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: const Text("Are you sure?"),
                            content: Text("${employee.name} will be deleted"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    log(employee.id.toString());
                                    provider
                                        .delete(employee.id!)
                                        .then((success) {
                                      Navigator.pop(dialogContext);
                                    });
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                  },
                                  child: const Text('No'))
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            ]),
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  text: 'Age : ',
                ),
                TextSpan(text: ' ${employee.age}')
              ]),
            ),
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  text: 'Salary : ',
                ),
                TextSpan(text: ' ${employee.salary}')
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
