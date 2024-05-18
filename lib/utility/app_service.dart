import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:formanimal/models/case_animal_model.dart';
import 'package:formanimal/models/heat_detection_model.dart';
import 'package:formanimal/models/swine_code_model.dart';
import 'package:formanimal/utility/app_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppService {
  AppController appController = Get.put(AppController());

  String changeTimeToSting({required DateTime datetime}) {
    DateFormat dateFormat = DateFormat('yy-MM-dd HH:mm');
    String result = dateFormat.format(datetime);
    return result;
  }

  Future<void> readSwineCode() async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/ungdata/getSwineCode.php';

    await Dio().get(urlApi).then((value) {
      // print('value ---. $value');

      for (var element in json.decode(value.data)) {
        SwineCodeModel swineCodeModel = SwineCodeModel.fromMap(element);
        appController.swineCodeModels.add(swineCodeModel);
      }
    });
  }

  Future<List<CaseAnimalModel>> readCaseAnimal() async {
    var caseAnimals = <CaseAnimalModel>[];
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/ungdata/getCaseAnimalJi.php';
    var result = await Dio().get(urlApi);
    for (var element in json.decode(result.data)) {
      CaseAnimalModel model = CaseAnimalModel.fromMap(element);
      caseAnimals.add(model);
    }

    return caseAnimals;
  }

  List<String> findListCaseAnimal({required List<String> cases}) {
    var result = <String>[];

    for (var i = 0; i < cases.length; i++) {
      if (appController.chooseCaseAnimals[i]) {
        result.add(cases[i]);
      }
    }
    return result;
  }

  Future<void> processInsertHeatDetaction(
      {required HeatDetactionModel heatDetactionModel}) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/ungdata/insertHeatDetactionJi.php?isAdd=true&swineCode=${heatDetactionModel.swineCode}&farmFarmCode=${heatDetactionModel.farmFarmCode}&age=${heatDetactionModel.age}&listCaseAnimals=${heatDetactionModel.listCaseAnimals}&startTime=${heatDetactionModel.startTime}&finishTime=${heatDetactionModel.finishTime}&recorder=${heatDetactionModel.recorder}&inspector=${heatDetactionModel.inspector}&weight=${heatDetactionModel.wight}&breastLeft=${heatDetactionModel.breastLeft}&breastRight=${heatDetactionModel.brestRight}&pen=${heatDetactionModel.pen}';

    await Dio().get(urlApi).then((value) => Get.back());
  }
}
