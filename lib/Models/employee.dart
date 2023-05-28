import 'dart:convert';
import 'dart:developer';

import 'package:employeemanagement/api_service.dart';
import 'package:flutter/material.dart';

class Employee {
  int id;
  String name;
  int salary;
  int age;
  String profileImageUrl;
  Employee(
      {required this.id,
      required this.name,
      required this.salary,
      required this.age,
      required this.profileImageUrl});
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
      'id': id,
      'employee_name': name,
      'employee_salary': salary,
      'employee_age': age,
      'profile_image': profileImageUrl
    };
  }
}

class EmployeeProvider with ChangeNotifier {
  final List<Employee> _empList = [];

  bool isLoading = false;
  String? error;

  void fetchEmployees() async {
    if (_empList.isNotEmpty) return;
    log('fetch start');
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> response = await ApiService().getEmployees();
    if (!response['success']) {
      error = response['error'];
      log(response['error']);
      return;
    } else {
      for (var data in (response['data'] as List)) {
        _empList.add(
          Employee.fromJson(data),
        );
      }
      log(_empList.first.name);
    }

    isLoading = false;
    notifyListeners();
  }

  void delete(int id) async {
    Map<String, dynamic> response = await ApiService().deleteEmployee(id);
    if (!response['success']) {
      error = response['error'];
      log(response['error']);
    } else {
      _empList.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }

  List<Employee> get empList {
    return [..._empList];
  }
}
