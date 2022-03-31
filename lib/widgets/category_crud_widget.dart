import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/icon_broken.dart';
import 'package:computer_maintenance/views/category_details.dart';
import 'package:computer_maintenance/views/edit_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCRUDWidget extends StatefulWidget {
  var data;

  CategoryCRUDWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<CategoryCRUDWidget> createState() => _CategoryCRUDWidgetState();
}

class _CategoryCRUDWidgetState extends State<CategoryCRUDWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        elevation: 10.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 130,
          width: 180,
          margin: const EdgeInsets.all(14),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Text(
                            widget.data['title'],
                            style: kTitleStyle.copyWith(
                              fontSize: 20,
                              color: AppColors.orangeColor,
                              fontFamily: 'TajawalBold',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.data['subtitle'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kSubtitleStyle.copyWith(
                              height: 1.4,
                              fontSize: 14,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Container(
                    //     padding: EdgeInsets.all(10),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: AppColors.greyColor.withOpacity(0.2),
                    //     ),
                    //     child: Image.asset(
                    //       widget.data['image'],
                    //       height: 50,
                    //       width: 50,
                    //     )),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              'اقرأ المزيد',
                              style: kSubtitleStyle.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            onPressed: () {
                              Get.to(
                                ()=>CategoryDetails(data: widget.data),
                                transition: Transition.fadeIn,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.only(right: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.greyColor.withOpacity(0.2),
                              ),
                              child: IconButton(
                                icon: const Icon(IconBroken.Edit_Square),
                                onPressed: () {
                                  Get.to(
                                        ()=>EditCategory(data:  widget.data),
                                    transition: Transition.fadeIn,
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.greyColor.withOpacity(0.2),
                              ),
                              child: IconButton(
                                icon: const Icon(IconBroken.Delete,
                                    color: AppColors.orangeColor),
                                onPressed: () {
                                  deleteCategoryData(widget.data['title']);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future deleteCategoryData(String title) async {
  print('done');
  return FirebaseFirestore.instance.collection('category').doc(title).delete();
}
