import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class DetailsOrdersData {
  Crud crud ;
  DetailsOrdersData(this.crud);

  getData(String id) async{
    var response = await crud.postData(AppLink.ordersdetail, {"ordersid" : id});
    return response.fold((l)=>l,(r)=>r);
  }
}