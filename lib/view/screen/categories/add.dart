import 'package:admin/controller/categories/add_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/customtextfieldglobal.dart';
import 'package:admin/view/widget/langauge/custtombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category"),),
      body: GetBuilder<CategoriesAddController>(builder: (controller)=>Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          CustomTextFieldAuthGlobal(
              hintText: "Categories name", labeltext: "Categories name",
              iconDate: Icons.category, mycontroller: controller.name, valid: (val){
            return validInput(val!, 1, 30, "");
          }, isNumber: false),
          CustomTextFieldAuthGlobal(
              hintText: "Categories name (arabic)", labeltext: "Categories name (arabic)",
              iconDate: Icons.category, mycontroller: controller.name, valid: (val){
            return validInput(val!, 1, 30, "");
          }, isNumber: false),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                  color: AppColor.thirdColor,
                  textColor: AppColor.secoundColor,
                  onPressed: (){
                    controller.chooseImage();
                  },child: Text("Choose category image"))),
          if(controller.file != null )
            SvgPicture.file(controller.file!),
          CustomButtonLang(textbutton: 'add',onPressed: (){
            controller.addData();
          },)
        ],),),),
    );
  }
}