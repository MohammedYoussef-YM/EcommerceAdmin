import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class ArchiveOrdersData {

  Crud crud ;

  ArchiveOrdersData( this.crud);

  getData(String deliveryid) async{
    var response = await crud.postData(AppLink.archiveOrder, {
      "id": deliveryid
    });
    return response.fold((l)=>l,(r)=>r);
  }



}