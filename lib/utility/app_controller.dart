import 'package:formanimal/models/swine_code_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AppController extends GetxController {
  RxList swineCodeModels = <SwineCodeModel>[].obs;

  RxInt amountLoad = 100.obs;

  RxList chooseCaseAnimals =  <bool>[].obs;

  RxBool display = false.obs;
}