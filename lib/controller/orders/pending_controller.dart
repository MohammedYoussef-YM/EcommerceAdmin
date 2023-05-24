import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/pending_data.dart';
import 'package:get/get.dart';
import '../../data/model/ordermodel.dart';

class OrdersPendingController extends GetxController {

  PendingOrdersData orderData = PendingOrdersData(Get.find());

  List<OrderModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val){
    if(val == "0"){
      return "Delivery";
    } else {
      return "Receive";
    }
  }
  
  String printPeymentMethod(String val){
    if(val == "0"){
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }
  
  String printOrderStatus(String val){
    if(val == "0"){
      return "Pending Approval";
    } else if(val == "1"){
      return "The Order is Being Prepared";
    }else if(val == "2"){
      return "Ready To Picked up by Delivery man";
    } else if(val == "3"){
      return "On The Way";
    } else {
      return "Archive";
    }
  }


  @override
  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  approveOrders(String usersid,String ordersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.approveData(
      myServices.sharedPreferences.getString("id")!, usersid,ordersid);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
         getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder(){
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
