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

    await Dio().get(urlApi).then((value) async {
      // print('value ---. $value');

      for (var element in json.decode(value.data)) {
        SwineCodeModel swineCodeModel = SwineCodeModel.fromMap(element);
        appController.swineCodeModels.add(swineCodeModel);
      }
    });
  }

  Future<List<HeatDetactionModel>> readHeadDetaction(
      {required String swineCode}) async {
    var heatDetactionModels = <HeatDetactionModel>[];
    String urlApiGetHeatdetactionWhereSwineCodeJi =
        'https://www.androidthai.in.th/fluttertraining/ungdata/getHeatdetactionWhereSwineCodeJi.php?isAdd=true&swineCode=$swineCode';

    var result = await Dio().get(urlApiGetHeatdetactionWhereSwineCodeJi);

    if (result.toString() != 'null') {
      for (var element in json.decode(result.data)) {
        HeatDetactionModel heatDetactionModel =
            HeatDetactionModel.fromMap(element);
        heatDetactionModels.add(heatDetactionModel);
      }
    }
    return heatDetactionModels;
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

  Future<List<String>> chengeStringToArray({required String string}) async {
    String textString = string;
    textString = textString.substring(1, textString.length - 1);

    var result = textString.split(',');
    for (var i = 0; i < result.length; i++) {
      result[i] = result[i].trim();
    }

    return result;
  }
}
