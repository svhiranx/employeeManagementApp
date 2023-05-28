import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Screens/add_employee.dart';
import 'package:employeemanagement/Screens/edit_employee.dart';
import 'package:employeemanagement/Screens/employee_home.dart';
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
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
      ],
      builder: (context, child) => MaterialApp(
        routes: {
          '/': (context) => const EmployeeHome(),
          'addEmployee': (context) => AddEmployee(),
          'editEmployee': (context) => const EditEmployee()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.amber,
        ),
      ),
    );
  }
}
