import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          title: Text(
            'ADD EMPLOYEE',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _form,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'Employee Details',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    )),
                    CustomTextField(
                        fieldName: 'EMPLOYEE NAME',
                        textEditingController: nameCtrl,
                        icon: Icon(Icons.portrait)),
                    CustomTextField(
                        fieldName: 'PHONE NUMBER',
                        textEditingController: phoneCtrl,
                        icon: Icon(Icons.phone)),
                    CustomTextField(
                        fieldName: 'EMAIL ID',
                        textEditingController: emailCtrl,
                        icon: Icon(Icons.mail)),
                    CustomTextField(
                        fieldName: 'EMPLOYEE USER NAME',
                        textEditingController: userCtrl,
                        icon: Icon(Icons.supervised_user_circle)),
                    CustomTextField(
                        fieldName: 'EMPLOYEE PASSWORD',
                        textEditingController: pwdCtrl,
                        icon: Icon(Icons.lock)),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (!_form.currentState!.validate()) return;

                  Employee employee = Employee(
                      empMail: emailCtrl.text,
                      empName: nameCtrl.text,
                      empPassword: pwdCtrl.text,
                      empPhone: phoneCtrl.text,
                      empUserName: userCtrl.text);
                  Provider.of<Employees>(context, listen: false)
                      .addEmployee(employee);
                  print(Provider.of<Employees>(context, listen: false)
                      .empList
                      .length);
                  Navigator.pop(context);
                },
                child: Text('ADD EMPLOYEE'))
          ],
        ),
      ),
    );
  }
}
