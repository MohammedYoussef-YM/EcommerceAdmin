import 'package:admin/controller/orders/pending_controller.dart';
import 'package:admin/core/constant/apptheme.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../core/constant/routes.dart';

class CardOrderList extends GetView<OrdersPendingController> {
  final OrderModel listdata;
  const CardOrderList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Row(
              children: [
                Text("Order Number : #${listdata.ordersId}",
                  style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
               const Spacer(),
                Text(Jiffy(listdata.ordersDatetime!,"yyyy-MM-dd").fromNow(),style: defaultStyle,)
              ],
            ),
            const Divider(),
            // Text("Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order Price : ${listdata.ordersPrice} \$"),
            Text("Delivery Price : ${listdata.ordersPricedelivery} \$"),
            Text("Payment Method : ${controller.printPeymentMethod(listdata.ordersPeymentmethod!)}"),
            // Text("Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
                children: [
                  Text("Total Price : ${listdata.ordersTotalprice} \$",style: const TextStyle(color:AppColor.primaryColor,fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: (){
                    Get.toNamed(AppRoute.orderdetails,arguments: {'ordermodels':listdata});
                  },
                  color: AppColor.thirdColor,textColor: AppColor.secoundColor,
                  child:const Text("Details"),),
                  const SizedBox(width: 10,),
                  if(listdata.ordersStatus! == "2")  MaterialButton(
                    onPressed: (){
                      controller.approveOrders(listdata.ordersUsersid!, listdata.ordersId!);
                     },
                  color: AppColor.thirdColor,textColor: AppColor.secoundColor,
                  child:const Text("Approve"),
                  ),  
                ]
            )
          ],
        ),
      ),
    );
  }
}