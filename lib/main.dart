import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/utils/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
