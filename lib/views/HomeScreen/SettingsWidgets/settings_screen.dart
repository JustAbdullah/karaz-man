import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ControllerApp>(
      builder: (controller) => Visibility(
        visible: controller.showTheSettings.value,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black38,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black38,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      height: 300.h,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showTheSettings.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.theMainColorTwo,
                                    shape: BoxShape.rectangle),
                                width: 50.w,
                                height: 20.h,
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "60-الإعدادت".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.showTheAccountInfo.value = true;
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "61-معلومات الحساب".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.aboutLocation.value = true;
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "62-موقعي".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.showLang.value = true;
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "63-اللغة".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                        ]),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
