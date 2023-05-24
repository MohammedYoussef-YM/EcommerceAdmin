import 'package:admin/core/class/crud.dart';
import 'package:admin/linkurl.dart';

class CheckEmailData {

  Crud crud ;

  CheckEmailData( this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email
    });
    return response.fold((l)=>l,(r)=>r);
  }
}