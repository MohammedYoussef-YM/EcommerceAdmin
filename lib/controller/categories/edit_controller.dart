import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class CategoriesEditController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController name;
  late TextEditingController namear;

  File? file;
  CategoriesModel? categoriesModel;

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
      "imageold":categoriesModel!.categoriesImage!,
      "id": categoriesModel!.categoriesId.toString()
    };
    var response = await categoriesData.edit(data,file);
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
    categoriesModel =Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNamaAr!;
    super.onInit();
  }
}
