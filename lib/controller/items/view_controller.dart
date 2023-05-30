import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/items_data.dart';

class ItemsController extends GetxController {

  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    print("=======================  dsdsad    $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  myback(){
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsedit,arguments: {"itemsModel":itemsModel});
  }
  deleteitems(String id, String imagename){
   itemsData.delete({"id":id,"imagename":imagename});
   data.removeWhere((element) => element.itemsId == id);
   update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
