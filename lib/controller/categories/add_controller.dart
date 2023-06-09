import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class CategoriesAddController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController name;
  late TextEditingController namear;

  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
   if(formState.currentState!.validate()){
   if(file == null) Get.snackbar("error", "Please Choose Image SVG");
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "name": name.text,
      "namear": namear.text
    };
    var response = await categoriesData.add(data,file!);
    print("=======================  dsdsad    $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoute.categoryview);
        CategoriesController c = Get.find();
        c.getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}


  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
