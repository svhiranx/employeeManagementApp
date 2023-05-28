import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  const EditableTextField({super.key, required this.title});
  final String title;
  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: "Festive Leave");
    bool _isEnable = false;
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: TextField(
            controller: _controller,
            enabled: _isEnable,
          ),
        ),
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEnable = true;
              });
            })
      ],
    );
  }
}
