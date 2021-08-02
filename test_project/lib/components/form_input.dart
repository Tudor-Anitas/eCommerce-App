import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final List<TextInputFormatter>? textFormatters;
  final Icon? icon;
  final String? hint;
  final bool? obscureText;
  final validator;

  FormInputField({
    required this.controller,
    required this.validator,
    this.inputType = TextInputType.text,
    this.hint = '',
    this.textFormatters,
    this.obscureText = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: controller,
        style:
            TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        obscureText: obscureText!,
        inputFormatters: textFormatters,
        validator: validator,
        decoration: InputDecoration(
            prefixIcon: icon,
            
            errorStyle: TextStyle(height: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(),
              
            ),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 20)),
      ),
    );
  }
}
