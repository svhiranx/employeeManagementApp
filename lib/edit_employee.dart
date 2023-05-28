import 'package:employeemanagement/Widgets/custom_textfield.dart';
import 'package:employeemanagement/utils.dart';
import 'package:flutter/material.dart';
import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/editable_textfield.dart';

import 'package:provider/provider.dart';

class EditEmployee extends StatefulWidget {
  EditEmployee({super.key});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  bool isEnabled = false;
  final _form = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(),
      ageController = TextEditingController(),
      salaryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    Employee employee =
        Provider.of<EmployeeProvider>(context, listen: false).empList[index];
    nameController = TextEditingController(text: employee.name);
    ageController = TextEditingController(text: employee.age.toString());
    salaryController = TextEditingController(text: employee.salary.toString());
  }

  bool didChange = false;
  void checkDidChange(int index, String name, String age, String salary) {
    bool result;
    var emp =
        Provider.of<EmployeeProvider>(context, listen: false).empList[index];
    if (emp.name != nameController.text ||
        emp.age.toString() != ageController.text ||
        emp.salary.toString() != salaryController.text) {
      result = true;
    } else {
      result = false;
    }
    setState(() {
      didChange = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    var employee =
        Provider.of<EmployeeProvider>(context, listen: false).empList[index];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Edit Employee',
          )),
      body: Column(
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
                  CustomTextFormField(
                    title: 'Name',
                    onChange: () {
                      checkDidChange(index, nameController.text,
                          ageController.text, salaryController.text);
                    },
                    textEditingController: nameController,
                    keyboardType: TextInputType.name,
                  ),
                  CustomTextFormField(
                    title: 'Age',
                    onChange: () {
                      checkDidChange(index, nameController.text,
                          ageController.text, salaryController.text);
                    },
                    textEditingController: ageController,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormField(
                    title: 'Salary',
                    onChange: () {
                      checkDidChange(index, nameController.text,
                          ageController.text, salaryController.text);
                    },
                    textEditingController: salaryController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: !didChange
                  ? null
                  : () {
                      if (!_form.currentState!.validate()) return;
                      Utils(context).startLoading();
                      Employee emp = Employee(
                        id: employee.id,
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        salary: int.parse(salaryController.text),
                      );

                      Provider.of<EmployeeProvider>(context, listen: false)
                          .update(emp)
                          .then((value) {
                        Utils(context).stopLoading();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value ? 'Success' : 'Failed'),
                          backgroundColor: value ? Colors.green : Colors.red,
                        ));
                      });
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
              child: const Text('Update details'))
        ],
      ),
    );
  }
}
