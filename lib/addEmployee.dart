import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/custom_textfield.dart';
import 'package:employeemanagement/Widgets/editable_textfield.dart';
import 'package:employeemanagement/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatelessWidget {
  AddEmployee({super.key});
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
            backgroundColor: Colors.white,
            title: const Text(
              'Add Employee',
            )),
        body: Stack(
          children: [
            Column(
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
                          'Enter Employee Details',
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        )),
                        CustomTextFormField(
                            title: 'Name',
                            onChange: () {},
                            textEditingController: nameController,
                            keyboardType: TextInputType.name),
                        CustomTextFormField(
                          title: 'Age',
                          onChange: () {},
                          textEditingController: ageController,
                          keyboardType: TextInputType.number,
                        ),
                        CustomTextFormField(
                          title: 'Salary',
                          onChange: () {},
                          textEditingController: salaryController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (!_form.currentState!.validate()) return;

                      Employee employee = Employee(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        salary: int.parse(salaryController.text),
                      );
                      Utils(context).startLoading();
                      Provider.of<EmployeeProvider>(context, listen: false)
                          .create(employee)
                          .then((value) {
                        Utils(context).stopLoading();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value ? 'Success' : 'Failed'),
                          backgroundColor: value ? Colors.green : Colors.red,
                        ));
                      });
                    },
                    child: const Text('ADD EMPLOYEE'))
              ],
            ),
          ],
        ));
  }
}
