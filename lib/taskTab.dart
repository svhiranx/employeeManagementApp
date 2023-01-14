import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/employeeDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    var empList = Provider.of<Employees>(context, listen: true).empList;
    return ListView.builder(
      itemCount: empList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.portrait_outlined),
          title: Text(empList[index].empName),
          trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade100),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmployeeDetailsScreen(),
                        settings: RouteSettings(arguments: index)));
              },
              child: Text("Add Task")),
        );
      },
    );
  }
}
