import 'package:admin/controller/items/add_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/customtextfieldglobal.dart';
import 'package:admin/view/widget/langauge/custtombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add Items"),),
      body: GetBuilder<ItemsAddController>( 
        builder: (controller)=>
   HandlingDataView(statusRequest: controller.statusRequest!, widget:  Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formState,
          child: ListView(children: [
            CustomTextFieldAuthGlobal(
                hintText: "Items name", labeltext: "Items name",
                iconDate: Icons.category, mycontroller: controller.name, valid: (val){
              return validInput(val!, 1, 30, "");
            }, isNumber: false),
            CustomTextFieldAuthGlobal(
                hintText: "Items name (arabic)", labeltext: "Items name (arabic)",
                iconDate: Icons.category, mycontroller: controller.namear, valid: (val){
              return validInput(val!, 1, 30, "");
            }, isNumber: false),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                    color: AppColor.thirdColor,
                    textColor: AppColor.secoundColor,
                    onPressed: (){
                      controller.chooseImage();
                    },child: Text("Choose Items image"))),
            if(controller.file != null )
              SvgPicture.file(controller.file!,height: 100,),
            CustomButtonLang(textbutton: 'add',onPressed: (){
              controller.addData();
            },)
          ],),
        ),),)
),
    );
  }
}