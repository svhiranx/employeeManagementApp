import 'dart:developer';
import 'package:employeemanagement/Utils/api_service.dart';
import 'package:flutter/material.dart';

class Employee {
  int? id;
  String name;
  int salary;
  int age;
  String? profileImageUrl;
  Employee(
      {this.id,
      required this.name,
      required this.salary,
      required this.age,
      this.profileImageUrl});
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        name: json['employee_name'],
        salary: json['employee_salary'],
        age: json['employee_age'],
        profileImageUrl: json['profile_image']);
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'salary': salary.toString(),
      ' age': age.toString(),
    };
  }
}

class EmployeeProvider with ChangeNotifier {
  List<Employee> _empList = [];

  bool isLoading = false;
  bool dialogIsLoading = false;
  String? error;

  Future fetchEmployees() async {
    log('fetch start');
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> response = await ApiService().getEmployees();
    if (!response['success']) {
      error = response['error'];
      log(response['error']);
    } else {
      if (_empList.isNotEmpty) {
        _empList = [];
      }
      for (var data in (response['data'] as List)) {
        _empList.insert(
          0,
          Employee.fromJson(data),
        );
      }
      log(_empList.first.name);
    }

    isLoading = false;
    notifyListeners();
    return;
  }

  Future<bool> create(Employee employee) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> response =
        await ApiService().createEmployee(employee.toJson());

    if (!response['success']) {
      error = response['error'];
      log(response['error']);
    } else {
      _empList.insert(0, employee);
    }
    notifyListeners();
    isLoading = false;
    return response['success'];
  }

  Future<bool> update(Employee employee) async {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> response = await ApiService()
        .updateEmployee(employee.id.toString(), employee.toJson());

    if (!response['success']) {
      error = response['error'];
      log(response['error']);
    } else {
      int index = _empList.indexWhere((element) => employee.id == element.id);
      _empList[index] = employee;
    }
    notifyListeners();
    isLoading = false;
    return response['success'];
  }

  Future<bool> delete(int id) async {
    dialogIsLoading = true;
    notifyListeners();
    Map<String, dynamic> response = await ApiService().deleteEmployee(id);
    if (!response['success']) {
      error = response['error'];
      log(response['error']);
    } else {
      _empList.removeWhere((element) => element.id == id);
    }
    dialogIsLoading = false;
    notifyListeners();
    return response['success'];
  }

  List<Employee> get empList {
    return [..._empList];
  }
}
