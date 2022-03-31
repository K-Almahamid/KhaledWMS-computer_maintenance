import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/icon_broken.dart';
import 'package:computer_maintenance/views/home_screen.dart';
import 'package:computer_maintenance/views/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/app_variables.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();
GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
bool passwordObscure = true;
bool isLoading = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: const Icon(
          IconBroken.Close_Square,
          color: AppColors.orangeColor,
          size: 35,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Go',
                            style: logoStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: AppColors.orangeColor,
                            ),
                          ),
                          Text(
                            'Hardware',
                            style: logoStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 80.0),
                  Column(
                    children: [
                      TextFormField(
                        controller: loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: AppColors.orangeColor,
                        style: kTitleStyle,
                        // autofillHints: const [AutofillHints.email],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "البريد الالكتروني",
                          labelStyle: kTitleStyle,
                          prefixIcon: const Icon(IconBroken.Message,
                              color: AppColors.blackColor),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.blackColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: 'مطلوب'),
                            EmailValidator(
                                errorText: 'البريد الاكتروني غير صحيح'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        controller: loginPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        style: kTitleStyle,
                        cursorColor: AppColors.orangeColor,
                        obscureText: passwordObscure,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "الباسوورد",
                          labelStyle: kTitleStyle,
                          prefixIcon: const Icon(IconBroken.Lock,
                              color: AppColors.blackColor),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                passwordObscure = !passwordObscure;
                              });
                            },
                            child: Icon(
                              passwordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.blackColor,
                              size: 20,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.blackColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: 'مطلوب'),
                            LengthRangeValidator(
                              min: 7,
                              max: 20,
                              errorText: 'يجب ان يكون اكثر من 6 واقل من 20',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'نسيت كلمة السر ؟',
                              style: kTitleStyle.copyWith(
                                color: AppColors.orangeColor,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //     child: const forgetPasswordScreen(),
                          //     type: PageTransitionType.bottomToTop,
                          //   ),
                          // );
                        },
                      ),
                      const SizedBox(height: 25.0),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: MaterialButton(
                          child: Text(
                            'تسجيل الدخول',
                            style: kSubtitleStyle.copyWith(
                                color: AppColors.whiteColor),
                          ),
                          onPressed: () async {
                            if (loginEmailController.text.isNotEmpty &&
                                loginPasswordController.text.isNotEmpty) {
                              isLoading = true;
                              loginToAccount(context, loginEmailController.text,
                                  loginPasswordController.text,)                     .catchError(
                                    (e) {
                                      Get.snackbar(
                                        ' لا يمكن تسجيل الدخول',
                                        'يرجى التحقق من البيانات',
                                        colorText: AppColors.blackColor,
                                        backgroundColor: AppColors.whiteColor,
                                        margin: const EdgeInsets.all(10),
                                        isDismissible: true,
                                        dismissDirection: DismissDirection.horizontal,
                                        borderRadius: 10,
                                        icon: const Icon(Icons.notifications, color: Colors.white),
                                        onTap: (value) {
                                          print(value.toString());
                                        },
                                      );
                                },
                              );
                              //return true or false
                              bool result = await sharedPrefSaveData(
                                'khaled',
                                loginEmailController.text,
                                'assets/images/logo.png',
                              );
                              isLoading = result;
                              setState(() {});
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                'انشاء حساب',
                                style: kSubtitleStyle.copyWith(
                                    color: AppColors.orangeColor),
                              ),
                              onPressed: () {
                                Get.to(() => const SignUpScreen());
                              },
                            ),
                            Text('ليس لديك حساب؟', style: kSubtitleStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Future<bool> sharedPrefSaveData(String username, String email, image) async {
  try {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    // sharedPref.setString(userId, data['id']);
    sharedPref.setString(userId, '');
    sharedPref.setString(userName, username);
    sharedPref.setString(userEmail, email);
    sharedPref.setString(userImage, image);
    print('sharedPref done');
    Get.off(() => const HomeScreen());
    Get.snackbar(
      'sharedPref done',
      'hello',
      colorText: AppColors.blackColor,
      backgroundColor: AppColors.whiteColor,
      margin: const EdgeInsets.all(10),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 10,
      icon: const Icon(Icons.notifications, color: Colors.white),
      onTap: (value) {
        print(value.toString());
      },
    );
    return true;
  } catch (error) {
    print('sharedPref error : ' + error.toString());
    return false;
  }
}
Future loginToAccount(BuildContext context, String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .signInWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  userUid = user!.uid;
  print(user.email);
  print(user.emailVerified);
  print(userUid);
}