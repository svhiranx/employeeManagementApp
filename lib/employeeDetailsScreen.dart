import 'dart:math';

import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/editable_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const EmployeeDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final index = ModalRoute.of(context)!.settings.arguments as int;
    var employee =
        Provider.of<EmployeeProvider>(context, listen: true).empList[index];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(employee.name)),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  EditableTextField(title: employee.name),
                  EditableTextField(
                    title: employee.age.toString(),
                  ),
                  EditableTextField(
                    title: employee.salary.toString(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Wrap(children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  child: Text(
                    'TASK',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
