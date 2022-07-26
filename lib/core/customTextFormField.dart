import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomeTextFormField extends StatelessWidget {
  CustomeTextFormField({
    Key? key,
    @required this.hintText,
    @required this.suffixWidget,
  }) : super(key: key);
  final String? hintText;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
          suffix: suffixWidget,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          ))),
    );
  }
}
