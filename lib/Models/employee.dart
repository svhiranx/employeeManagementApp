import 'package:employeemanagement/Models/task.dart';
import 'package:flutter/material.dart';

class Employee extends ChangeNotifier {
  String empName;
  String empPhone;
  String empMail;
  String empUserName;
  String empPassword;
  List<Task> _taskList = [];
  Employee(
      {required this.empName,
      required this.empPhone,
      required this.empMail,
      required this.empUserName,
      required this.empPassword});
  List<Task> get taskList {
    return [..._taskList];
  }
}

class Employees extends ChangeNotifier {
  final List<Employee> _empList = [];
  void addEmployee(Employee emp) {
    _empList.add(emp);
    notifyListeners();
  }

  List<Employee> get empList {
    return [..._empList];
  }

  void addTask(Task task, int index) {
    empList[index]._taskList.add(task);
    notifyListeners();
  }
}
