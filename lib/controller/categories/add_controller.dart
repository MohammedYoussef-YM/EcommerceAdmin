import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class CategoriesAddController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());

  late StatusRequest statusRequest;

  late TextEditingController name;
  late TextEditingController namear;

  File? file;

  chooseImage() async {
    file = await fileUploadGallery();
    update();
  }
  addData() async {
    statusRequest = StatusRequest.loading;

    Map data = {
      "name": name.text,
      "namear": namear.text
    };
    var response = await categoriesData.add(data,file!);
    print("=======================  dsdsad    $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoute.categoryadd);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
