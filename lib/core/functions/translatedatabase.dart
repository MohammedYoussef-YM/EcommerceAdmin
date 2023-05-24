import 'package:admin/core/services/services.dart';
import 'package:get/get.dart';

TranslationDataBase(columnar, columnen ){

  MyServices myServices = Get.find();

  if(myServices.sharedPreferences.getString("lang") == "ar"){
    return columnar;
  } else {
    return columnen;
  }
}