import 'package:employeemanagement/Models/employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorListener extends StatelessWidget {
  final Widget child;

  const ErrorListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeProvider>(
      builder: (context, model, c) {
        if (model.error != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _handleError(context, model);
          });
        }

        return child;
      },
    );
  }

  void _handleError(BuildContext context, EmployeeProvider model) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[600],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.error),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(model.error!))),
            ],
          ),
        ),
      );

    model.error = null;
  }
}
