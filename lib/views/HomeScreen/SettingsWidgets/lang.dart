import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';
import '../../../core/localization/changelanguage.dart';
import '../../../customWidgets/custom_padding.dart';

class Lang extends StatelessWidget {
  const Lang({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeLanguageToLocale =
        Get.put(ChangeLanguageToLocale());
    ControllerApp controllerTheApp = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showLang.value,
            child: Stack(children: [
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
              Container(
                  color: AppColors.whiteColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PaddingCustom(
                            theTop: 140.h,
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "70-قم بإختيار اللغة المناسبة لك من الخيارات التالية"
                                        .tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 16,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.showLang.value = false;
                              changeLanguageToLocale.changeLang("ar");
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: AppColors.theMainColor,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 10.h),
                                  child: Text(
                                    "71-اللغة العربية-الأختيار".tr,
                                    style: TextStyle(
                                        height: 1.6.h,
                                        fontSize: 15,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.showLang.value = false;
                              changeLanguageToLocale.changeLang("bi");
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: AppColors.theMainColor,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 10.h),
                                  child: Text(
                                    "72-اللغة الاردية-الأختيار".tr,
                                    style: TextStyle(
                                        height: 1.6.h,
                                        fontSize: 15,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.showLang.value = false;
                              changeLanguageToLocale.changeLang("be");
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: AppColors.theMainColor,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 10.h),
                                  child: Text(
                                    "73-اللغة البنغلادشية-الأختيار".tr,
                                    style: TextStyle(
                                        height: 1.6.h,
                                        fontSize: 15,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 200.h,
                          ),
                        ]),
                  )),

              /////////////////..............Loading to Take The Location........../////////////////
            ])));
  }
}
