import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class ResetPasswordData {

  Crud crud ;

  ResetPasswordData( this.crud);

  postData(String email,String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password
    });
    return response.fold((l)=>l,(r)=>r);
  }

}