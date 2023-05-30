import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class ItemsAddController extends GetxController {

  ItemsData itemsData = ItemsData(Get.find());

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
    var response = await itemsData.add(data);
    print("=======================  dsdsad    $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.offNamed(AppRoute.itemsview);
        ItemsController c = Get.find();
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
