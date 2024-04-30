import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:services_man_karaz/views/HomeScreen/home_screen.dart';
import 'package:services_man_karaz/views/LoginScreen/login_screen.dart';
import 'package:services_man_karaz/views/createAccount/create_account.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../SaveLocation/save_location.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp appController = Get.put(ControllerApp());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 80.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: TextCustom(
                    theText: "234-إعادة تعيين رمز الدخول".tr,
                    fontSizeWidth: 23,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.blackColorsTypeOne),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Text(
                    "235-قم بإدخال رمز الدخول الجديد".tr,
                    style: TextStyle(
                        height: 1.5.h,
                        fontSize: 15.5.sp,
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.balckColorTypeThree),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormFiledCustom(
                  labelData: "3-رمز الدخول".tr,
                  hintData: "3-رمز الدخول".tr,
                  iconData: Icons.password,
                  controllerData: appController.newPassword,
                  value: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    appController.newPasswordAdd = value.toString();

                    return value;
                  },
                  fillColor: AppColors.whiteColor,
                  hintColor: AppColors.theMainColor,
                  iconColor: AppColors.theMainColor,
                  borderSideColor: AppColors.whiteColor,
                  fontColor: AppColors.balckColorTypeThree,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  autofillHints: [AutofillHints.name],
                  onChanged: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    appController.newPasswordAdd = value.toString();
                    return value;
                  },
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.3.h,
                  color: AppColors.blackColorTypeTeo,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  appController.editPassword(
                      appController.phoneFetchData.toString(),
                      appController.idFetchData.toString(),
                      appController.newPasswordAdd.toString());
                },
                child: ContainerCustom(
                  colorContainer: AppColors.theMainColor,
                  widthContainer: 200,
                  heigthContainer: 40,
                  child: Center(
                    child: Text(
                      "236-التعديل الان".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.waitEditPasswordAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.waitEditPasswordAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.waitEditPasswordAccount.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.loadingAppOpeartions,
                            width: 140.w),
                        Text(
                          "237-انتظر قليلاً يتم حفظ البيانات".tr,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isEditNewPassword.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isEditNewPassword.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isEditNewPassword.value,
                  child: PaddingCustom(
                    theTop: 190.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(ImagesPath.successfully, width: 140.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "238-عزيزي المستخدم لقد تم تعديل البيانات بنجاح,,قم بتسجيل دخولك الان"
                                  .tr,
                              style: TextStyle(
                                height: 1.7.h,
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              appController.isEditNewPassword.value = false;
                              Get.offAll(Login());
                            },
                            child: ContainerCustom(
                              widthContainer: 200.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.yellowColor,
                              child: Center(
                                child: TextCustom(
                                    theText: "7-التوجة الان".tr,
                                    fontSizeWidth: 20,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeThree),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isNotEditNewPassword.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isNotEditNewPassword.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isNotEditNewPassword.value,
                  child: PaddingCustom(
                    theTop: 190.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "239-عزيزي المستخدم نأسف على ذلك ولكن لم تتمكن من تعديل البيانات"
                                  .tr,
                              style: TextStyle(
                                height: 1.7.h,
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                              onTap: () {
                                appController.isNotEditNewPassword.value =
                                    false;
                                Get.offAll(Login());
                              },
                              child: ContainerCustom(
                                widthContainer: 200.w,
                                heigthContainer: 30,
                                colorContainer: AppColors.yellowColor,
                                child: Center(
                                  child: TextCustom(
                                      theText: "240-العودة".tr,
                                      fontSizeWidth: 20,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.balckColorTypeThree),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ))),
        ],
      )),
    );
  }
}
