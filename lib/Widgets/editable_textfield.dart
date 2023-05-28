import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  const EditableTextField(
      {super.key,
      required this.title,
      required this.textEditingController,
      required this.keyboardType});
  final String title;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  @override
  Widget build(BuildContext context) {
    bool _isEnable = false;
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: widget.textEditingController,
            enabled: _isEnable,
            keyboardType: widget.keyboardType,
            validator: (value) {
              if (value == null) {
                return '${widget.title} must not be empty!';
              }
              return null;
            },
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
