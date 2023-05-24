import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingData.dart';
import 'package:admin/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPassword(verifycode) async {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodeForgetPasswordData.postData(email!,verifycode);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.resetpassword,
              arguments: {"email":email});
        }
        else {
          Get.defaultDialog(title: "Warning",middleText: "Verify Code Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
  }

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}