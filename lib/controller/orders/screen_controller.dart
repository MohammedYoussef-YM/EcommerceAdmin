import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeSreenController extends GetxController{
 changePage(int index);
}

class ScreenControllerImp extends HomeSreenController{
  int currentPage = 0;

  List<Widget> listPage = [
    const PendingOrders(),
    // const NotificationScreen(),
    const AcceptedOrders(),
    Column(children: [Center(child: Text("Hello"),)],)
  ];

  List bottomappbar = [
    {"title":"Pending","icon":Icons.home},
    {"title":"Accepted","icon":Icons.add_shopping_cart_outlined},
    {"title":"Approved","icon":Icons.settings},
  ];

  @override
  changePage(int index) {
   currentPage = index;
   update();
  }
}