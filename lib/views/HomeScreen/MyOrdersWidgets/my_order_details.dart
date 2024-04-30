// ignore_for_file: unused_element

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_padding.dart';

import '../../../../customWidgets/custom_text.dart';

class MyOrdersDetails extends StatefulWidget {
  const MyOrdersDetails({super.key});

  @override
  State<MyOrdersDetails> createState() => _MyOrdersDetailsState();
}

class _MyOrdersDetailsState extends State<MyOrdersDetails> {
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
                        child: Column(children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "24-التفاصيل النهائية للطلبية".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 17,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            InkWell(
                              onTap: () {
                                controller.showMyOrderTheDetails.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.theMainColorTwo,
                                    shape: BoxShape.rectangle),
                                width: 50.w,
                                height: 20.h,
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "47-تفاصيل حول مزود الخدمة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.sendNo(controller.tokenTheUser.toString(),
                              "عزيزي العميل لقد وصل الفني إلى موقعك الرجاء التواصل معه");
                          controller.sendMessage(
                              "عزيزي العميل لقد وصل الفني إلى موقعك الرجاء التواصل معه",
                              controller.idUser.toString());
                          controller.AddNotice(
                              "لقد وصل الفني ${controller.Name.value} الى موقع العميل للقيام بالخدمة التى تحمل رقم:${controller.numberOfOrder}");
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .theMainColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "48-ارسال أشعار الوصول للموقع".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
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
                          controller.showMyOrderTheDetails.value = false;
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
                              (double.tryParse(controller.totalOfOrder)! *
                                      controller.ratioS.value) /
                                  100;

                          controller.walletNew.value =
                              controller.priceAfterRatio.value +
                                  controller.wallet.value;

                          controller.changeWallet(
                              controller.walletNew.value.toString());
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .theMainColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "49-تم العمل".tr,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "50-الخدمات الإضافية المقدمة لهذة الطلبية".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
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
                                  Thecontroller.idSubType.value.toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Thecontroller
                                              .isNoDataTypeOFSubTypes.value ==
                                          true
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                              Text(
                                                "51-لايوجد بيانات".tr,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Color(0xFFC70039),
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              )
                                            ])
                                      : Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100.h,
                                          child: GridView.builder(
                                              itemCount:
                                                  snapshot.data['data'].length,
                                              itemBuilder: (context, i) {
                                                return Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: SizedBox(
                                                        height: 70.h,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    if (Thecontroller.choseService.containsKey(snapshot
                                                                        .data[
                                                                            'data']
                                                                            [i][
                                                                            'type_sub_id']
                                                                        .toString())) {
                                                                      controller.choseService.remove(snapshot
                                                                          .data[
                                                                              'data']
                                                                              [
                                                                              i]
                                                                              [
                                                                              'type_sub_id']
                                                                          .toString());

                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      Thecontroller.choseService[snapshot
                                                                          .data[
                                                                              'data']
                                                                              [
                                                                              i]
                                                                              [
                                                                              'type_sub_id']
                                                                          .toString()] = snapshot.data[
                                                                              'data']
                                                                              [
                                                                              i]
                                                                              [
                                                                              'sub_type_id_key']
                                                                          .toString();
                                                                      setState(
                                                                          () {});
                                                                      /////////////
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        140.w,
                                                                    height:
                                                                        40.h,
                                                                    decoration: BoxDecoration(
                                                                        color: Thecontroller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.theMainColor : AppColors.whiteColor,
                                                                        borderRadius: BorderRadius.circular(5),
                                                                        border: Border.all(
                                                                          color:
                                                                              AppColors.theMainColor,
                                                                          width:
                                                                              1.3,
                                                                        )),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 10.w,
                                                                              vertical: 10.h),
                                                                          child:
                                                                              GetX<ChangeLanguageToLocale>(
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
                                                childAspectRatio:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        (MediaQuery.of(context)
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
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.h,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          shrinkWrap: true,
                                          itemBuilder: (context, i) {
                                            return Shimmer.fromColors(
                                                baseColor: Color.fromARGB(
                                                    31, 83, 82, 82),
                                                highlightColor:
                                                    AppColors.whiteColor,
                                                enabled: true,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    child: Shimmer.fromColors(
                                                        baseColor:
                                                            Color.fromARGB(
                                                                31, 83, 82, 82),
                                                        highlightColor:
                                                            AppColors
                                                                .whiteColor,
                                                        enabled: true,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 50.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              color: AppColors
                                                                  .yellowColor),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        7),
                                                            child: Center(
                                                              child: Text(
                                                                "51-لايوجد بيانات"
                                                                    .tr,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                borderRadius: BorderRadius.circular(5),
                                color: controller.anotherTask.value == true
                                    ? AppColors.theMainColor
                                    : AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .theMainColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "77-مهمة أخرى".tr,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      /////////////////////////////
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Material(
                          elevation: 4,
                          shadowColor: AppColors.theMainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: homeController.newPricdeCotroller,
                            onChanged: (value) {
                              controller.newPriceText = value.toString();
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: []);
                            },
                            onSaved: (newValue) {
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: []);
                              controller.newPriceText = newValue.toString();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "52-السعر الجديد".tr,
                                // important line
                                // control your hints text size
                                hintStyle: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    letterSpacing: 0.8,
                                    color: AppColors.balckColorTypeFour
                                        .withOpacity(0.5),
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white54,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
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
                          controller.showMyOrderTheDetails.value = false;
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
                              (double.tryParse(controller.newPriceText)! *
                                      controller.ratioS.value) /
                                  100;

                          controller.walletNew.value =
                              controller.priceAfterRatio.value +
                                  controller.wallet.value;

                          controller.changeWallet(
                              controller.walletNew.value.toString());
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .theMainColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "53-تم العمل مع السعر الجديد".tr,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "54-التاجيل-او الالغاء".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.editTheTimeAndOrderTime(
                            controller.idOfOrder.toString(),
                          );
                          controller.AddNotice(
                              "لقد قام الفني ${controller.Name.value} بتأجيل القيام بالخدمة التى تحمل رقم:${controller.numberOfOrder}");
                          controller.sendNo(controller.tokenTheUser.toString(),
                              "عزيزي العميل لقد تم تاجيل موعد تقديم الخدمة كونها قد تحتاج لقطع أضافية او امور أخرى");
                          controller.sendMessage(
                              "عزيزي العميل لقد تم تاجيل موعد تقديم الخدمة كونها قد تحتاج لقطع أضافية او امور أخرى",
                              controller.idUser.toString());

                          controller.showMyOrderTheDetails.value = false;
                          controller.showMyTheOrderPage.value = false;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .yellowColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "55-تاجيل الموعد".tr,
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
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.canleOrder(
                            controller.idOfOrder.toString(),
                          );
                          controller.AddNotice(
                              "لقد قام الفني ${controller.Name.value} بألغاء القيام بالخدمة  التى تحمل رقم:${controller.numberOfOrder}");
                          controller.showMyOrderTheDetails.value = false;
                          controller.showMyTheOrderPage.value = false;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .redColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "56-إلغاء العمل".tr,
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
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                           "85-رقم التواصل مع العميل".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(
                             "86-رقم الهاتف:".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: AppColors.theMainColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    controller.theNumberPhoneUser.toString(),
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "26-التفاصيل العامة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 20.h,
                          child: Row(
                            children: [
                              Text(
                                "27-نوع الخدمة:".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: AppColors.yellowColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GetX<ChangeLanguageToLocale>(
                                      builder: (scontroller) => scontroller
                                                  .isChange.value ==
                                              false
                                          ? Text(
                                              controller.nameOfMainTypeOrder
                                                  .toString(),
                                              style: TextStyle(
                                                  height: 1.3.h,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeFour),
                                              textAlign: TextAlign.center,
                                            )
                                          : Text(
                                              controller.nameOfMainTypeOrderEn
                                                  .toString(),
                                              style: TextStyle(
                                                  height: 1.3.h,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeFour),
                                              textAlign: TextAlign.center,
                                            )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(
                              "28-رقم الطلبية:".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    controller.numberOfOrder.toString(),
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(
                              "29-إجمالي الطلبية:".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "AED",
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        controller.totalOfOrder.toString(),
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "30-تفاصيل أنواع الخدمة المقدمة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      FutureBuilder(
                          future: homeController.getSubOfOrders(
                              controller.numberOfOrder.toString()),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return controller.isHaveTheUserSubOrders.value ==
                                      false
                                  ? Center(
                                      child: Text(
                                        "31-لاتمتلك اي تفرعات لعرضها".tr,
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
                                      itemCount: snapshot.data['data'].length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return PaddingCustom(
                                            theTop: 5.h,
                                            theBottom: 5.h,
                                            child: SizedBox(
                                              height: 20.h,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: GetX<
                                                                ChangeLanguageToLocale>(
                                                            builder: (scontroller) =>
                                                                scontroller.isChange
                                                                            .value ==
                                                                        false
                                                                    ? Text(
                                                                        snapshot.data['data'][i]
                                                                            [
                                                                            'sub_type_name_ar'],
                                                                        style: TextStyle(
                                                                            height: 1.5
                                                                                .h,
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        snapshot.data['data'][i]
                                                                            [
                                                                            'sub_type_name_en'],
                                                                        style: TextStyle(
                                                                            height: 1.5
                                                                                .h,
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )),
                                                      ),
                                                      SizedBox(
                                                        width: 7.w,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 20.h,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .yellowColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w),
                                                          child: GetX<
                                                                  ChangeLanguageToLocale>(
                                                              builder: (scontroller) =>
                                                                  scontroller.isChange
                                                                              .value ==
                                                                          false
                                                                      ? Text(
                                                                          snapshot.data['data'][i]
                                                                              [
                                                                              'name_type_sub'],
                                                                          style: TextStyle(
                                                                              height: 1.3.h,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: AppTextStyles.Almarai,
                                                                              color: AppColors.balckColorTypeFour),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        )
                                                                      : Text(
                                                                          snapshot.data['data'][i]
                                                                              [
                                                                              'name_type_sub_en'],
                                                                          style: TextStyle(
                                                                              height: 1.3.h,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: AppTextStyles.Almarai,
                                                                              color: AppColors.balckColorTypeFour),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 20.h,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "AED",
                                                                  style: TextStyle(
                                                                      height:
                                                                          1.3.h,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: AppColors
                                                                          .whiteColor),
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
                                                                      height:
                                                                          1.3.h,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: AppColors
                                                                          .whiteColor),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                      });
                            } else {
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return Shimmer.fromColors(
                                        baseColor:
                                            Color.fromARGB(31, 169, 167, 167),
                                        highlightColor: AppColors.whiteColor,
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
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: PaddingCustom(
                                                            theTop: 30,
                                                            child: TextCustom(
                                                              theText:
                                                                  "19-يتم التحميل"
                                                                      .tr,
                                                              fontColor: AppColors
                                                                  .blackColor,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              fontSizeWidth: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 150.w,
                                                          height: 100.h,
                                                          child: PaddingCustom(
                                                            theTop: 15,
                                                            child: Text(
                                                              "19-يتم التحميل"
                                                                  .tr,
                                                              maxLines: 4,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  height: 1.7.h,
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
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
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              8.h),
                                                                  child: Text(
                                                                    "19-يتم التحميل"
                                                                        .tr,
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "32-عملية الجدولة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      PaddingCustom(
                        theTop: 10.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "33-هذه هي الجدولة التى تم إختيارها ".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "34-تاريخ الجدولة المُدخل:".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            controller.dateOfOrder.toString(),
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.theMainColorTwo),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "35-وقت الجدولة المُدخل:".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            controller.timeOfOrder.toString(),
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.theMainColorTwo),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "36-آلية الدفع".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      PaddingCustom(
                        theTop: 10.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "37-هذة الألية المُختارة لعملية الدفع مقابل الخدمة"
                                  .tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "38-آلية الدفع المُختارة:".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            controller.theWayToPayTheOrder == "1"
                                ? "39-دفع كاش-نقدي".tr
                                : "40-دفع عبر البطاقة-إلكتروني".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.theMainColorTwo),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "41-الموقع".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "43-الموقع الذي سيتم تقديم الخدمة فيه".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 70.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.h,
                              child: Text(
                                controller.address.value,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 14.sp,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.theMainColorTwo),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
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
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors
                                      .theMainColor, //                   <--- border color
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "44-مشاهدة الموقع".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "45-تفاصيل أخرى".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "46-التفاصيل الإضافية(نص مُدخل-صورة مُدخلة) حسب الرغبة"
                                  .tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              controller.descriptionOfOrder.toString(),
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomCachedNetworkImage(
                              urlTheImage:
                                  controller.urlImageOfOrder.toString(),
                              width: 150,
                              height: 150,
                              boxFit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ]))),
              ],
            )));
  }
}
*/