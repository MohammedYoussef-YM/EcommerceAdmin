import 'package:admin/controller/forgetpassword/verifycode_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/customtextbody.dart';
import 'package:admin/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Verification Code',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: ListView(
            children:  [
              const CustomTextTitle(title: "Check Code"),
              const SizedBox(height: 10,),
              const CustomTextBody(text:"Please Enter The Digit Code Sent To youssefalsodi9@gmail.com"),
              const SizedBox(height: 15),
              OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  textStyle: const TextStyle(fontSize: 18),
                  numberOfFields: 5,
                  borderColor: AppColor.backgroundcolor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.goToResetPassword(verificationCode);
                  }),
            ]),
      ),
    );
  }
}