import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:services_man_karaz/core/constant/images_path.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/controller_app.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/localization/changelanguage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class OrderListMainNew extends StatelessWidget {
  const OrderListMainNew({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheDetails.value,
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
                            offset: Offset(0, 3), // changes position of shadow
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
                                    child: Image.asset(ImagesPath.theTrueIcon),
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
                                color: AppColors.balckColorTypeFour,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.balckColorTypeFour,
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Text(
                                    "2".tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )),
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
                                      color: controller.countTheStypes.value > 2
                                          ? AppColors.theMainColor
                                          : AppColors.balckColorTypeFour,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: controller.countTheStypes.value > 2
                                        ? Text(
                                            "3".tr,
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                        : Center(
                                            child: Image.asset(
                                                ImagesPath.theTrueIcon),
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
                                      color: controller.countTheStypes.value > 3
                                          ? AppColors.theMainColor
                                          : AppColors.balckColorTypeFour,
                                      shape: BoxShape.circle),
                                  child: controller.countTheStypes.value > 3
                                      ? Center(
                                          child: Text(
                                          "4".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ))
                                      : Center(
                                          child: Image.asset(
                                              ImagesPath.theTrueIcon),
                                        ),
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

                    SizedBox(
                      height: 10.h,
                    ),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.theMainColor),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        )
                                      : Text(
                                          controller.nameOfMainTypeOrderEn
                                              .toString(),
                                          style: TextStyle(
                                              height: 1.3.h,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.theMainColor),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        )),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Container(
                          height: 70.h,
                          child: FutureBuilder(
                              future: homeController.getSubOfOrders(
                                  controller.numberOfOrder.toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return controller
                                              .isHaveTheUserSubOrders.value ==
                                          false
                                      ? Center(
                                          child: Text(
                                            "65-لاتمتلك اي تفرعات لعرضها".tr,
                                            style: TextStyle(
                                              height: 1.5.h,
                                              color: AppColors.blackColor,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              snapshot.data['data'].length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, i) {
                                            return PaddingCustom(
                                              theTop: 5.h,
                                              theBottom: 5.h,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: Container(
                                                  width: MediaQuery.of(context)
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
                                                            GetX<
                                                                    ChangeLanguageToLocale>(
                                                                builder: (scontroller) =>
                                                                    scontroller.isChange.value ==
                                                                            false
                                                                        ? Text(
                                                                            snapshot.data['data'][i]['sub_type_name_ar'],
                                                                            style: TextStyle(
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            snapshot.data['data'][i]['sub_type_name_en'],
                                                                            style: TextStyle(
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                            GetX<
                                                                    ChangeLanguageToLocale>(
                                                                builder: (scontroller) =>
                                                                    scontroller.isChange.value ==
                                                                            false
                                                                        ? Center(
                                                                            child:
                                                                                Text(
                                                                              snapshot.data['data'][i]['name_type_sub'],
                                                                              style: TextStyle(fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          )
                                                                        : Center(
                                                                            child:
                                                                                Text(
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
                                                                height: 1.3.h,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .balckColorTypeFour),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          Text(
                                                            snapshot.data[
                                                                    'data'][i][
                                                                'price_type_sub'],
                                                            style: TextStyle(
                                                                height: 1.3.h,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .balckColorTypeFour),
                                                            textAlign: TextAlign
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h),
                                              child: PaddingCustom(
                                                theBottom: 10,
                                                child: ContainerCustom(
                                                  theBorderRadius: 10,
                                                  colorContainer:
                                                      AppColors.whiteColor,
                                                  heigthContainer: 130,
                                                  widthContainer:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 10.h,
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
                                                                theTop: 30,
                                                                child:
                                                                    TextCustom(
                                                                  theText:
                                                                      "6-يتم التحميل"
                                                                          .tr,
                                                                  fontColor:
                                                                      AppColors
                                                                          .blackColor,
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai,
                                                                  fontSizeWidth:
                                                                      18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 150.w,
                                                              height: 100.h,
                                                              child:
                                                                  PaddingCustom(
                                                                theTop: 15,
                                                                child: Text(
                                                                  "6-يتم التحميل"
                                                                      .tr,
                                                                  maxLines: 4,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      height:
                                                                          1.7.h,
                                                                      color: AppColors
                                                                          .balckColorTypeThree,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                    Alignment
                                                                        .topCenter,
                                                                child:
                                                                    PaddingCustom(
                                                                  theTop: 5,
                                                                  child:
                                                                      ContainerCustomApi(
                                                                    colorContainer:
                                                                        AppColors
                                                                            .theMainColor,
                                                                    theBorderRadius:
                                                                        15,
                                                                    heigthContainer:
                                                                        15.h,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              8.h),
                                                                      child:
                                                                          Text(
                                                                        "6-يتم التحميل"
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          fontSize:
                                                                              14,
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Container(
                          color: Colors.black,
                          height: 0.7.h,
                          width: MediaQuery.of(context).size.width,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Container(
                          color: AppColors.balckColorTypeThree,
                          height: 0.1.h,
                          width: MediaQuery.of(context).size.width,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: AppColors.balckColorTypeThree,
                                      fontSize: 14.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "AED",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeThree,
                                      fontSize: 14.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 15.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Container(
                          color: Colors.black,
                          height: 0.7.h,
                          width: MediaQuery.of(context).size.width,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 15.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          controller.theWayToPayTheOrder == "1"
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 5.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          controller.theWayToPayTheOrder == "2"
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
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 15.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Container(
                          color: Colors.black,
                          height: 0.7.h,
                          width: MediaQuery.of(context).size.width,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 15.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Text(
                                "193-الجدولة المختارة".tr,
                                style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 10.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  controller.dateOfOrder.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeThree,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 5.h,
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  controller.timeOfOrder.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeThree,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Visibility(
                        visible: controller.showTheConfOrder.value,
                        child: SizedBox(
                          height: 25.h,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseTheOrder(
                                    controller.idOfOrder.toString());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.theMainColor,
                                      border: Border.all(
                                        color: AppColors
                                            .theMainColor, //                   <--- border color
                                        width: 1.5,
                                      )),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Text(
                                      "195-استلام العمل".tr,
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
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                controller.showTheDetails.value = false;
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.whiteColor,
                                      border: Border.all(
                                        color: AppColors
                                            .theMainColor, //                   <--- border color
                                        width: 1.5,
                                      )),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Text(
                                      "196-الرفض".tr,
                                      style: TextStyle(
                                          height: 2.h,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///////////////////////////////////////
                  ],
                )),
              )
            ])));
  }
}
