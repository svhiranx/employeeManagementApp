import 'package:flutter/material.dart';
import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/editable_textfield.dart';

import 'package:provider/provider.dart';

class EditEmployee extends StatelessWidget {
  EditEmployee({super.key});
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(),
        ageController = TextEditingController(),
        salaryController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'ADD EMPLOYEE',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Form(
                key: _form,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      'Employee Details',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    )),
                    EditableTextField(
                      title: 'Name',
                      textEditingController: nameController,
                      keyboardType: TextInputType.name,
                    ),
                    EditableTextField(
                      title: 'Age',
                      textEditingController: ageController,
                      keyboardType: TextInputType.number,
                    ),
                    EditableTextField(
                      title: 'Salary',
                      textEditingController: salaryController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (!_form.currentState!.validate()) return;

                  Employee employee = Employee(
                      name: nameController.text,
                      age: 0,
                      salary: 0,
                      profileImageUrl: '');

                  print(Provider.of<EmployeeProvider>(context, listen: false)
                      .empList
                      .length);
                  Navigator.pop(context);
                },
                child: const Text('ADD EMPLOYEE'))
          ],
        ),
      ),
    );
  }
}
