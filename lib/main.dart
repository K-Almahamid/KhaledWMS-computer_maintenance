import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/app_variables.dart';
import 'package:computer_maintenance/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPref = await SharedPreferences.getInstance();

  if (sharedPref.getString(userName) != null) {
    userNameValue = sharedPref.getString(userName)!;
    userEmailValue = sharedPref.getString(userEmail)!;
  } else {
    userNameValue = '';
    userEmailValue = '';
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'TajawalMedium'),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: const HomeScreen(),
      title: Text(
        'مرحبا بك',
        style: kPageTitleStyle.copyWith(color: AppColors.whiteColor,fontSize: 40,),
      ),
      // image: Image.network(
      //     'https://i.pinimg.com/236x/34/57/30/345730a335becf43c2a3272e79074f9c.jpg'),
      backgroundColor: AppColors.orangeColor,
      loaderColor: Colors.white,
      photoSize: 100,
    );
  }
}
