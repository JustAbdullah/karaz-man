import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/controller_app.dart';
import '../core/constant/appcolors.dart';

class TestingNumber extends StatelessWidget {
  const TestingNumber({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());
    return Scaffold(
        backgroundColor: AppColors.yellowColor,
        body: GetX<ControllerApp>(
            builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("المبلغ السابق في المحفظة"),
                        Text(controller.wallet.value.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("نسبة العمولة"),
                        Text(controller.ratioS.value.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("مبلغ الخدمة"),
                        Text(controller.price.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("مبلغك المستحق من المبلغ"),
                        Text(controller.priceAfterRatio.value.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("المبلغ الجديد في المحفظة"),
                        Text(controller.walletNew.value.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.priceAfterRatio.value =
                            (double.tryParse(controller.price)! *
                                    controller.ratioS.value) /
                                100;

                        controller.walletNew.value =
                            controller.priceAfterRatio.value +
                                controller.wallet.value;

                        //  ((double.tryParse(total.toString())! * 0.10) + int.parse(amount))
                      },
                      child: Container(
                          alignment: Alignment.center,
                          color: AppColors.whiteColor,
                          width: 200.w,
                          height: 100.h,
                          child: Text("تجربة")),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                )));
  }
}
