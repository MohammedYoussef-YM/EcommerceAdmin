import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';
import 'dart:io';


class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.viewcategory, {});
    return response.fold((l) => l, (r) => r);
  }
  add(Map data,File file) async {
    var response = await crud.addRequestWithImageOne(AppLink.addcategory, data,file);
    return response.fold((l) => l, (r) => r);
  }
  delete(Map data) async {
    var response = await crud.postData(AppLink.deletecategory, data);
    return response.fold((l) => l, (r) => r);
  }
  edit(Map data,[File? file]) async {
    var response ;
    if(file == null){
     response = await crud.postData(AppLink.editcategory, data);
   
    } else {
     response = await crud.addRequestWithImageOne(AppLink.editcategory, data,file);
    }
    return response.fold((l) => l, (r) => r);
  }
}