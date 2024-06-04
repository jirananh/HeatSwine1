// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:formanimal/models/case_animal_model.dart';

import 'package:formanimal/models/heat_detection_model.dart';
import 'package:formanimal/utility/app_controller.dart';
import 'package:formanimal/utility/app_dialog.dart';
import 'package:formanimal/utility/app_service.dart';
import 'package:formanimal/widgets/widget_button.dart';
import 'package:formanimal/widgets/widget_form.dart';
import 'package:formanimal/widgets/widget_text.dart';
import 'package:formanimal/widgets/widget_text_rich.dart';
import 'package:formanimal/widgets/wiget_icon_button.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class EditHeatDetaction extends StatefulWidget {
  const EditHeatDetaction({
    Key? key,
    required this.heatDetactionModel,
  }) : super(key: key);
  final HeatDetactionModel heatDetactionModel;

  @override
  State<EditHeatDetaction> createState() => _EditHeatDetactionState();
}

class _EditHeatDetactionState extends State<EditHeatDetaction> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    appController.displaySave.value = false;

    appController.heatDetactionModels.add(widget.heatDetactionModel);

    appController.displayStartTimes.add(widget.heatDetactionModel.startTime);
    appController.displayFinishTimes.add(widget.heatDetactionModel.finishTime);
    AppService().findChooseEditCaseAnimal(
        listCaseAnimals: widget.heatDetactionModel.listCaseAnimals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetTextRich(
            head: 'SwineCode', value: widget.heatDetactionModel.swineCode),
        actions: [
          Obx(() => appController.displaySave.value
              ? Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: WidgetButton(
                    text: 'Save',
                    onPressed: () {
                      var listCaseAnimals = <String>[];
                      for (var i = 0;
                          i < appController.chooseEditCaseAnimals.length;
                          i++) {
                        String string = '';

                        if (appController.chooseEditCaseAnimals[i]) {
                          string = appController.caseAnimal[i];
                        }

                        listCaseAnimals.add(string);
                      }

                      HeatDetactionModel model = HeatDetactionModel(
                          id: widget.heatDetactionModel.id,
                          swineCode: widget.heatDetactionModel.swineCode,
                          farmFarmCode: widget.heatDetactionModel.farmFarmCode,
                          age: widget.heatDetactionModel.age,
                          listCaseAnimals: listCaseAnimals.toString(),
                          startTime: appController.displayStartTimes.last,
                          finishTime: appController.displayFinishTimes.last,
                          recorder: widget.heatDetactionModel.recorder,
                          inspector: widget.heatDetactionModel.inspector,
                          weight: appController.heatDetactionModels.last.weight,
                          breastLeft:
                              appController.heatDetactionModels.last.breastLeft,
                          breastRight: appController
                              .heatDetactionModels.last.breastRight,
                          pen: appController.heatDetactionModels.last.pen);

                      AppService()
                          .processEditHeatDacTion(heatDetactionModel: model);
                    },
                  ),
                )
              : const SizedBox())
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          startTimeDisplay(),
          const SizedBox(height: 4),
          finishTimeDisplay(),
          const SizedBox(height: 4),
          penDisplay(),
          const SizedBox(height: 4),
          weightDisplay(),
          const SizedBox(height: 4),
          breastLeftDisplay(),
          const SizedBox(height: 4),
          breastRightDisplay(),
          const SizedBox(height: 16),
          FutureBuilder(
            future: AppService().readCaseAnimal(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CaseAnimalModel> caseAnimalModels = snapshot.data!;

                return Obx(() => appController.chooseEditCaseAnimals.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: caseAnimalModels.length,
                        itemBuilder: (context, index) => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: WidgetText(
                              data: caseAnimalModels[index].caseAnimal),
                          value: appController.chooseEditCaseAnimals[index],
                          onChanged: (value) {
                            appController.displaySave.value = true;
                            appController.chooseEditCaseAnimals[index] = value;
                          },
                        ),
                      )
                    : const SizedBox());
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Row startTimeDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => WidgetTextRich(
            head: 'StartTime', value: appController.displayStartTimes.last)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetIconButton(
              icon: Icons.date_range,
              onPressed: () async {
                appController.displaySave.value = true;

                var chooseDateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime(appController.startTimes.last.year - 1),
                  lastDate: DateTime.now(),
                  initialDate: appController.startTimes.last,
                );

                if (chooseDateTime != null) {
                  var result = DateTime(
                      chooseDateTime.year,
                      chooseDateTime.month,
                      chooseDateTime.day,
                      appController.startTimes.last.hour,
                      appController.startTimes.last.minute);

                  appController.startTimes.add(result);

                  String string =
                      AppService().changeTimeToSting(datetime: result);
                  appController.displayStartTimes.add(string);
                }
              },
              type: GFButtonType.outline2x,
            ),
            const SizedBox(width: 4),
            WidgetIconButton(
              icon: Icons.watch,
              onPressed: () async {
                appController.displaySave.value = true;

                TimeOfDay timeOfDay = TimeOfDay(
                    hour: appController.startTimes.last.hour,
                    minute: appController.startTimes.last.minute);

                var timePicker = await showTimePicker(
                    context: context, initialTime: timeOfDay);

                if (timePicker != null) {
                  DateTime newDateTime = DateTime(
                    appController.startTimes.last.year,
                    appController.startTimes.last.month,
                    appController.startTimes.last.day,
                    timePicker.hour,
                    timePicker.minute,
                  );

                  appController.startTimes.add(newDateTime);

                  String string =
                      AppService().changeTimeToSting(datetime: newDateTime);
                  appController.displayStartTimes.add(string);
                }
              },
              type: GFButtonType.outline2x,
            ),
          ],
        ),
      ],
    );
  }

  Row finishTimeDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => WidgetTextRich(
            head: 'FinishTime', value: appController.displayFinishTimes.last)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetIconButton(
              icon: Icons.date_range,
              onPressed: () async {
                appController.displaySave.value = true;

                var chooseDateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime(appController.startTimes.last.year - 1),
                  lastDate: DateTime.now(),
                  initialDate: appController.startTimes.last,
                );

                if (chooseDateTime != null) {
                  var result = DateTime(
                      chooseDateTime.year,
                      chooseDateTime.month,
                      chooseDateTime.day,
                      appController.startTimes.last.hour,
                      appController.startTimes.last.minute);

                  // appController.startTimes.add(result);

                  String string =
                      AppService().changeTimeToSting(datetime: result);
                  appController.displayFinishTimes.add(string);
                }
              },
              type: GFButtonType.outline2x,
            ),
            const SizedBox(width: 4),
            WidgetIconButton(
              icon: Icons.watch,
              onPressed: () async {
                appController.displaySave.value = true;

                TimeOfDay timeOfDay = TimeOfDay(
                    hour: appController.startTimes.last.hour,
                    minute: appController.startTimes.last.minute);

                var timePicker = await showTimePicker(
                    context: context, initialTime: timeOfDay);

                if (timePicker != null) {
                  DateTime newDateTime = DateTime(
                    appController.startTimes.last.year,
                    appController.startTimes.last.month,
                    appController.startTimes.last.day,
                    timePicker.hour,
                    timePicker.minute,
                  );

                  // appController.startTimes.add(newDateTime);

                  String string =
                      AppService().changeTimeToSting(datetime: newDateTime);
                  appController.displayFinishTimes.add(string);
                }
              },
              type: GFButtonType.outline2x,
            ),
          ],
        ),
      ],
    );
  }

  Row breastRightDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => WidgetTextRich(
            head: 'เต้านมขวา',
            value: appController.heatDetactionModels.last.breastRight)),
        WidgetIconButton(
          icon: Icons.edit,
          onPressed: () {
            TextEditingController textEditingController =
                TextEditingController();
            textEditingController.text = widget.heatDetactionModel.breastRight;

            AppDialog().normalDialog(
                title: 'Edit เต้านมขวา',
                content: WidgetForm(
                  controller: textEditingController,
                  labelText: 'เต้านมขวา',
                ),
                firstAction: WidgetButton(
                  text: 'Edit',
                  onPressed: () {
                    appController.displaySave.value = true;

                    Map<String, dynamic> map =
                        appController.heatDetactionModels.last.toMap();
                    map['breastRight'] = textEditingController.text;

                    HeatDetactionModel model = HeatDetactionModel.fromMap(map);

                    appController.heatDetactionModels.add(model);

                    Get.back();
                  },
                ));
          },
          type: GFButtonType.outline2x,
        ),
      ],
    );
  }

  Row breastLeftDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => WidgetTextRich(
            head: 'เต้านมซ้าย',
            value: appController.heatDetactionModels.last.breastLeft)),
        WidgetIconButton(
          icon: Icons.edit,
          onPressed: () {
            TextEditingController textEditingController =
                TextEditingController();
            textEditingController.text = widget.heatDetactionModel.breastLeft;

            AppDialog().normalDialog(
                title: 'Edit เต้านมซ้าย',
                content: WidgetForm(
                  controller: textEditingController,
                  labelText: 'เต้านมซ้าย',
                ),
                firstAction: WidgetButton(
                  text: 'Edit',
                  onPressed: () {
                    appController.displaySave.value = true;

                    Map<String, dynamic> map =
                        appController.heatDetactionModels.last.toMap();
                    map['breastLeft'] = textEditingController.text;

                    HeatDetactionModel model = HeatDetactionModel.fromMap(map);

                    appController.heatDetactionModels.add(model);

                    Get.back();
                  },
                ));
          },
          type: GFButtonType.outline2x,
        ),
      ],
    );
  }

  Row weightDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => WidgetTextRich(
            head: 'น้ำหนัก',
            value: appController.heatDetactionModels.last.weight)),
        WidgetIconButton(
          icon: Icons.edit,
          onPressed: () {
            TextEditingController textEditingController =
                TextEditingController();
            textEditingController.text = widget.heatDetactionModel.weight;

            AppDialog().normalDialog(
                title: 'Edit weight',
                content: WidgetForm(
                  controller: textEditingController,
                  labelText: 'weight',
                ),
                firstAction: WidgetButton(
                  text: 'Edit',
                  onPressed: () {
                    appController.displaySave.value = true;

                    Map<String, dynamic> map =
                        appController.heatDetactionModels.last.toMap();
                    map['weight'] = textEditingController.text;

                    HeatDetactionModel model = HeatDetactionModel.fromMap(map);

                    appController.heatDetactionModels.add(model);

                    Get.back();
                  },
                ));
          },
          type: GFButtonType.outline2x,
        ),
      ],
    );
  }

  Widget penDisplay() {
    return Obx(() => appController.heatDetactionModels.isEmpty
        ? const SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetTextRich(
                  head: 'คอก',
                  value: appController.heatDetactionModels.last.pen),
              WidgetIconButton(
                icon: Icons.edit,
                onPressed: () {
                  TextEditingController textEditingController =
                      TextEditingController();
                  textEditingController.text =
                      appController.heatDetactionModels.last.pen;

                  AppDialog().normalDialog(
                      title: 'Edit คอก',
                      content: WidgetForm(
                        controller: textEditingController,
                        labelText: 'คอก',
                      ),
                      firstAction: WidgetButton(
                        text: 'Edit',
                        onPressed: () {
                          appController.displaySave.value = true;

                          Map<String, dynamic> map =
                              appController.heatDetactionModels.last.toMap();
                          map['pen'] = textEditingController.text;

                          HeatDetactionModel model =
                              HeatDetactionModel.fromMap(map);

                          appController.heatDetactionModels.add(model);

                          Get.back();
                        },
                      ));
                },
                type: GFButtonType.outline2x,
              ),
            ],
          ));
  }
}
