// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:formanimal/utility/app_constant.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.labelText,
    this.validator,
  }) : super(key: key);

final String? labelText;
final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        labelText: labelText,
        labelStyle: AppConstant().h3Style()
      ),
    );
  }
}
