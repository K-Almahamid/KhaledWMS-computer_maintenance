import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/views/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  Function movePage;

  CategoryCardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.movePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 230,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 20,
            child: Material(
              child: Container(
                height: 180,
                width: width * 0.92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(-10.0, 10.0),
                      blurRadius: 20,
                      spreadRadius: 4.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 30.0,
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 200,
                width: 130,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image:  DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(image),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 170,
            child: Container(
              height: 190,
              width: 180,
              child: Column(
                children: [
                  Text(
                    title,
                    style: kTitleStyle.copyWith(
                      fontSize: 20,
                      color: AppColors.orangeColor,
                      fontFamily: 'TajawalBold',
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: kSubtitleStyle.copyWith(
                      height: 1.4,
                      fontSize: 14,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 35,
                    width:width,
                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                    margin: const EdgeInsets.only(left: 80,top: 5),
                    decoration: const BoxDecoration(
                        color: AppColors.orangeColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft:  Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )
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
                        Get.to(movePage,
                          transition: Transition.fadeIn,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
