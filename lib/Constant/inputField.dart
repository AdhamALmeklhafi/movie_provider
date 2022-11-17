// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Constant/Constant.dart';
import '../Constant/SizeConfig.dart';

class TextForm extends StatefulWidget {
  final String? labelText;
  final TextInputType? mykeyboardType;
  late final bool obsecureText;
  final IconData? icon;
  final TextEditingController? controller;
  final Function? validation;
  final Function? press;
  final String? hint;

  TextForm({
    super.key,
    this.labelText,
    this.mykeyboardType,
    required this.obsecureText,
    this.icon,
    this.controller,
    this.validation,
    this.press,
    this.hint,
  });

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: hintTextLo,
      controller: widget.controller,
      validator: widget.validation as String? Function(String?)?,
      obscureText: _passwordVisible ? false : widget.obsecureText,
      keyboardType: widget.mykeyboardType,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.labelText,
        labelStyle: primaryText,
        prefixIcon: Icon(
          widget.icon,
          color: Color(0xFFF09A36),
        ),
        suffixIcon: widget.obsecureText
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFFF09A36),
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFFF09A36),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}
