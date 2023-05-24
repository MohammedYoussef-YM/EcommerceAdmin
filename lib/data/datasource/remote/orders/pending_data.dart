import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class PendingOrdersData {

  Crud crud ;

  PendingOrdersData( this.crud);

  getData() async{
    var response = await crud.postData(AppLink.pendingOrdrs, {});
    return response.fold((l)=>l,(r)=>r);
  }

  approveData(String deliveryid,String usersid,String ordersid) async{
    var response = await crud.postData(AppLink.approveOrder, {"deliveryid":deliveryid,"usersid":usersid,"ordersid":ordersid});
    return response.fold((l)=>l,(r)=>r);
  }

}