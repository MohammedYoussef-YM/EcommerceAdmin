import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class AcceptedOrdersData {

  Crud crud ;

  AcceptedOrdersData( this.crud);

  getData(String deliveryid) async{
    var response = await crud.postData(AppLink.acceptedOrder, {
      "id": deliveryid
    });
    return response.fold((l)=>l,(r)=>r);
  }
  doneDelevary(String ordersId,String userid) async{
    var response = await crud.postData(AppLink.doneOrder, {
      "ordersid": ordersId,"usersid":userid
    });
    return response.fold((l)=>l,(r)=>r);
  }


}