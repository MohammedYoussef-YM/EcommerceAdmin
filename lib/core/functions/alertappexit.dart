import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> Alertappexit(){
   Get.defaultDialog(
    title: "تنبية",
    middleText: "هل تريد الخروج من التطبيق ؟",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
          },
        child: const Text("Conferm"),

      ),
      ElevatedButton(
        onPressed: () { Get.back(); },
        child: const Text("cancel"),

      ),
    ]
  );
   return Future.value(true);
}