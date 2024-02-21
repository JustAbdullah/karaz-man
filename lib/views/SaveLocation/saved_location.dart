import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:services_man_karaz/core/constant/images_path.dart';
import 'package:services_man_karaz/views/HomeScreen/home_screen.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_text.dart';

class SaveeLocation extends StatelessWidget {
  const SaveeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp appController = Get.put(ControllerApp());

    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "75-تم الحفظ بنجاح".tr,
                  style: TextStyle(
                      height: 1.3.h,
                      fontSize: 16.sp,
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.balckColorTypeFour),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 70.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Container(
                  width: 300.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.theMainColorTwo,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: TextCustom(
                        theText: "الانتقال الان".tr,
                        fontSizeWidth: 20,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.whiteColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
