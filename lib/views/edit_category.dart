import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computer_maintenance/shared/app_colors.dart';
import 'package:computer_maintenance/shared/app_text_style.dart';
import 'package:computer_maintenance/shared/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EditCategory extends StatefulWidget {
  var data;
   EditCategory({required data,Key? key}) : super(key: key);

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.data['title'];
    subTitleController.text = widget.data['subtitle'];
    imagePathController.text = widget.data['image'];
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
              Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.orangeColor,
                        style: kTitleStyle,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "عنوان التصنيف",
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        textAlign: TextAlign.start,
                        controller: subTitleController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: kSubtitleStyle.copyWith(height: 1.5),
                        cursorColor: AppColors.orangeColor,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                          labelText: 'شرح عن التصنيف',
                          labelStyle: kTitleStyle,
                          prefixIcon: const Icon(IconBroken.Info_Circle,
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
                                    'تعديل التصنيف',
                                    style: kSubtitleStyle.copyWith(
                                        color: AppColors.whiteColor),
                                  ),
                                  onPressed: () {
                                    editCategory(
                                        titleController.text, {
                                      'title': titleController.text,
                                      'subtitle': subTitleController.text,
                                      'image': 'assets/images/clue.png',
                                    }).whenComplete(() {
                                      Navigator.pop(context);
                                    });
                                  }),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future editCategory(String title, dynamic data) async {
  return FirebaseFirestore.instance
      .collection('category')
      .doc(title)
      .update(data);
}
