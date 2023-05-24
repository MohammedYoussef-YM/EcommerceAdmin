import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class VerifyCodeSignUpData {

  Crud crud ;

  VerifyCodeSignUpData( this.crud);

  postData(String email,String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycode
    });
    return response.fold((l)=>l,(r)=>r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email
    });
    return response.fold((l)=>l,(r)=>r);
  }
}