import 'package:admin/core/middleware/mymiddleware.dart';
import 'package:admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/detials.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes= [
  GetPage(name: "/", page: () => const Login(),middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetpassword()),

  // home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.archiveorders, page: () => const ArchiveOrders()),
  GetPage(name: AppRoute.orderdetails, page: () => const OrdersDetails()),
  // CategoriesView
  GetPage(name: AppRoute.categoryview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoryadd, page: () => const CategoriesAdd()),

];