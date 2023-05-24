import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class VerifyCodeForgetPasswordData {

  Crud crud ;

  VerifyCodeForgetPasswordData( this.crud);

  postData(String email,String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeForgerPassword, {
      "email": email,
      "verifycode": verifycode
    });
    return response.fold((l)=>l,(r)=>r);
  }

}