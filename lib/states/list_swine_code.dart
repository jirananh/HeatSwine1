import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:formanimal/states/display_detail.dart';
import 'package:formanimal/utility/app_constant.dart';
import 'package:formanimal/utility/app_controller.dart';
import 'package:formanimal/utility/app_service.dart';
import 'package:formanimal/widgets/widget_text.dart';
import 'package:formanimal/widgets/widget_text_rich.dart';
import 'package:get/get.dart';

class ListSwineCode extends StatefulWidget {
  const ListSwineCode({
    super.key,
  });

  @override
  State<ListSwineCode> createState() => _ListSwineCodeState();
}

class _ListSwineCodeState extends State<ListSwineCode> {
  AppController appController = Get.put(AppController());

  EasyRefreshController? easyRefreshController;

  @override
  void initState() {
    super.initState();

    easyRefreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    AppService().readSwineCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => ((appController.swineCodeModels.isEmpty))
              ? const SizedBox()
              : EasyRefresh(
                  controller: easyRefreshController,
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 3)).then((value) {
                      AppService().readSwineCode();
                      easyRefreshController!.finishRefresh();
                    });
                  },
                  onLoad: () async {
                    await Future.delayed(Duration(seconds: 3)).then((value) {
                      appController.amountLoad.value =
                          appController.amountLoad.value + 100;
                      easyRefreshController!.finishLoad();
                    });
                  },
                  child: ListView.builder(
                    itemCount: appController.amountLoad.value,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.to(DisplayDetail(
                          swineCodeModel: appController.swineCodeModels[index],
                        ))?.then((value) {
                          setState(() {});
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        decoration: AppConstant().curebox(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  data: appController
                                      .swineCodeModels[index].swinecode,
                                  style: AppConstant().h2Style(),
                                ),
                                FutureBuilder(
                                  future: AppService().readHeadDetaction(
                                      swineCode: appController
                                          .swineCodeModels[index].swinecode),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Icon(Icons.check_box);
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                              ],
                            ),
                            WidgetTextRich(
                              head: 'OfficeCode',
                              value: appController
                                  .swineCodeModels[index].officeofficecode,
                            ),
                            WidgetTextRich(
                              head: 'farmfarmcode',
                              value: appController
                                  .swineCodeModels[index].farmfarmcode,
                            ),
                            WidgetTextRich(
                              head: 'gendergendercode',
                              value: appController
                                  .swineCodeModels[index].gendergendercode,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))),
    );
  }
}
