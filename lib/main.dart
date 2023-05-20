import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'core/utils/app_router.dart';
import 'firebase_options.dart';

void requestMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
initInfo() {
  var androinInitialize =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var intializationsSettings =
      InitializationSettings(android: androinInitialize);
  flutterLocalNotificationsPlugin.initialize(
    intializationsSettings,
    onDidReceiveNotificationResponse: (details) {},
    onDidReceiveBackgroundNotificationResponse: (details) {},
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.subscribeToTopic("coin_links");
  requestMessaging();
  runApp(const SpinLinks());
}

class SpinLinks extends StatelessWidget {
  const SpinLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      routerConfig: AppRouter.router,
    );
  }
}
