import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/controller_app.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/localization/changelanguage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';

import '../../../customWidgets/custom_text.dart';

class OrdersPerformedList extends StatelessWidget {
  const OrdersPerformedList({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());
    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showThePerformedList.value,
            child: SafeArea(
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
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                                child: Column(children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "241-الأعمال المنجزة".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              FutureBuilder(
                                  future: homeController.getMyOrdersPerformed(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return controller.isHaveTheOrdersPerformed
                                                  .value ==
                                              false
                                          ? Center(
                                              child: Text(
                                                "242-لاتمتلك اي اي اعمال منجزة لعرضها"
                                                    .tr,
                                                style: TextStyle(
                                                  height: 1.5.h,
                                                  color: AppColors.blackColor,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          : Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 600.h,
                                              color:
                                                  AppColors.whiteColorTypeTwo,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: snapshot
                                                      .data['data'].length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, i) {
                                                    return PaddingCustom(
                                                      theBottom: 10,
                                                      theTop: 10,
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: ContainerCustom(
                                                          theBorderRadius: 10,
                                                          colorContainer:
                                                              AppColors
                                                                  .whiteColor,
                                                          heigthContainer: 120,
                                                          widthContainer:
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          10.h),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        20.h,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "14-نوع الخدمة:"
                                                                              .tr,
                                                                          style:
                                                                              TextStyle(
                                                                            height:
                                                                                1.5.h,
                                                                            color:
                                                                                AppColors.blackColor,
                                                                            fontFamily:
                                                                                AppTextStyles.Almarai,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              2.w,
                                                                        ),
                                                                        GetX<ChangeLanguageToLocale>(
                                                                            builder: (scontroller) => scontroller.isChange.value == false
                                                                                ? Text(
                                                                                    snapshot.data['data'][i]['services_main_name_ar'],
                                                                                    style: TextStyle(color: AppColors.blackColor, fontFamily: AppTextStyles.Almarai, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                                                                  )
                                                                                : Text(
                                                                                    snapshot.data['data'][i]['services_main_name_en'],
                                                                                    style: TextStyle(color: AppColors.blackColor, fontFamily: AppTextStyles.Almarai, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                                                                  )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 7.w),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              "244-رقم العملية:".tr,
                                                                              style: TextStyle(
                                                                                color: AppColors.balckColorTypeThree,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 2.w,
                                                                            ),
                                                                            Text(
                                                                              snapshot.data['data'][i]['order_number'],
                                                                              style: TextStyle(
                                                                                color: AppColors.yellowColor,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 7.w),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              "245-الأجمالي:".tr,
                                                                              style: TextStyle(
                                                                                color: AppColors.balckColorTypeThree,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            Text(
                                                                              "AED",
                                                                              style: TextStyle(
                                                                                color: AppColors.balckColorTypeThree,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 2.w,
                                                                            ),
                                                                            Text(
                                                                              snapshot.data['data'][i]['price_totle'],
                                                                              style: TextStyle(
                                                                                color: AppColors.blackColor,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  Container(
                                                                    color: Colors
                                                                        .black,
                                                                    height:
                                                                        0.7.h,
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child:
                                                                        Directionality(
                                                                      textDirection:
                                                                          TextDirection
                                                                              .rtl,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Directionality(
                                                                              textDirection: TextDirection.rtl,
                                                                              child: Text(
                                                                                snapshot.data['data'][i]['order_time'],
                                                                                style: TextStyle(color: AppColors.blackColor, fontFamily: AppTextStyles.Almarai, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                                                              )),
                                                                          SizedBox(
                                                                            width:
                                                                                2.w,
                                                                          ),
                                                                          Text(
                                                                            snapshot.data['data'][i]['order_date'],
                                                                            style: TextStyle(
                                                                                color: AppColors.blackColor,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 14.sp,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
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
                                                                    theTop: 30,
                                                                    child:
                                                                        TextCustom(
                                                                      theText:
                                                                          "19-يتم التحميل"
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
                                                                      "19-يتم التحميل"
                                                                          .tr,
                                                                      maxLines:
                                                                          4,
                                                                      style: TextStyle(
                                                                          fontSize: 14
                                                                              .sp,
                                                                          height: 1.7
                                                                              .h,
                                                                          color: AppColors
                                                                              .balckColorTypeThree,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai),
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
                                                                            AppColors.theMainColor,
                                                                        theBorderRadius:
                                                                            15,
                                                                        heigthContainer:
                                                                            15.h,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 8.h),
                                                                          child:
                                                                              Text(
                                                                            "19-يتم التحميل".tr,
                                                                            style:
                                                                                TextStyle(
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
                            ]))),
                      ))
                ],
              ),
            )));
  }
}
