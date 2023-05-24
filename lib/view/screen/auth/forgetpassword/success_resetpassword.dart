import 'package:admin/controller/auth/successResetPasswordController.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/shared/custombuttom.dart';
import 'package:flutter/material.dart';

class SuccessResetpassword extends StatelessWidget {
  const SuccessResetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = SuccessResetPasswordControllerImp();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("Succes",
          style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey),),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
          ),
          const Text("...."),
          const Text("...."),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: CustumButtom(text: "Go To Login",onPressed: (){controller.goToLogin();},)),
          const SizedBox(height: 30,),
        ],),
      ),
    );
  }
}
