import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgerPassword();
}
class LoginControllerImp extends LoginController {

  LoginData loginData =LoginData(Get.find());

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  ShowPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  GlobalKey<FormState> formStates = GlobalKey<FormState>();

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgerPassword() {
    Get.toNamed(AppRoute.forgetpassword);
  }

  @override
  login() async {
    if (formStates.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text,password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print(response);
          print(response['data']);
          print("response");
          if(response['data']['admin_approve'] == "1") {
            myServices.sharedPreferences.setString(
                "id", response['data']['admin_id']);
            String userid = myServices.sharedPreferences.getString("id")!;
                myServices.sharedPreferences.setString(
                "username", response['data']['admin_name']);
            myServices.sharedPreferences.setString(
                "email", response['data']['admin_email']);
            myServices.sharedPreferences.setString(
                "phonw", response['data']['admin_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");// for all user notification
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");// for specific user notification
            Get.offNamed(AppRoute.homepage);
          } else {
            Get.offNamed(AppRoute.verifycodeSignUp,arguments: {
              "email" : email.text
            });
          }
        }
        else {
          Get.defaultDialog(title: "Warning",middleText: "email or password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
    else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("Token");
      print(value);
      print("Token");
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}