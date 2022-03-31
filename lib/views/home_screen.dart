import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/app_variables.dart';
import 'package:computer_maintenance/shared/icon_broken.dart';
import 'package:computer_maintenance/views/category_crud.dart';
import 'package:computer_maintenance/views/category_details.dart';
import 'package:computer_maintenance/widgets/category_card_widget.dart';
import 'package:computer_maintenance/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? tabController;
  String time = '';
  bool loggedIn = false;

  greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      time = 'صباح الخير';
    } else {
      time = 'مساء الخير';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 12, vsync: this);
    greeting();
    userNameValue != '' ? loggedIn = true : loggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();

    List<String> categoryTitle = [
      "مقدمة في أساسيات الحاسوب",
      "نصائح حول العناية بالحاسوب",
      "أعطال أجهزة الإدخال",
      "أعطال أجهزة الإخراج",
      "أعطال وحدة المعالجة المركزية",
      "أعطال ذاكرة الوصول العشوائي",
      "أعطال القرص الصلب",
      "أعطال اللوحة الأم",
      "أعطال كرت الشاشة",
      " أعطال محرك الأقراص المضغوطة",
      "أعطال وحدة التغذية",
    ];
    List<String> categorySubTitle = [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ];
    List<String> categoryImages = [
      'assets/icons/presentation.png',
      'assets/icons/idea.png',
      'assets/icons/keyboard.png',
      'assets/icons/printer.png',
      'assets/icons/cpu.png',
      'assets/icons/memory.png',
      'assets/icons/hard-drive.png',
      'assets/icons/motherboard.png',
      'assets/icons/graphic-card.png',
      'assets/icons/cd.png',
      'assets/icons/power-supply.png',
    ];

    List categoryPageName = [
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
      // () => const CategoryDetails(),
    ];

    return DefaultTabController(
      length: 12,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: _keyDrawer,
          drawer: const MyDrawer(),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  centerTitle: true,
                  toolbarHeight: 70,
                  backgroundColor: AppColors.whiteColor,
                  leading: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: Image.asset('assets/images/menu.png',
                          color: AppColors.orangeColor),
                      onTap: () {
                        _keyDrawer.currentState!.openDrawer();
                      },
                    ),
                  ),
                  title: Text(
                    // "$time, " + 'آلاء',
                    time,
                    style: kPageTitleStyle.copyWith(
                        fontFamily: 'TajawalBold', fontSize: 20),
                  ),
                  actions: [
                    IconButton(
                        icon: const Icon(
                          IconBroken.Paper_Upload,
                          color: AppColors.orangeColor,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.to(() => const CategoryCRUD());
                        })
                  ],
                  bottom: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelColor: AppColors.blackColor,
                    unselectedLabelColor: AppColors.greyColor,
                    physics: const ClampingScrollPhysics(),
                    labelStyle: kTitleStyle,
                    indicatorColor: AppColors.orangeColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.only(left: 15, right: 15),
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    tabs: const [
                      Tab(text: 'الكل'),
                      Tab(text: 'مقدمة'),
                      Tab(text: 'العناية بالحاسوب'),
                      Tab(text: 'الإدخال'),
                      Tab(text: 'الإخراج'),
                      Tab(text: 'القرص الصلب'),
                      Tab(text: 'وحدة المعالجة المركزية'),
                      Tab(text: 'ذاكرة الوصول العشوائي'),
                      Tab(text: 'اللوحة الأم'),
                      Tab(text: 'كرت الشاشة'),
                      Tab(text: 'محرك الأقراص المضغوطة'),
                      Tab(text: 'وحدة تزويد الطاقة'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: tabController,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('category')
                        .orderBy('title')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Something went wrong');
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('waiting');
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.orangeColor,
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot documentSnapshot) {
                                    Map<String, dynamic> data = documentSnapshot
                                        .data()! as Map<String, dynamic>;
                                    return CategoryCardWidget(
                                        title: data['title'],
                                        subtitle: data['subtitle'],
                                        image: data['image'],
                                        movePage: () =>
                                            CategoryDetails(data: data));
                                  }).toList()),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: width / 1,
                        height: height / 3.8,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:  AssetImage('assets/images/home.jpg'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.0,
                        right: 20.0,
                        child: Text(
                          'نسعى لخدمتكم',
                          style: kPageTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width / 1,
                    height: height / 3.8,
                    child: Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.only(right: 18.0, top: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Text('مقدمة في أساسيات الحاسوب'),
                    ),
                  ),
                ],
              ),
 */

/*
      Container(
                  width: double.infinity,height: height,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categoryPageName.length,
                    itemBuilder: (context, int index) => CategoryCardWidget(
                      title: categoryTitle[index],
                      subtitle: categorySubTitle[index],
                      image: categoryImages[index],
                      movePage: categoryPageName[index],
                    ),
                  ),
                ),
 */
