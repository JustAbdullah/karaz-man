import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:services_man_karaz/core/constant/images_path.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as m;

import '../../../controllers/controller_app.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/localization/changelanguage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class MyOrderListMainNew extends StatefulWidget {
  const MyOrderListMainNew({super.key});

  @override
  State<MyOrderListMainNew> createState() => _MyOrderListMainNewState();
}

class _MyOrderListMainNewState extends State<MyOrderListMainNew> {
  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());

    return GetX<ControllerApp>(
      builder: (controller) => Visibility(
          visible: controller.showMyOrderTheDetails.value,
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
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0)),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        color: AppColors.theMainColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(children: [
                            Text(
                              "197-تفاصيل الطلبية".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 16.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 80.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.theMainColor,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child:
                                          Image.asset(ImagesPath.theTrueIcon),
                                    ),
                                  ),
                                  Text(
                                    "182-المحتوى".tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.theMainColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 11.h),
                                child: Container(
                                  width: 35.w,
                                  height: 1.h,
                                  color: AppColors.theMainColor,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.theMainColor,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child:
                                          Image.asset(ImagesPath.theTrueIcon),
                                    ),
                                  ),
                                  Text(
                                    "183-القبول".tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.theMainColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 11.h),
                                child: Container(
                                  width: 35.w,
                                  height: 1.h,
                                  color: controller.countTheStypes.value > 2
                                      ? AppColors.theMainColor
                                      : AppColors.balckColorTypeFour,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.countTheStypes.value > 2
                                                ? AppColors.theMainColor
                                                : AppColors.balckColorTypeFour,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: controller.countTheStypes.value > 2
                                          ? Center(
                                              child: Image.asset(
                                                  ImagesPath.theTrueIcon),
                                            )
                                          : Text(
                                              "3".tr,
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                    ),
                                  ),
                                  Text(
                                    "184-في الطريق".tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.theMainColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 11.h),
                                child: Container(
                                  width: 35.w,
                                  height: 1.h,
                                  color: controller.countTheStypes.value > 3
                                      ? AppColors.theMainColor
                                      : AppColors.balckColorTypeFour,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.countTheStypes.value > 3
                                                ? AppColors.theMainColor
                                                : AppColors.balckColorTypeFour,
                                        shape: BoxShape.circle),
                                    child: controller.countTheStypes.value > 3
                                        ? Center(
                                            child: Image.asset(
                                                ImagesPath.theTrueIcon),
                                          )
                                        : Center(
                                            child: Text(
                                            "4".tr,
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )),
                                  ),
                                  Text(
                                    "185-الأكتمال".tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.theMainColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ),

                      /////////////////////////////////The Info..............////////////////

                      Visibility(
                          visible: controller.showTheAcceptOrder.value,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                  child: Column(children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "200-بيانات العميل".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "201-اسم العميل:".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.nameUser.toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "203-رقم الهاتف:".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.theNumberPhoneUser
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.showTheLocation.value = true;
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 200.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                            color: AppColors
                                                .theMainColor, //                   <--- border color
                                            width: 1.5,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Text(
                                          "44-مشاهدة الموقع".tr,
                                          style: TextStyle(
                                              height: 1.3.h,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.7.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      GetX<ChangeLanguageToLocale>(
                                          builder: (scontroller) => scontroller
                                                      .isChange.value ==
                                                  false
                                              ? Text(
                                                  controller.nameOfMainTypeOrder
                                                      .toString(),
                                                  style: TextStyle(
                                                      height: 1.3.h,
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .theMainColor),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                )
                                              : Text(
                                                  controller
                                                      .nameOfMainTypeOrderEn
                                                      .toString(),
                                                  style: TextStyle(
                                                      height: 1.3.h,
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .theMainColor),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: FutureBuilder(
                                      future: homeController.getSubOfOrders(
                                          controller.numberOfOrder.toString()),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return controller
                                                      .isHaveTheUserSubOrders
                                                      .value ==
                                                  false
                                              ? Center(
                                                  child: Text(
                                                    "65-لاتمتلك اي تفرعات لعرضها"
                                                        .tr,
                                                    style: TextStyle(
                                                      height: 1.5.h,
                                                      color:
                                                          AppColors.blackColor,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: snapshot
                                                      .data['data'].length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, i) {
                                                    return PaddingCustom(
                                                      theTop: 5.h,
                                                      theBottom: 5.h,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.w),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                child: Column(
                                                                  children: [
                                                                    GetX<ChangeLanguageToLocale>(
                                                                        builder: (scontroller) => scontroller.isChange.value == false
                                                                            ? Text(
                                                                                snapshot.data['data'][i]['sub_type_name_ar'],
                                                                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                textAlign: TextAlign.center,
                                                                              )
                                                                            : Text(
                                                                                snapshot.data['data'][i]['sub_type_name_en'],
                                                                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                textAlign: TextAlign.center,
                                                                              )),
                                                                    GetX<ChangeLanguageToLocale>(
                                                                        builder: (scontroller) => scontroller.isChange.value == false
                                                                            ? Center(
                                                                                child: Text(
                                                                                  snapshot.data['data'][i]['name_type_sub'],
                                                                                  style: TextStyle(fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              )
                                                                            : Center(
                                                                                child: Text(
                                                                                  snapshot.data['data'][i]['name_type_sub_en'],
                                                                                  style: TextStyle(fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              )),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "AED",
                                                                    style: TextStyle(
                                                                        height: 1.3
                                                                            .h,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            AppTextStyles
                                                                                .Almarai,
                                                                        color: AppColors
                                                                            .balckColorTypeFour),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 2.w,
                                                                  ),
                                                                  Text(
                                                                    snapshot.data[
                                                                            'data'][i]
                                                                        [
                                                                        'price_type_sub'],
                                                                    style: TextStyle(
                                                                        height: 1.3
                                                                            .h,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            AppTextStyles
                                                                                .Almarai,
                                                                        color: AppColors
                                                                            .balckColorTypeFour),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                        } else {
                                          return ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: 5,
                                              shrinkWrap: true,
                                              itemBuilder: (context, i) {
                                                return Shimmer.fromColors(
                                                    baseColor: Color.fromARGB(
                                                        31, 169, 167, 167),
                                                    highlightColor:
                                                        AppColors.whiteColor,
                                                    enabled: true,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.h),
                                                      child: PaddingCustom(
                                                        theBottom: 10,
                                                        child: ContainerCustom(
                                                          theBorderRadius: 10,
                                                          colorContainer:
                                                              AppColors
                                                                  .whiteColor,
                                                          heigthContainer: 130,
                                                          widthContainer:
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      child:
                                                                          PaddingCustom(
                                                                        theTop:
                                                                            30,
                                                                        child:
                                                                            TextCustom(
                                                                          theText:
                                                                              "6-يتم التحميل".tr,
                                                                          fontColor:
                                                                              AppColors.blackColor,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          fontSizeWidth:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          150.w,
                                                                      height:
                                                                          100.h,
                                                                      child:
                                                                          PaddingCustom(
                                                                        theTop:
                                                                            15,
                                                                        child:
                                                                            Text(
                                                                          "6-يتم التحميل"
                                                                              .tr,
                                                                          maxLines:
                                                                              4,
                                                                          style: TextStyle(
                                                                              fontSize: 14.sp,
                                                                              height: 1.7.h,
                                                                              color: AppColors.balckColorTypeThree,
                                                                              fontFamily: AppTextStyles.Almarai),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              10.h),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.topCenter,
                                                                        child:
                                                                            PaddingCustom(
                                                                          theTop:
                                                                              5,
                                                                          child:
                                                                              ContainerCustomApi(
                                                                            colorContainer:
                                                                                AppColors.theMainColor,
                                                                            theBorderRadius:
                                                                                15,
                                                                            heigthContainer:
                                                                                15.h,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                                                                              child: Text(
                                                                                "6-يتم التحميل".tr,
                                                                                style: TextStyle(
                                                                                  color: AppColors.blackColor,
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                              });
                                        }
                                      }),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.7.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "186-ملخص الدفع".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "187-سعر العناصر".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.totalOfOrder.toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "188-سعر الخصم".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  color: AppColors.balckColorTypeThree,
                                  height: 0.1.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "189-الإجمالي النهائي".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            controller.totalOfOrder.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "AED",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.7.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "190-طريقة السداد".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller
                                                          .theWayToPayTheOrder ==
                                                      "1"
                                                  ? AppColors.theMainColor
                                                  : AppColors.whiteColor,
                                              border: Border.all(
                                                color: AppColors
                                                    .theMainColor, //                   <--- border color
                                                width: 1.0,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "191-دفع-كاش".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller
                                                          .theWayToPayTheOrder ==
                                                      "2"
                                                  ? AppColors.theMainColor
                                                  : AppColors.whiteColor,
                                              border: Border.all(
                                                color: AppColors
                                                    .theMainColor, //                   <--- border color
                                                width: 1.0,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "192-دفع-اونلاين".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.sendNo(
                                                controller.tokenTheUser
                                                    .toString(),
                                                "عزيزي العميل لقد وصل الفني إلى موقعك الرجاء التواصل معه");
                                            controller.sendMessage(
                                                "عزيزي العميل لقد وصل الفني إلى موقعك الرجاء التواصل معه",
                                                controller.idUser.toString());
                                            controller.AddNotice(
                                                "لقد وصل الفني ${controller.Name.value} الى موقع العميل للقيام بالخدمة التى تحمل رقم:${controller.numberOfOrder}");
                                            controller.goToEndOrder();
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 50.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: AppColors.whiteColor,
                                                  border: Border.all(
                                                    color: AppColors
                                                        .theMainColor, //                   <--- border color
                                                    width: 1.5,
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Text(
                                                  "48-ارسال أشعار الوصول للموقع"
                                                      .tr,
                                                  style: TextStyle(
                                                      height: 1.3.h,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .balckColorTypeFour),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.canleOrder(
                                              controller.idOfOrder.toString(),
                                            );

                                            controller.AddNotice(
                                                "لقد قام الفني ${controller.Name.value} بألغاء القيام بالخدمة  التى تحمل رقم:${controller.numberOfOrder}");
                                            controller.showMyOrderTheDetails
                                                .value = false;
                                            controller.showMyTheOrderPage
                                                .value = false;
                                            controller.clear();
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 50.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: AppColors.whiteColor,
                                                  border: Border.all(
                                                    color: AppColors
                                                        .redColor, //                   <--- border color
                                                    width: 1.5,
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.w),
                                                child: Text(
                                                  "56-إلغاء العمل".tr,
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .balckColorTypeFour),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.showMyOrderTheDetails.value =
                                        false;
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.theMainColor,
                                          border: Border.all(
                                            color: AppColors
                                                .theMainColor, //                   <--- border color
                                            width: 1.5,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Text(
                                          "204-إخفاء الان".tr,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.whiteColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ])))),

                      ////////////////////////End The Order .............////////////
                      Visibility(
                          visible: controller.showEndOrder.value,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                  child: Column(children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "205-إكمال العمل".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "206-اسم العميل:".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.nameUser.toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "28-رقم الطلبية:".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.numberOfOrder.toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.7.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "186-ملخص الدفع".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "187-سعر العناصر".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.totalOfOrder.toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "188-سعر الخصم".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  color: AppColors.balckColorTypeThree,
                                  height: 0.1.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "189-الإجمالي النهائي".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            controller.totalOfOrder.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "AED",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.7.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "190-طريقة السداد".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller
                                                          .theWayToPayTheOrder ==
                                                      "1"
                                                  ? AppColors.theMainColor
                                                  : AppColors.whiteColor,
                                              border: Border.all(
                                                color: AppColors
                                                    .theMainColor, //                   <--- border color
                                                width: 1.0,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "191-دفع-كاش".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller
                                                          .theWayToPayTheOrder ==
                                                      "2"
                                                  ? AppColors.theMainColor
                                                  : AppColors.whiteColor,
                                              border: Border.all(
                                                color: AppColors
                                                    .theMainColor, //                   <--- border color
                                                width: 1.0,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "192-دفع-اونلاين".tr,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.7.h,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "246-المعلومات الإضافية".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),

                                InkWell(
                                  onTap: () {
                                    controller.endTheOrder(
                                        controller.idOfOrder.toString(),
                                        controller.tokenTheUser.toString(),
                                        "عزيزي العميل لقد أتم الفني الخدمة بنجاح نرجو ان تكون نالت على إعجابك");
                                    controller.sendMessage(
                                        "عزيزي العميل لقد أتم الفني الخدمة بنجاح نرجو ان تكون نالت على إعجابك",
                                        controller.idUser.toString());
                                    controller.showMyOrderTheDetails.value =
                                        false;
                                    controller.showMyTheOrderPage.value = false;

                                    controller.AddNotice(
                                        "لقد اتم الفني ${controller.Name.value} الخدمة بنجاح التى تحمل رقم:${controller.numberOfOrder}");

                                    controller.savePdf(
                                        controller.numberOfOrder,
                                        controller.Name.value,
                                        controller.nameUser,
                                        "${controller.totalOfOrder} AED",
                                        controller.nameOfMainTypeOrder,
                                        controller.idUser);

                                    controller.priceAfterRatio.value =
                                        (double.tryParse(
                                                    controller.totalOfOrder)! *
                                                controller.ratioS.value) /
                                            100;

                                    controller.walletNew.value =
                                        controller.priceAfterRatio.value +
                                            controller.wallet.value;

                                    controller.changeWallet(
                                        controller.walletNew.value.toString());
                                    controller.clear();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.theMainColor,
                                          border: Border.all(
                                            color: AppColors
                                                .theMainColor, //                   <--- border color
                                            width: 1.5,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Text(
                                          "49-تم العمل".tr,
                                          style: TextStyle(
                                              height: 2.h,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.whiteColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.editTheTimeAndOrderTime(
                                      controller.idOfOrder.toString(),
                                    );
                                    controller.AddNotice(
                                        "لقد قام الفني ${controller.Name.value} بتأجيل القيام بالخدمة التى تحمل رقم:${controller.numberOfOrder}");
                                    controller.sendNo(
                                        controller.tokenTheUser.toString(),
                                        "عزيزي العميل لقد تم تاجيل موعد تقديم الخدمة كونها قد تحتاج لقطع أضافية او امور أخرى");
                                    controller.sendMessage(
                                        "عزيزي العميل لقد تم تاجيل موعد تقديم الخدمة كونها قد تحتاج لقطع أضافية او امور أخرى",
                                        controller.idUser.toString());

                                    controller.showMyOrderTheDetails.value =
                                        false;
                                    controller.showMyTheOrderPage.value = false;
                                    controller.clear();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.yellowColor,
                                          border: Border.all(
                                            color: AppColors
                                                .yellowColor, //                   <--- border color
                                            width: 1.5,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Text(
                                          "55-تاجيل الموعد".tr,
                                          style: TextStyle(
                                              height: 2.h,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                PaddingCustom(
                                  theTop: 00.h,
                                  theBottom: 00.h,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "50-الخدمات الإضافية المقدمة لهذة الطلبية"
                                            .tr,
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15.sp,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeFour),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ), /////////////////////
                                GetX<ControllerApp>(
                                    builder: (Thecontroller) => FutureBuilder(
                                        future: Thecontroller.getTypeOFSubTyps(
                                            Thecontroller.idSubType.value
                                                .toString()),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Thecontroller
                                                        .isNoDataTypeOFSubTypes
                                                        .value ==
                                                    true
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                        Text(
                                                          "51-لايوجد بيانات".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: Color(
                                                                  0xFFC70039),
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      ])
                                                : Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100.h,
                                                    child: GridView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: snapshot
                                                            .data['data']
                                                            .length,
                                                        itemBuilder:
                                                            (context, i) {
                                                          return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5,
                                                                      right: 5),
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child: SizedBox(
                                                                  height: 70.h,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                            onTap:
                                                                                () {
                                                                              if (Thecontroller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString())) {
                                                                                controller.choseService.remove(snapshot.data['data'][i]['type_sub_id'].toString());

                                                                                setState(() {});
                                                                              } else {
                                                                                Thecontroller.choseService[snapshot.data['data'][i]['type_sub_id'].toString()] = snapshot.data['data'][i]['sub_type_id_key'].toString();
                                                                                setState(() {});
                                                                                /////////////
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 140.w,
                                                                              height: 40.h,
                                                                              decoration: BoxDecoration(
                                                                                  color: Thecontroller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.theMainColor : AppColors.whiteColor,
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                  border: Border.all(
                                                                                    color: AppColors.theMainColor,
                                                                                    width: 1.3,
                                                                                  )),
                                                                              child: Center(
                                                                                child: SingleChildScrollView(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                                                                    child: GetX<ChangeLanguageToLocale>(
                                                                                      builder: (scontroller) => scontroller.isChange.value == false
                                                                                          ? Text(
                                                                                              snapshot.data['data'][i]['name_type_sub'].toString(),
                                                                                              style: TextStyle(height: 1.3.h, fontSize: 15, fontFamily: AppTextStyles.Almarai, color: controller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.whiteColor : AppColors.blackColor),
                                                                                              textAlign: TextAlign.center,
                                                                                            )
                                                                                          : Text(
                                                                                              snapshot.data['data'][i]['name_type_sub_en'].toString(),
                                                                                              style: TextStyle(height: 1.3.h, fontSize: 15, fontFamily: AppTextStyles.Almarai, color: controller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.whiteColor : AppColors.blackColor),
                                                                                              textAlign: TextAlign.center,
                                                                                            ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                        },
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          childAspectRatio: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .width /
                                                              (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  5),
                                                          crossAxisCount: 3,
                                                          mainAxisSpacing: 0.0,
                                                          crossAxisSpacing: 0.0,
                                                        )),
                                                  );
                                          } else {
                                            return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50.h,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: 5,
                                                    shrinkWrap: true,
                                                    itemBuilder: (context, i) {
                                                      return Shimmer.fromColors(
                                                          baseColor:
                                                              Color.fromARGB(
                                                                  31, 83, 82, 82),
                                                          highlightColor:
                                                              AppColors
                                                                  .whiteColor,
                                                          enabled: true,
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 5,
                                                                      right: 5),
                                                              child: Shimmer
                                                                  .fromColors(
                                                                      baseColor:
                                                                          Color.fromARGB(
                                                                              31,
                                                                              83,
                                                                              82,
                                                                              82),
                                                                      highlightColor:
                                                                          AppColors
                                                                              .whiteColor,
                                                                      enabled:
                                                                          true,
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            50.h,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6),
                                                                            color: AppColors.yellowColor),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 7),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "51-لايوجد بيانات".tr,
                                                                              style: TextStyle(fontFamily: 'Cairo', color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.w500),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ))));
                                                    }));
                                          }
                                        })),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (controller.anotherTask.value == true) {
                                      controller.anotherTask.value = false;
                                    } else {
                                      controller.anotherTask.value = true;
                                    }
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: controller.anotherTask.value ==
                                                  true
                                              ? AppColors.theMainColor
                                              : AppColors.whiteColor,
                                          border: Border.all(
                                            color: AppColors
                                                .theMainColor, //                   <--- border color
                                            width: 1.5,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Text(
                                          "77-مهمة أخرى".tr,
                                          style: TextStyle(
                                              height: 2.h,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                /////////////////////////////
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.w),
                                  child: Material(
                                    elevation: 4,
                                    shadowColor: AppColors.theMainColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      controller:
                                          homeController.newPricdeCotroller,
                                      onChanged: (value) {
                                        controller.newPriceText =
                                            value.toString();
                                        SystemChrome.setEnabledSystemUIMode(
                                            SystemUiMode.manual,
                                            overlays: []);
                                      },
                                      onSaved: (newValue) {
                                        SystemChrome.setEnabledSystemUIMode(
                                            SystemUiMode.manual,
                                            overlays: []);
                                        controller.newPriceText =
                                            newValue.toString();
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "52-السعر الجديد".tr,
                                          // important line
                                          // control your hints text size
                                          hintStyle: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              letterSpacing: 0.8,
                                              color: AppColors
                                                  .balckColorTypeFour
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.bold),
                                          fillColor: Colors.white54,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide.none)),
                                      maxLines: 1,
                                      minLines: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.endTheOrderWithNewPrice(
                                        controller.idOfOrder.toString(),
                                        controller.newPriceText.toString(),
                                        controller.tokenTheUser.toString(),
                                        "عزيزي العميل لقد قام الفني بإتمام الخدمة بنجاح نرجو أن تكون نالت على إعجابك");
                                    controller.sendMessage(
                                        "عزيزي العميل لقد أتم الفني الخدمة بنجاح نرجو ان تكون نالت على إعجابك",
                                        controller.idUser.toString());
                                    controller.showMyOrderTheDetails.value =
                                        false;
                                    controller.showMyTheOrderPage.value = false;

                                    controller.AddNotice(
                                        "لقد اتم الفني ${controller.Name.value} الخدمة بنجاح التى تحمل رقم:${controller.numberOfOrder} مع إضافة تسعيرة جديدة حيث قام  بمهام مختلفة تطلب سعر جديد والسعر الجديد هو:${controller.newPriceText.toString()} ");

                                    controller.savePdf(
                                        controller.numberOfOrder,
                                        controller.Name.value,
                                        controller.nameUser,
                                        controller.newPriceText,
                                        controller.nameOfMainTypeOrder,
                                        controller.idUser);

                                    controller.priceAfterRatio.value =
                                        (double.tryParse(
                                                    controller.newPriceText)! *
                                                controller.ratioS.value) /
                                            100;

                                    controller.walletNew.value =
                                        controller.priceAfterRatio.value +
                                            controller.wallet.value;

                                    controller.changeWallet(
                                        controller.walletNew.value.toString());
                                    controller.clear();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.theMainColor,
                                          border: Border.all(
                                            color: AppColors
                                                .theMainColor, //                   <--- border color
                                            width: 1.5,
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Text(
                                          "53-تم العمل مع السعر الجديد".tr,
                                          style: TextStyle(
                                              height: 2.h,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.whiteColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ])))),
                    ],
                  ),
                ),
              ),

              ///////////////////////////////////////
            ],
          )),
    );
  }
}
