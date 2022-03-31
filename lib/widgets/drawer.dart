import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/app_variables.dart';
import 'package:computer_maintenance/views/home_screen.dart';
import 'package:computer_maintenance/views/login_screen.dart';
import 'package:computer_maintenance/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/icon_broken.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // void logout(BuildContext context) async {
  //   SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //   sharedPref.remove(AppConstants.userId);
  //   sharedPref.remove(AppConstants.userName);
  //   sharedPref.remove(AppConstants.userPhone);
  //   sharedPref.remove(AppConstants.userImage);
  //   sharedPref.clear();
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Login(),
  //     ),
  //   );
  // }
  bool loggedIn = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameValue != '' ? loggedIn = true :  loggedIn = false ;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: AppColors.whiteColor,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child:loggedIn ? ListTile(
                    leading: GestureDetector(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundColor: AppColors.orangeColor,
                          child: Icon(
                            Icons.person,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      userNameValue,
                      style: kTitleStyle.copyWith(
                        color: AppColors.blackColor,
                        fontFamily: 'TajawalMedium',
                      ),
                    ),
                    subtitle: Text(
                      userEmailValue,
                      style: kTitleStyle.copyWith(
                        color: AppColors.blackColor,
                        fontFamily: 'TajawalMedium',
                      ),
                    ),
                  ) :GestureDetector(
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundColor: AppColors.orangeColor,
                          child: Icon(
                            Icons.person,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      title: Text(
                        'انقر هنا لستجيل الدخول',
                        style: kTitleStyle.copyWith(
                          color: AppColors.blackColor,
                          fontFamily: 'TajawalMedium',
                        ),
                      ),
                    ),
                    onTap: (){
                      Get.to(()=>LoginScreen());
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 45,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  margin: const EdgeInsets.only(left: 80, top: 30),
                  decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          IconBroken.Home,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'الصفحة الرئيسية',
                            style: kTitleStyle.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Get.to(movePage,
                      //   transition: Transition.fadeIn,
                      // );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 45,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  margin: const EdgeInsets.only(left: 80, top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          IconBroken.Message,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'تواصل معنا',
                            style: kTitleStyle.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Get.to(movePage,
                      //   transition: Transition.fadeIn,
                      // );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 45,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  margin: const EdgeInsets.only(left: 80, bottom: 200),
                  decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          IconBroken.Info_Circle,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'حول التطبيق',
                            style: kTitleStyle.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Get.to(movePage,
                      //   transition: Transition.fadeIn,
                      // );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: 45,
                  margin: const EdgeInsets.only(left: 80, top: 30),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    color: AppColors.orangeColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: MaterialButton(
                    color: AppColors.whiteColor,
                    padding: EdgeInsets.zero,
                    height: 45,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        side: BorderSide(color: AppColors.orangeColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        const Icon(
                          IconBroken.Logout,
                          color: AppColors.orangeColor,
                        ),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'تسجيل الخروج',
                            style: kTitleStyle.copyWith(
                                color: AppColors.orangeColor,
                                fontFamily: 'TajawalBold'),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        logOutDialog(context);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

logOutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade100,
actionsPadding: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('تسجيل الخروج ؟',
                  style: kPageTitleStyle.copyWith(fontFamily: 'TajawalBold')),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 8),
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    color: AppColors.orangeColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    'الغاء',
                    style: kSubtitleStyle.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onPressed: () {
                 Navigator.pop(context);
                  },
                ),
              ),
              Container(height: 35, width: 2, color: AppColors.whiteColor),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 8),
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    color: AppColors.orangeColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    'تأكيد',
                    style: kSubtitleStyle.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onPressed: () {
                    logout();
                    logOutViaEmail();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void logout() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sharedPref.remove(userId);
  sharedPref.remove(userName);
  sharedPref.remove(userEmail);
  sharedPref.remove(userImage);
  sharedPref.clear();
  Get.off(()=>HomeScreen());
}

Future logOutViaEmail() async {
  return firebaseAuth.signOut();
}