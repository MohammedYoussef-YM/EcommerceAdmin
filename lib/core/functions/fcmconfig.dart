import 'package:admin/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig(){
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}
refreshPageNotification(data){
   print("pageid");
   print(data['pageid']);
   print("pagename");
   print(data['pagename']);
   print("Get.currentRoute");
   print(Get.currentRoute);
   if(Get.currentRoute == "/orderspending" && data['pagename'] == "order"){
     OrdersPendingController controller = Get.find();
     controller.refreshOrder();
   }
}