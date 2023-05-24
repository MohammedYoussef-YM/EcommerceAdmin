import 'package:admin/core/constant/apptheme.dart';
import 'package:admin/core/functions/fcmconfig.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {

  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

   getPer() async  {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
       return Get.snackbar("تنبية", "الرجاء تشغيل خدمة تحديد الموثع");
    }

    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.denied) {
        return Get.snackbar("تنبية", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (per == LocationPermission.deniedForever) {
      return Get.snackbar("تنبية", "لايمكن استعمال التطبيق من اللوكيشن");
    }
      // return per;
  }

  @override
    void onInit(){
    fcmconfig();
    requestPermissionNotification();
    getPer();
    String? sharedPrefLang =myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en"){
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language =  Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}