import 'package:get/get.dart';

validInput(String val,int min,int max,String type){
  if(type == "username"){
     if(!GetUtils.isUsername(val)){
       return "not valid username";
     }

  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "not valid email";
    }
  }
  if(type == "password"){
    if(!GetUtils.isPhoneNumber(val)){
      return "not valid password";
    }
  }

  if(val.isEmpty){
   return "Can`t be empty";
  }
  if(val.length < min){
    return "Can`t be less than $min";
  }
  if(val.length >max){
    return "Can`t be more than $max";
  }
}