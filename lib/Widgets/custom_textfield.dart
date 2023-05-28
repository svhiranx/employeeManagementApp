import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.textEditingController,
      required this.keyboardType});
  final String title;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: title),
      controller: textEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return '$title must not be empty!';
        }
        return null;
      },
    );
  }
}
