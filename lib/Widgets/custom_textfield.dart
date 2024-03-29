import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.onChange,
      required this.textEditingController,
      required this.keyboardType});
  final String title;
  final Function onChange;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChange(),
      decoration: InputDecoration(hintText: title),
      controller: textEditingController,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return '$title must not be empty!';
        }
        return null;
      },
    );
  }
}
