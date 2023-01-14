import 'package:employeemanagement/Models/employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeTab extends StatelessWidget {
  const EmployeeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var empList = Provider.of<Employees>(context, listen: true).empList;
    return ListView.builder(
      itemCount: empList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.portrait_outlined),
          title: Text(
            empList[index].empName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade100),
              onPressed: () {},
              child: Text("INVITE")),
        );
      },
    );
  }
}
