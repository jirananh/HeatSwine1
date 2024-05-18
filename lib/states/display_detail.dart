// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:formanimal/models/case_animal_model.dart';

import 'package:formanimal/models/swine_code_model.dart';
import 'package:formanimal/utility/app_controller.dart';
import 'package:formanimal/utility/app_service.dart';
import 'package:formanimal/widgets/widget_button.dart';
import 'package:formanimal/widgets/widget_form.dart';
import 'package:formanimal/widgets/widget_text.dart';
import 'package:formanimal/widgets/widget_text_rich.dart';
import 'package:formanimal/widgets/wiget_icon_button.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class DisplayDetail extends StatefulWidget {
  const DisplayDetail({
    Key? key,
    required this.swineCodeModel,
  }) : super(key: key);

  final SwineCodeModel swineCodeModel;

  @override
  State<DisplayDetail> createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> {
  AppController appController = Get.put(AppController());
  final keyForm = GlobalKey<FormState>();

  var cases = <String>[];
  @override
  void initState() {
    super.initState();
    appController.display.value = false;

    if (appController.startTimes.isNotEmpty) {
      appController.startTimes.clear();
      appController.startTimes.add(DateTime.now());
    } else {
      appController.startTimes.add(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetTextRich(
            head: 'swinecode', value: widget.swineCodeModel.swinecode),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          key: keyForm,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              displayStartTime(context),
              const SizedBox(height: 8),
              WidgetTextRich(
                  head: 'อายุ', value: widget.swineCodeModel.birthdate),
              const SizedBox(height: 8),
              WidgetTextRich(
                  head: 'Farm', value: widget.swineCodeModel.farmfarmcode),
              const SizedBox(height: 8),
              WidgetForm(
                validator: (p0) {
                  if (p0?.isEmpty ?? true) {
                    return 'กรุณากรอก ข้อมูล ด้วยค่ะ';
                  } else {
                    return null;
                  }
                },
                labelText: 'คอก :',
              ),
              const SizedBox(height: 8),
              FutureBuilder(
                future: AppService().readCaseAnimal(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (appController.chooseCaseAnimals.isNotEmpty) {
                      appController.chooseCaseAnimals.clear();
                    }

                    List<CaseAnimalModel>? caseAnimals = snapshot.data;
                    for (var element in caseAnimals!) {
                      appController.chooseCaseAnimals.add(false);

                      cases.add(element.caseAnimal);
                    }

                    return Obx(
                      () {
                        print(
                            'chooseCaseAnimal ---> ${appController.chooseCaseAnimals.length}');
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.builder(
                              itemCount: caseAnimals.length,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => SizedBox(
                                width: Get.width * 0.8,
                                child: CheckboxListTile(
                                  value: appController.chooseCaseAnimals[index],
                                  onChanged: (value) {
                                    appController.chooseCaseAnimals[index] =
                                        value;
                                  },
                                  title: WidgetText(
                                      data: caseAnimals[index].caseAnimal),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                            ),
                            appController.display.value
                                ? const WidgetText(
                                    data:
                                        'กรุณากรอกข้อมูล อย่างน้อย 1 รายการค่ะ',
                                    style: TextStyle(color: GFColors.DANGER),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
      bottomSheet: WidgetButton(
        text: 'Finish',
        onPressed: () {
          appController.display.value = true;

          if (appController.chooseCaseAnimals.contains(true)) {
            appController.display.value = false;
          }

          if (keyForm.currentState!.validate()) {
            if (!appController.display.value) {
              //ข้อมูลพร้อม

              String swineCode = widget.swineCodeModel.swinecode;
              String farmfarmCode = widget.swineCodeModel.farmfarmcode;
              String age = widget.swineCodeModel.birthdate;
              var listCaseAnimals =
                  AppService().findListCaseAnimal(cases: cases);

              print('swineCode ---> $swineCode');
              print('farmfarmCode ---> $farmfarmCode');
              print('age ---> $age');
              print('listCaseAnimals ---> $listCaseAnimals');
            }
          }
        },
        fullWidthButton: true,
      ),
    );
  }

  Row displayStartTime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => appController.startTimes.isEmpty
            ? const SizedBox()
            : WidgetTextRich(
                head: 'วันที่ (Start Time)',
                value: AppService().changeTimeToSting(
                    datetime: appController.startTimes.last))),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WigetIconButton(
              icon: Icons.date_range,
              onPressed: () async {
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
                }
              },
            ),
            WigetIconButton(
              icon: Icons.watch,
              onPressed: () async {
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
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
