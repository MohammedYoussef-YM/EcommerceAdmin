import 'package:admin/binding/intialbindings.dart';
import 'package:admin/core/localization/changelocal.dart';
import 'package:admin/core/localization/translation.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Admin ECommerce',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: Intialbindings(),
      getPages: routes,
    );
  }
}
