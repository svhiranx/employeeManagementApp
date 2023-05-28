import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatelessWidget {
  AddEmployee({super.key});
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController(),
        phoneCtrl = TextEditingController(),
        emailCtrl = TextEditingController(),
        userCtrl = TextEditingController(),
        pwdCtrl = TextEditingController();

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
                    CustomTextField(
                        fieldName: 'EMPLOYEE NAME',
                        textEditingController: nameCtrl,
                        icon: const Icon(Icons.portrait)),
                    CustomTextField(
                        fieldName: 'PHONE NUMBER',
                        textEditingController: phoneCtrl,
                        icon: const Icon(Icons.phone)),
                    CustomTextField(
                        fieldName: 'EMAIL ID',
                        textEditingController: emailCtrl,
                        icon: const Icon(Icons.mail)),
                    CustomTextField(
                        fieldName: 'EMPLOYEE USER NAME',
                        textEditingController: userCtrl,
                        icon: const Icon(Icons.supervised_user_circle)),
                    CustomTextField(
                        fieldName: 'EMPLOYEE PASSWORD',
                        textEditingController: pwdCtrl,
                        icon: const Icon(Icons.lock)),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (!_form.currentState!.validate()) return;

                  Employee employee = Employee(
                      id: 0,
                      name: nameCtrl.text,
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
