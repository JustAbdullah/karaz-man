import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:services_man_karaz/views/LoginScreen/login_screen.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../customWidgets/custom_padding.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeLanguageToLocale =
        Get.put(ChangeLanguageToLocale());
    return Scaffold(
        body: SafeArea(
      child: Container(
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
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  InkWell(
                    onTap: () {
                      Get.to(Login());
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: AppColors.theMainColorTwo,
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60.w, vertical: 10.h),
                          child: Text(
                            "74-الإنتقال".tr,
                            style: TextStyle(
                                height: 1.6.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  )
                ]),
          )),
    ));
  }
}
