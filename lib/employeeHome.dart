import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/addEmployee.dart';
import 'package:employeemanagement/employeeDetailsScreen.dart';
import 'package:employeemanagement/employeeTab.dart';
import 'package:employeemanagement/taskTab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/image.png'),
              ),
            ),
            Icon(Icons.search),
            Expanded(
              child: TextField(),
            )
          ]),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                )),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Call the CEO"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Add Employee"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Payment"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => AddEmployee()))),
                      child: Text(
                        "+ ADD EMPLOYEE",
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 5.0, // shadow blur
                                color: Colors.black38, // shadow color
                                offset: Offset(
                                    2.0, 2.0), // how much shadow will be shown
                              ),
                            ],
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ),
              ),
              TabBar(
                tabs: const [
                  Tab(
                    text: "Employees",
                  ),
                  Tab(text: "Tasks")
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
              ),
              Expanded(
                  child: TabBarView(
                      controller: _tabController,
                      children: [EmployeeTab(), TaskTab()]))
            ],
          ),
        ));
  }
}
