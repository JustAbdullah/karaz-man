import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:services_man_karaz/views/LoadingScreen/loading_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../core/localization/changelanguage.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../langScreen/choose_language.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                    theText: "208-طلب إنشاء حساب".tr,
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
                    "209-قم بملا النموذج التالي".tr,
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
                  labelData: "210-الاسم".tr,
                  hintData: "211-قم بإضافة الاسم".tr,
                  iconData: Icons.person,
                  controllerData: appController.name,
                  value: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    appController.nameText = value.toString();

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
                    appController.nameText = value.toString();
                    return value;
                  },
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormFiledCustom(
                  labelData: "212-رقم الهاتف".tr,
                  hintData: "213-قم بإدخال رقم الهاتف".tr,
                  iconData: Icons.phone_android,
                  controllerData: appController.phone,
                  value: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    appController.phoneText = value.toString();

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
                    appController.phoneText = value.toString();
                    return value;
                  },
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormFiledCustom(
                  labelData: "214-رقم الهوية".tr,
                  hintData: "215-قم بإدخال رقم الهوية".tr,
                  iconData: Icons.camera_front_outlined,
                  controllerData: appController.id,
                  value: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    appController.IdText = value.toString();

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
                    appController.IdText = value.toString();
                    return value;
                  },
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormFiledCustom(
                  labelData: "216-كلمة السر".tr,
                  hintData: "217-قم بإدخال كلمة السر".tr,
                  iconData: Icons.password,
                  controllerData: appController.password,
                  value: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    appController.PasswordText = value.toString();

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
                    appController.PasswordText = value.toString();
                    return value;
                  },
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  appController.chooseTheTypeWork.value = true;
                },
                child: ContainerCustom(
                  colorContainer: AppColors.theMainColor,
                  widthContainer: 200,
                  heigthContainer: 40,
                  child: Center(
                    child: Text(
                      "218-تحديد نوع العمل".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GetX<ChangeLanguageToLocale>(
                  builder: (scontroller) => scontroller.isChange.value == false
                      ? GetX<ControllerApp>(
                          builder: (controller) => Text(
                                controller.TextOFTypeWork.value.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ))
                      : GetX<ControllerApp>(
                          builder: (controller) => Text(
                                controller.TextOFTypeWorkEn.value.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ))),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                  onTap: () async {
                    XFile? xfile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (xfile != null) {
                      Random random = new Random();
                      int randomNumber = random.nextInt(10000000);
                      File myfile = await File(xfile!.path);

                      String dir =
                          (await getApplicationDocumentsDirectory()).path;
                      String newPath = path.join(dir, '$randomNumber.jpg');
                      File f = await File(myfile.path).copy(newPath);

                      Timer.periodic(Duration(seconds: 1), (Timer timer) {
                        // ignore: unnecessary_null_comparison
                        if (myfile == null) {
                        } else {
                          if (appController.isChooesImage.value == false) {
                            setState(() {});

                            appController.upIm(f);
                            setState(() {
                              appController.filename = basename(f.path);
                            });
                            appController.addImageWork.value = true;
                            appController.isChooesImage.value = true;
                          } else {}
                        }
                      });
                    } else {}

                    /*   await Future.delayed(Duration(seconds: 15),
                                          () async {
                                        controller.upIm(myfile);
                                        setState(() {
                                          controller.filename =
                                              basename(myfile.path);
                                        });
                                        setState(() {});
                                      });*/
                  },
                  child: GetX<ControllerApp>(
                    builder: (controller) => ContainerCustom(
                      colorContainer: controller.isChooesImage.value
                          ? AppColors.redColor
                          : AppColors.theMainColor,
                      widthContainer: 280,
                      heigthContainer: 40,
                      child: Center(
                        child: controller.isChooesImage.value
                            ? Text(
                                "تم رفع صورة الرخصة التجارية".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                "219-رفع صورة الرخصة التجارية".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  appController.createAccount(
                      appController.nameText.toString(),
                      appController.phoneText.toString(),
                      appController.IdText.toString(),
                      appController.PasswordText.toString(),
                      appController.theType.toString(),
                      appController.filename.toString());
                },
                child: ContainerCustom(
                  colorContainer: AppColors.yellowColor,
                  widthContainer: 250,
                  heigthContainer: 40,
                  child: Center(
                    child: Text(
                      "220-إنشاء الحساب الان".tr,
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
                  visible: controller.waitCreateAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.waitCreateAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.waitCreateAccount.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.loadingAppOpeartions,
                            width: 140.w),
                        Text(
                          "221-انتظر قليلاً يتم رفع البيانات".tr,
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
                  visible: controller.isAddedTheAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isAddedTheAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.isAddedTheAccount.value,
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
                              "222-عزيزي الفني لقد تم رفع البيانات بنجاح..سيتم الفحص والمراجعة وإشعارك بالنتائج"
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
                              appController.isAddedTheAccount.value = false;
                              Get.to(ChooseLanguage());
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
          ///////////////////////////////////////////////
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.chooseTheTypeWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.chooseTheTypeWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),

          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.chooseTheTypeWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: FutureBuilder(
                        future: controller.getMainType(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 200.h,
                              color: AppColors.whiteColorTypeTwo,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data['data'].length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return PaddingCustom(
                                        theBottom: 14,
                                        theLeft: 13,
                                        theRight: 13,
                                        theTop: 14,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: InkWell(
                                              onTap: () {
                                                controller.theType = int.parse(
                                                    snapshot.data['data'][i]
                                                            ['services_main_id']
                                                        .toString());
                                                controller.TextOFTypeWork
                                                    .value = snapshot.data[
                                                        'data'][i][
                                                        'services_main_name_ar']
                                                    .toString();
                                                controller.TextOFTypeWorkEn
                                                    .value = snapshot.data[
                                                        'data'][i][
                                                        'services_main_name_en']
                                                    .toString();
                                                controller.chooseTheTypeWork
                                                    .value = false;
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.h,
                                                      horizontal: 1.w),
                                                  child: GetX<
                                                      ChangeLanguageToLocale>(
                                                    builder: (scontroller) =>
                                                        scontroller.isChange
                                                                    .value ==
                                                                false
                                                            ? Text(
                                                                snapshot.data[
                                                                        'data'][i]
                                                                    [
                                                                    'services_main_name_ar'],
                                                                style:
                                                                    TextStyle(
                                                                  height: 1,
                                                                  color: AppColors
                                                                      .blackColor,
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 1,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )
                                                            : Text(
                                                                snapshot.data[
                                                                        'data'][i]
                                                                    [
                                                                    'services_main_name_en'],
                                                                style:
                                                                    TextStyle(
                                                                  height: 1,
                                                                  color: AppColors
                                                                      .blackColor,
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 1,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                  ),
                                                ),
                                              )),
                                        ));
                                  }),
                            );
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 15,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return Shimmer.fromColors(
                                      baseColor: Color.fromARGB(31, 83, 82, 82),
                                      highlightColor: AppColors.whiteColor,
                                      enabled: true,
                                      child: PaddingCustom(
                                        theTop: 10,
                                        theBottom: 10,
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  width: 200.w,
                                                  height: 20.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                ))),
                                      ));
                                });
                          }
                        }),
                  ))),

          //////////
        ],
      )),
    );
  }
}
