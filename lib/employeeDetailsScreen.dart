import 'dart:math';

import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/addTaskScreen.dart';
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
    var employee = Provider.of<Employees>(context, listen: true).empList[index];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(employee.empName)),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.portrait_outlined),
                    title: Text(employee.empName),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(employee.empPhone),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(employee.empMail),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              settings: RouteSettings(arguments: index),
                              builder: ((context) => AddTaskScreen())))),
                      child: Text(
                        '+ADD TASK',
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 5.0, // shadow blur
                                color: Colors.black38, // shadow color
                                offset: Offset(
                                    2.0, 2.0), // how much shadow will be shown
                              ),
                            ],
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                )),
            Divider(thickness: 5),
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
                ...employee.taskList.map((e) => Card(
                      color: Colors.amber,
                      child: ListTile(
                        leading: Row(mainAxisSize: MainAxisSize.min, children: [
                          e.isComplete ? Icon(Icons.check) : Container(),
                          Text(
                            'Task - ${e.taskNo}',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0, // shadow blur
                                    color: Colors.black38, // shadow color
                                    offset: Offset(2.0,
                                        2.0), // how much shadow will be shown
                                  ),
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ]),
                        trailing: Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ]),
            )
          ],
        ));
  }
}
