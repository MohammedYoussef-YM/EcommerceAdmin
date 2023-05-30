import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkurl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.itemsadd);
      },child: Icon(Icons.add),),
      body: GetBuilder<ItemsController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: () {
                return controller.myback();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){controller.goToPageEdit(controller.data[index]);},
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  child: CachedNetworkImage(
                      // imageUrl: '${AppLink.imageItems}/${itemsModel.itemsImage!}',
                                     height:80,
                                     imageUrl: "${AppLink.imageItems}/${controller.data[index].itemsImage!}",
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  trailing: IconButton(icon: Icon(Icons.delete_outline),onPressed:(){
                                   Get.defaultDialog(title: "تحذير",middleText: "سوف يتم حذف المنتج هل انت متاكد؟",onCancel: (){},onConfirm: (){
                                    controller.deleteitems(controller.data[index].itemsId!, controller.data[index].itemsImage!);
                                    Get.back();
                                   });
                                  },),
                                  subtitle: Text(controller.data[index].itemsDate!),
                                  title: Text(controller.data[index].itemsName!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),),
            ),)),);
  }
}
