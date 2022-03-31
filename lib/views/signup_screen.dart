import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/icon_broken.dart';
import 'package:computer_maintenance/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
bool signUpPasswordObscure = true;
TextEditingController signUpNameController = TextEditingController();
TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();
TextEditingController signUpPhoneController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Go',
                              style: logoStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: AppColors.orangeColor,
                              ),
                            ),
                            Text(
                              'Hardware',
                              style: logoStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 70.0),
                    TextFormField(
                      controller: signUpNameController,
                      keyboardType: TextInputType.name,
                      cursorColor: AppColors.orangeColor,
                      style: kTitleStyle,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "الاسم",
                        labelStyle: kTitleStyle,
                        prefixIcon: const Icon(IconBroken.Profile,
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
                          LengthRangeValidator(
                            min: 6,
                            max: 25,
                            errorText: 'يجب ان يكون اكثر من 6 واقل من 25',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      controller: signUpEmailController,
                      style: kTitleStyle,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: AppColors.orangeColor,
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
                      controller: signUpPhoneController,
                      style: kTitleStyle,
                      keyboardType: TextInputType.phone,
                      cursorColor: AppColors.orangeColor,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "رقم الهاتف",
                        labelStyle: kTitleStyle,
                        prefixIcon: const Icon(IconBroken.Call,
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      controller: signUpPasswordController,
                      style: kTitleStyle,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: AppColors.orangeColor,
                      obscureText: signUpPasswordObscure,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "الباسوورد",
                        labelStyle: kTitleStyle,
                        prefixIcon: const Icon(IconBroken.Lock,
                            color: AppColors.blackColor),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              signUpPasswordObscure = !signUpPasswordObscure;
                            });
                          },
                          child: Icon(
                            signUpPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.blackColor,
                            size: 20,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: AppColors.orangeColor,
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
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.orangeColor,
                                onPrimary: AppColors.whiteColor,
                              ),
                              child: Text(
                                'انشاء حساب',
                                style: kSubtitleStyle.copyWith(
                                    color: AppColors.whiteColor),
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    createAccount(
                                      signUpEmailController.text,
                                      signUpPasswordController.text,
                                    ).whenComplete(() {
                                      createUserCollection(
                                        context,
                                        {
                                          'useruid': getUserUid,
                                          'username': signUpNameController.text,
                                          'useremail':
                                              signUpEmailController.text,
                                          'userphone':
                                              signUpPhoneController.text,
                                        },
                                      );
                                    }).whenComplete(
                                      () {
                                        sharedPrefSaveData(
                                            signUpNameController.text,
                                            signUpEmailController.text,
                                            'assets/images/logo.png');
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
String? userUid;

String? get getUserUid => userUid;

Future createAccount(String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  userUid = user!.uid;
  print('Created Account Uid => $userUid');
}

Future createUserCollection(BuildContext context, dynamic data) async {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(getUserUid)
      .set(data);
}
