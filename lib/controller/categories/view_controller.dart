import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("=======================  dsdsad    $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
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
  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoryedit,arguments: {"categoriesModel":categoriesModel});
  }
  deleteCategories(String id, String imagename){
   categoriesData.delete({"id":id,"imagename":imagename});
   data.removeWhere((element) => element.categoriesId == id);
   update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
