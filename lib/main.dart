import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      // theme: ThemeData.dark(),
      routerConfig: AppRouter.router,
    );
  }
}
