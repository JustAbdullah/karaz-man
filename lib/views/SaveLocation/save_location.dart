import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                      fontColor: AppColors.balckColorTypeThree),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
