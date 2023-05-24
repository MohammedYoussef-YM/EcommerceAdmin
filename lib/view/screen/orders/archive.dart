import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/view/widget/orders/orderslistcartarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/archive_controller.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title:const Text("Orders"),
        ),
        body: GetBuilder<OrdersArchiveController>(
          builder:((controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: ((context,index)=> CardOrderListAchive(listdata: controller.data[index],)),
            ),
          )),
        )
    );
  }
}
