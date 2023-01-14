import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Models/task.dart';
import 'package:employeemanagement/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    int? taskno;
    TextEditingController dateCtrl = TextEditingController();
    TextEditingController detailsCtrl = TextEditingController();
    final index = ModalRoute.of(context)!.settings.arguments as int;

    final _form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('ADD TASK'),
        backgroundColor: Colors.white,
      ),
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
                      'Task Details',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                    CustomTextField(
                        fieldName: 'Task Title',
                        textEditingController: titleCtrl,
                        icon: Icon(Icons.noise_control_off_outlined)),
                    DropdownButtonFormField(
                      alignment: AlignmentDirectional.bottomStart,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            fontSize: 18),
                        hintText: 'TASK NO',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 60, 60)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.noise_control_off_outlined),
                        ),
                      ),
                      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                          .map<DropdownMenuItem<int>>((int val) {
                        return DropdownMenuItem<int>(
                            value: val, child: Text('$val'));
                      }).toList(),
                      onChanged: (value) {
                        taskno = value;
                      },
                    ),
                    CustomTextField(
                        fieldName: 'TASK COMPLETE DATE',
                        textEditingController: dateCtrl,
                        icon: Icon(Icons.noise_control_off_outlined)),
                    CustomTextField(
                        fieldName: 'TASK DETAILS',
                        textEditingController: detailsCtrl,
                        icon: Icon(Icons.noise_control_off_outlined)),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Task task = Task(
                      taskTitle: titleCtrl.text,
                      taskNo: taskno!,
                      completeDate: dateCtrl.text,
                      taskDetails: detailsCtrl.text);
                  Provider.of<Employees>(context, listen: false)
                      .addTask(task, index);
                  Navigator.pop(context);
                },
                child: Text('SAVE'))
          ],
        ),
      ),
    );
  }
}
