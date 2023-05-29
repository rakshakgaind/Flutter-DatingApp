import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_dating/controller/add_photo_controller.dart';
import 'package:social_dating/controller/birthday_screen_controller.dart';
import 'package:social_dating/screens/initial_screen.dart';
import 'package:social_dating/screens/splash/splash_screen.dart';
import 'controller/initial_screen_controller.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        Provider<InitialScreenController>(create: (_) => InitialScreenController()),
        Provider<BirthdayScreenController>(create: (_) => BirthdayScreenController()),
        Provider<AddPhotoController>(create: (_) => AddPhotoController()),
      ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:   const SplashScreen(),
    );
  }
}

