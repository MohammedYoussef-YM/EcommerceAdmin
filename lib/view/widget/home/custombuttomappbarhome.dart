import 'package:admin/controller/orders/screen_controller.dart';
import 'package:admin/view/widget/home/custombuttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenControllerImp>(builder: (controller)=>
        BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(
            controller.listPage.length, ((index) {
              return Expanded(
                    child: CustomButtomAppBar(
                                  textbutton: controller.bottomappbar[index]['title'],
                                  iconData: controller.bottomappbar[index]['icon'],
                                  onPressed: () {
                                       controller.changePage(index);
                                  },
                                  active:
                                  controller.currentPage == index ? true : false,
                                ),
                  );
            }),
          ),
        ],
      ),
    ));
  }
}
