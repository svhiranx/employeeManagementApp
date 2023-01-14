import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/employeeHome.dart';
import 'package:employeemanagement/employeeTab.dart';
import 'package:employeemanagement/taskTab.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Employees()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: const EmployeeHome()),
    );
  }
}
