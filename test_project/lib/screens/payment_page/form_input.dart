import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final List<TextInputFormatter>? textFormatters;
  final Icon? icon;
  final String? hint;
  final validator;

  FormInputField({
    required this.controller,
    required this.validator,
    this.inputType = TextInputType.number,
    this.hint = '',
    this.textFormatters,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          icon != null
              ? Expanded(flex: 1, child: icon!)
              : Expanded(
                  flex: 0,
                  child: Container(),
                ),
          Expanded(
            flex: 9,
            child: TextFormField(
              controller: controller,
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
              keyboardType: inputType,
              inputFormatters: textFormatters,
              validator: validator,
              decoration: InputDecoration(
                  errorStyle: TextStyle(height: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(),
                  ),
                  hintText: hint,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
