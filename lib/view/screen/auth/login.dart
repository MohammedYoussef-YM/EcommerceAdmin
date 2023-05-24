import 'package:admin/controller/auth/login_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/alertappexit.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombuttom.dart';
import 'package:admin/view/widget/auth/custombuttonsigninOrSignIn.dart';
import 'package:admin/view/widget/auth/customtextbody.dart';
import 'package:admin/view/widget/auth/customtextfield.dart';
import 'package:admin/view/widget/auth/customtexttitle.dart';
import 'package:admin/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(LoginControllerImp());
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
      body: WillPopScope(onWillPop: Alertappexit,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller)=> HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget:  Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child: Form(
                key: controller.formStates,
                child: ListView(children:  [
                  const LogoAuth(),
                  const CustomTextTitle(title: "Welcome Back",),
                  const SizedBox(height: 10,),
                  const CustomTextBody(text:"Sign In With Your Email And Password or Continue with Social Media"),
                  const SizedBox(height: 15,),
                  CustomtextfieldAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "email");
                    },
                    mycontroller: controller.email,
                    hintText: 'Enter Your Email',
                    labeltext: 'Email',
                    iconDate: Icons.email_outlined,
                  ),
                  GetBuilder<LoginControllerImp>(builder: (controller) => CustomtextfieldAuth(
                    obscureText: controller.isshowpassword,
                    onTabIcon: (){
                      controller.ShowPassword();
                    },
                    isNumber: false,
                    valid: (val){
                      return validInput(val!,5, 30, "password");
                    },
                    mycontroller: controller.password,
                    hintText: 'Enter Your Password',
                    labeltext: 'Password',
                    iconDate: Icons.lock_outline,
                  )),
                  InkWell(
                      onTap: (){controller.goToForgerPassword(); },
                      child: const Text("Forget Password",textAlign: TextAlign.end,)),
                  CustumButtom(text: "Sign In",onPressed: (){controller.login(); },),
                ]),
            ),
          ),
              ),)),
    );
  }
}