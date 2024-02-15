import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/controller_app.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ControllerApp>(
        builder: (controller) => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: AppColors.whiteColor,
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.showTheOrderPage.value = true;
                          controller.showMyTheOrderPage.value = false;
                          controller.showTheSettings.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: controller.showTheOrderPage.value
                                  ? AppColors.theMainColor
                                  : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7)),
                          width: 100.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              "الطلبات العامة",
                              style: TextStyle(
                                height: 1.5.h,
                                color: AppColors.blackColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          controller.showMyTheOrderPage.value = true;
                          controller.showTheOrderPage.value = false;
                          controller.showTheSettings.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: controller.showMyTheOrderPage.value
                                  ? AppColors.theMainColor
                                  : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7)),
                          width: 100.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              "طلباتك",
                              style: TextStyle(
                                height: 1.5.h,
                                color: AppColors.blackColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          controller.showTheSettings.value = true;
                          controller.showTheOrderPage.value = false;
                          ;
                          controller.showMyTheOrderPage.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: controller.showTheSettings.value
                                  ? AppColors.theMainColor
                                  : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7)),
                          width: 100.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              "الاعدادت",
                              style: TextStyle(
                                height: 1.5.h,
                                color: AppColors.blackColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
