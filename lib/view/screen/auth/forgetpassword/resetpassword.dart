import 'package:admin/controller/forgetpassword/reset_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombuttom.dart';
import 'package:admin/view/widget/auth/customtextbody.dart';
import 'package:admin/view/widget/auth/customtextfield.dart';
import 'package:admin/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Reset Password',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetControllerImp>(builder: (controller) =>
    HandlingDataRequest(
    statusRequest: controller.statusRequest,
    widget:  GetBuilder<ResetControllerImp>(
      builder: (controller)=>HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
              children:  [
                const CustomTextTitle(title: "New Password"),
                const SizedBox(height: 10,),
                const CustomTextBody(text:"Please Enter new Password"),
                const SizedBox(height: 15),
                CustomtextfieldAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!,5, 30, "password");
                  },
                  mycontroller: controller.password,
                  hintText: 'Enter Your Password',
                  labeltext: 'Password',
                  iconDate: Icons.lock_outline,
                  // mycontroller: null,
                ),
                CustomtextfieldAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!,5, 30, "password");
                  },
                  mycontroller: controller.repassword,
                  hintText: 'Re Enter Your Password',
                  labeltext: 'RePassword',
                  iconDate: Icons.lock_outline,
                  // mycontroller: null,
                ),
                CustumButtom(text: "save",onPressed: (){
                  controller.goToSuccesResetPassword();
                },),
              ]),
        ),
    ),
      ),)),)
    );
  }
}