import 'package:admin/controller/forgetpassword/forgetpassword.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) =>
    HandlingDataRequest(
    statusRequest: controller.statusRequest,
    widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(
              children:  [
                const CustomTextTitle(title: "Check Email"),
                const SizedBox(height: 10,),
                const CustomTextBody(text:"Please Enter Your Email Address To Recive A verification code"),
                const SizedBox(height: 15),
                CustomtextfieldAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!,5, 30, "email");
                  },
                  mycontroller: controller.email,
                  hintText: 'Enter Your Email',
                  // mycontroller: null,
                  labeltext: 'Email',
                  iconDate: Icons.email_outlined,
                  // mycontroller: null,
                ),
                CustumButtom(text: "Check",onPressed: (){
                  controller.checkemail();
                },),
              ]),
        ),
      ),),)
    );
  }
}