import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:services_man_karaz/core/constant/images_path.dart';
import '../controllers/controller_app.dart';
import '../core/constant/app_text_styles.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    ControllerApp co = Get.put(ControllerApp());
    void savePdf(String idOfOrder, String nameServiceMan, String nameOfUser,
        String price, String typeOfService) async {
      var now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);

      final pdf = pw.Document();

      final logoImageData = await rootBundle.load(ImagesPath.logo);
      final logoImage = pw.MemoryImage(
        logoImageData.buffer.asUint8List(),
      );
      final fontData =
          await rootBundle.load('android/assets/fonts/Almarai-Regular.ttf');
      final ttf = pw.Font.ttf(fontData);

      pdf.addPage(pw.Page(
        build: (pw.Context context) => pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Image(logoImage, width: 100.w, height: 80.h),
                pw.SizedBox(
                  height: 10.h,
                ),
                pw.Text("فاتورة طلب خدمة",
                    textDirection: pw.TextDirection.rtl,
                    style: pw.TextStyle(fontSize: 24, font: ttf)),
                pw.SizedBox(
                  height: 10.h,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Directionality(
                        textDirection: pw.TextDirection.ltr,
                        child: pw.Text(formattedDate,
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 17, font: ttf)),
                      ),
                      pw.Text("تاريخ الفاتورة",
                          textDirection: pw.TextDirection.rtl,
                          style: pw.TextStyle(fontSize: 17, font: ttf)),
                    ]),
                pw.SizedBox(
                  height: 17.h,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Directionality(
                        textDirection: pw.TextDirection.ltr,
                        child: pw.Text(idOfOrder,
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 17, font: ttf)),
                      ),
                      pw.SizedBox(
                        width: 5.w,
                      ),
                      pw.Text("رقم الفاتورة:",
                          textDirection: pw.TextDirection.rtl,
                          style: pw.TextStyle(fontSize: 17, font: ttf)),
                    ]),
                pw.SizedBox(
                  height: 7.h,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Directionality(
                        textDirection: pw.TextDirection.rtl,
                        child: pw.Text(nameServiceMan,
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 17, font: ttf)),
                      ),
                      pw.SizedBox(
                        width: 5.w,
                      ),
                      pw.Text("اسم الفني:",
                          textDirection: pw.TextDirection.rtl,
                          style: pw.TextStyle(fontSize: 17, font: ttf)),
                    ]),
                pw.SizedBox(
                  height: 7.h,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Directionality(
                        textDirection: pw.TextDirection.rtl,
                        child: pw.Text(nameOfUser,
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 17, font: ttf)),
                      ),
                      pw.SizedBox(
                        width: 5.w,
                      ),
                      pw.Text("اسم العميل:",
                          textDirection: pw.TextDirection.rtl,
                          style: pw.TextStyle(fontSize: 17, font: ttf)),
                    ]),
                pw.SizedBox(
                  height: 7.h,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Directionality(
                        textDirection: pw.TextDirection.rtl,
                        child: pw.Text(typeOfService,
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 17, font: ttf)),
                      ),
                      pw.SizedBox(
                        width: 5.w,
                      ),
                      pw.Text("نوع الخدمة:",
                          textDirection: pw.TextDirection.rtl,
                          style: pw.TextStyle(fontSize: 17, font: ttf)),
                    ]),
                pw.SizedBox(
                  height: 7.h,
                ),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Directionality(
                        textDirection: pw.TextDirection.ltr,
                        child: pw.Text(price,
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 17, font: ttf)),
                      ),
                      pw.SizedBox(
                        width: 5.w,
                      ),
                      pw.Text("الاجمالي النهائي:",
                          textDirection: pw.TextDirection.rtl,
                          style: pw.TextStyle(fontSize: 17, font: ttf)),
                    ]),
                pw.SizedBox(
                  height: 7.h,
                ),
              ],
            )),
      ));

      // حفظ الفاتورة في ملف PDF على الجهاز
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/${idOfOrder}.pdf");
      await file.writeAsBytes(await pdf.save());

      final fileOne = await file.writeAsBytes(await pdf.save());
      setState(() {});
      print(output.path);
      print(file.path);
      print(output);
      co.upIm(fileOne);
    }

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                savePdf("30229", "احمد احمد", "خالد مصعب", "2030 AED",
                    "خدمة آلة الغسيل");
              },
              child: Container(
                color: Colors.yellow,
                width: 200.w,
                height: 60.h,
                child: Text("حفظ"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
