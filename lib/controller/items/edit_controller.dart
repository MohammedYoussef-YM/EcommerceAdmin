import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class ItemsditController extends GetxController {

  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController name;
  late TextEditingController namear;

  File? file;
  ItemsModel? itemsModel;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }
  editData() async {
   if(formState.currentState!.validate()){

    statusRequest = StatusRequest.loading;

    update();
    Map data = {
      "name": name.text,
      "namear": namear.text,
      "imageold":itemsModel!.itemsName!,
      "id": itemsModel!.itemsId.toString()
    };
    var response = await itemsData.edit(data);
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
    itemsModel =Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    super.onInit();
  }
}
