import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:formanimal/models/swine_code_model.dart';
import 'package:formanimal/utility/app_controller.dart';
import 'package:get/get.dart';

class AppService  {
  AppController appController =Get.put(AppController());

  Future<void> readSwineCode() async {

String urlApi = 'https://www.androidthai.in.th/fluttertraining/ungdata/getSwineCode.php';

await Dio().get(urlApi).then((value) {
  
  // print('value ---. $value');

  for (var element in json.decode(value.data)) {
    SwineCodeModel swineCodeModel = SwineCodeModel.fromMap(element);
    appController.swineCodeModels.add(swineCodeModel);
  }
});

  }
  
}