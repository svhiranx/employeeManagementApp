
import 'package:employeemanagement/Models/employee.dart';
import 'package:employeemanagement/Widgets/employee_card.dart';
import 'package:employeemanagement/Widgets/error_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      final provider = Provider.of<EmployeeProvider>(context, listen: false);
      provider.fetchEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EmployeeProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade300,
        onPressed: () {
          Navigator.pushNamed(
            context,
            'addEmployee',
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Employee Management')),
      body: ErrorListener(
        child: RefreshIndicator(
          onRefresh: () => provider.fetchEmployees(),
          child: Center(
            child: provider.isLoading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: provider.empList.length,
                    itemBuilder: (itemContext, index) {
                      return EmployeeCard(
                          parentContext: context,
                          key: ValueKey(provider.empList[index].id),
                          index: index);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
