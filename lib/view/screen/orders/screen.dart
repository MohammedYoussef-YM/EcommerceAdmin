import 'dart:io';

import 'package:admin/controller/orders/screen_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widget/home/custombuttomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ScreenControllerImp());
    return GetBuilder<ScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(title:const Text("Orders")),
              bottomNavigationBar: const CustomButtomAppBarHome(),
              body: WillPopScope(
                child: controller.listPage.elementAt(controller.currentPage),
                onWillPop: (){
                  Get.defaultDialog(
                    title: "Warring",
                    titleStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColor.primaryColor),
                    middleText: "Do You Want To Exit The app",
                    onConfirm: (){
                      exit(0);
                    },
                    onCancel: (){}
                  );
                  return Future.value(false);
                },
              ),
            ));
  }
}