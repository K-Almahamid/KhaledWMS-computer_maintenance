import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/icon_broken.dart';
import 'package:computer_maintenance/views/add_category.dart';
import 'package:computer_maintenance/widgets/category_crud_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCRUD extends StatefulWidget {
  const CategoryCRUD({Key? key}) : super(key: key);

  @override
  State<CategoryCRUD> createState() => _CategoryCRUDState();
}

class _CategoryCRUDState extends State<CategoryCRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text('إدارة التصنيفات',
              style: kPageTitleStyle.copyWith(fontSize: 20)),
          leading: IconButton(
            icon: Icon(
              IconBroken.Arrow___Left,
              color: AppColors.blackColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  IconBroken.Paper_Plus,
                  color: AppColors.orangeColor,
                  size: 25,
                ),
              onPressed: () {
                  Get.to(()=>AddCategory());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
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
                    return Container(
                      height: 1000,
                      width: 800,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot documentSnapshot) {
                                  Map<String, dynamic> data = documentSnapshot
                                      .data()! as Map<String, dynamic>;
                                  return CategoryCRUDWidget(data: data);
                                }).toList()),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
