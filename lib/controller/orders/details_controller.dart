import 'dart:async';

import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/data/model/cartmodel.dart';
import 'package:admin/data/model/ordermodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/datasource/remote/orders/details_data.dart';

class DetailsController extends GetxController {

  DetailsOrdersData detailsOrdersData = DetailsOrdersData(Get.find());

  List<CartModel> data = [];

  late OrderModel orderModel;

  late StatusRequest statusRequest;

  Completer<GoogleMapController>? completerconttroller;
  CameraPosition? cameraPosition;

  List<Marker> markers = [];

  double? lat;
  double? long;

  intialData() {
    completerconttroller = Completer<GoogleMapController>();
    if(orderModel.ordersType == "0"){
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(orderModel.addressLat??"0"),
            double.parse(orderModel.addressLang??"0")),
        zoom: 12.4746,
      );
      markers.add(Marker(markerId: MarkerId("1"),
          position: LatLng(double.parse(orderModel.addressLat??"0"),
              double.parse(orderModel.addressLang??"0"))));
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await detailsOrdersData.getData(orderModel.ordersId!);
    print("from detailsOrdersData  ========      $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e)=> CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderModel = Get.arguments['ordermodels'];
    intialData();
    getData();
    super.onInit();
  }

}