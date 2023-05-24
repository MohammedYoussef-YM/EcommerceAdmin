import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/localization/changelocal.dart';
import 'package:admin/view/widget/langauge/custtombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController>{
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text("choose_language".tr, style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20,),
            CustomButtonLang(textbutton: "Ar",onPressed: (){
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onBoarding);
            }),
            CustomButtonLang(textbutton: "En",onPressed: (){
              controller.changeLang("en");
              Get.toNamed(AppRoute.onBoarding);
            })
          ],
        ),
      ),
    );
  }

}