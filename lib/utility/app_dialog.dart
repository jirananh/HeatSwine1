import 'package:flutter/material.dart';
import 'package:formanimal/widgets/widget_button.dart';
import 'package:formanimal/widgets/widget_text.dart';
import 'package:get/get.dart';

class AppDialog {
  void normalDialog({
    required String title,
    Widget? content,
    Widget? firstAction,
  }) {
    Get.dialog(AlertDialog(
      title: WidgetText(data: title),
      content: content,
      actions: [
        firstAction ?? const SizedBox(),
        WidgetButton(
          text: firstAction == null ? 'OK' : 'Cancel',
          onPressed: () => Get.back(),
        )
      ],
    ));
  }
}
