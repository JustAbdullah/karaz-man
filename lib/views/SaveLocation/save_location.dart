import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:services_man_karaz/core/constant/images_path.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_text.dart';

class SaveLocation extends StatelessWidget {
  const SaveLocation({super.key});

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
                  "اضغط على الزر لحفظ ومشاهدة موقعك الحالي لعرض الطلبات القريبة منك.."
                      .tr,
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
                  appController.askPermissionOfLocation();
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
                        theText: "فحص وحفظ الموقع",
                        fontSizeWidth: 20,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.whiteColor),
                  ),
                ),
              ),
            ),
          ),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.loadingTheLocationAndSave.value,
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
                    Align(
                        alignment: Alignment.center,
                        child: Lottie.asset(ImagesPath.loadingAppOpeartions))
                  ])))
        ],
      ),
    );
  }
}
