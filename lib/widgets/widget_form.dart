// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:formanimal/utility/app_constant.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.labelText,
    this.hindText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  final String? labelText;
  final String? hindText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          hintText: hindText,
          prefixIcon: prefixIcon,
          filled: true,
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: AppConstant().h3Style()),
    );
  }
}
