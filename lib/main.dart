import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'core/utils/app_router.dart';
import 'firebase_options.dart';

void requestMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
initInfo() {
  var androinInitialize =
      const AndroidInitializationSettings('@drawable/ic_laucher');
  var intializationsSettings =
      InitializationSettings(android: androinInitialize);
  flutterLocalNotificationsPlugin.initialize(
    intializationsSettings,
    onDidReceiveNotificationResponse: (details) {},
    onDidReceiveBackgroundNotificationResponse: (details) {},
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.subscribeToTopic("coin_links");
  requestMessaging();
  runApp(const SpinLinks());
}

class SpinLinks extends StatelessWidget {
  const SpinLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
