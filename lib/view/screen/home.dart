import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:admin/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: ListView(children:[
        GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisExtent: 150),
          children: [
            CardAdmin(url: AppImageAsset.logo, title: 'Categories',onClick: (){Get.toNamed(AppRoute.categoryview);},),
            CardAdmin(url: AppImageAsset.delivery, title: 'Notification',onClick: (){},),
            CardAdmin(url: AppImageAsset.drivethru, title: 'Notification',onClick: (){},),
            CardAdmin(url: AppImageAsset.onBoardingImageTwo, title: 'Notification',onClick: (){},),
            CardAdmin(url: AppImageAsset.onBoardingImageThree, title: 'Notification',onClick: (){},),
            CardAdmin(url: AppImageAsset.onBoardingImageOne, title: 'Notification',onClick: (){},),
        ],)
      ]),
    );
  }
}
