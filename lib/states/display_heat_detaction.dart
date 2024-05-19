// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:formanimal/models/heat_detection_model.dart';
import 'package:formanimal/models/swine_code_model.dart';
import 'package:formanimal/utility/app_constant.dart';
import 'package:formanimal/utility/app_dialog.dart';
import 'package:formanimal/utility/app_service.dart';
import 'package:formanimal/widgets/widget_button.dart';
import 'package:formanimal/widgets/widget_text.dart';
import 'package:formanimal/widgets/widget_text_rich.dart';
import 'package:formanimal/widgets/wiget_icon_button.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class DisplayHeatDetaction extends StatefulWidget {
  const DisplayHeatDetaction({
    Key? key,
    required this.swineCodeModel,
    required this.heatDeactionModels,
  }) : super(key: key);

  final SwineCodeModel swineCodeModel;
  final List<HeatDetactionModel> heatDeactionModels;

  @override
  State<DisplayHeatDetaction> createState() => _DisplayHeatDetactionState();
}

class _DisplayHeatDetactionState extends State<DisplayHeatDetaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetTextRich(
            head: 'swineCode', value: widget.swineCodeModel.swinecode),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: .8),
            child: WidgetText(
              data: 'ข้อมูลทั่วไป :',
              style: AppConstant().h2Style(size: 16),
            ),
          ),
          WidgetTextRich(
              head: 'farmfarmcode', value: widget.swineCodeModel.farmfarmcode),
          WidgetTextRich(
              head: 'officeofficecode',
              value: widget.swineCodeModel.farmfarmcode),
          WidgetTextRich(
              head: 'branchbranchcode',
              value: widget.swineCodeModel.farmfarmcode),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: .8),
            child: WidgetText(
              data: 'HeatDetaction :',
              style: AppConstant().h2Style(size: 16),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.heatDeactionModels.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: AppConstant().curebox(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetTextRich(
                          head: 'id',
                          value: widget.heatDeactionModels[index].id!),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          WidgetIconButton(
                            icon: Icons.edit,
                            onPressed: () {},
                            type: GFButtonType.outline2x,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          WidgetIconButton(
                            icon: Icons.delete_forever,
                            onPressed: () {
                              AppDialog().normalDialog(
                                  title: 'ยืนยันการลบ',
                                  content: WidgetText(
                                      data:
                                          'โปรดยันยันการลบ = ${widget.heatDeactionModels[index].id}'),
                                  firstAction: WidgetButton(
                                    text: 'Confirm',
                                    onPressed: () {
                                      AppService()
                                          .processDeleteHeatDetactionById(
                                              id: widget
                                                  .heatDeactionModels[index]
                                                  .id!)
                                          .then((value) {
                                        Get.back();
                                        widget.heatDeactionModels
                                            .removeAt(index);

                                        if (widget.heatDeactionModels.isEmpty) {
                                          Get.back();
                                        } else {
                                          setState(() {});
                                        }
                                      });
                                    },
                                    type: GFButtonType.outline2x,
                                  ));
                            },
                            color: Colors.red,
                            type: GFButtonType.solid,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetTextRich(
                          head: 'Start',
                          value: widget.heatDeactionModels[index].startTime),
                      WidgetTextRich(
                          head: 'Finish',
                          value: widget.heatDeactionModels[index].startTime),
                    ],
                  ),
                  WidgetTextRich(
                      head: 'คอก', value: widget.heatDeactionModels[index].pen),
                  WidgetTextRich(
                      head: 'น้ำหนัก',
                      value: widget.heatDeactionModels[index].wight),
                  WidgetTextRich(
                      head: 'เต้านมซ้าย',
                      value: widget.heatDeactionModels[index].breastLeft),
                  WidgetTextRich(
                      head: 'เต้านมขวา',
                      value: widget.heatDeactionModels[index].brestRight),
                  WidgetText(
                    data: 'Case :',
                    style: AppConstant().h2Style(size: 15),
                  ),

                  FutureBuilder(
                    future: AppService().chengeStringToArray(
                        string:
                            widget.heatDeactionModels[index].listCaseAnimals),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index2) => Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: WidgetText(data: snapshot.data![index2]),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const ScrollPhysics(),
                  //   itemCount: heatDeactionModels[index].listCaseAnimals.length,
                  //   itemBuilder: (context, index2) => WidgetText(data: 'data'),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
