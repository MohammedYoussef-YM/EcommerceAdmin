import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.viewitems, {});
    return response.fold((l) => l, (r) => r);
  }
  add(Map data) async {
    var response = await crud.postData(AppLink.additems, data);
    return response.fold((l) => l, (r) => r);
  }
  delete(Map data) async {
    var response = await crud.postData(AppLink.deleteitems, data);
    return response.fold((l) => l, (r) => r);
  }
  edit(Map data) async {
    var response = await crud.postData(AppLink.edititems, data);
    return response.fold((l) => l, (r) => r);
  }
}