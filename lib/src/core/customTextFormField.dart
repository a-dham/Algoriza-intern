import 'package:flutter/material.dart';
import 'package:task_1/src/core/utils/app_colors.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    Key? key,
    @required this.hintText,
    @required this.suffixWidget,
    @required this.prefixWidget,
    required this.textEditingController,
    @required this.keyboardType,
    @required this.onTap,
    @required this.validator,
  }) : super(key: key);
  final String? hintText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextEditingController? textEditingController;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      onTap: onTap,
      controller: textEditingController,
      decoration: InputDecoration(
        prefix: prefixWidget,
        hintText: hintText,
        suffixIcon: suffixWidget,
        filled: true,
        fillColor: AppColors.kGreyColor.withOpacity(0.08),
        hintStyle: const TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.kBlackColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
