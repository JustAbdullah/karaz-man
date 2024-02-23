//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:services_man_karaz/core/constant/images_path.dart';
import 'package:services_man_karaz/views/HomeScreen/home_screen.dart';
import '../core/class/class/crud.dart';
import 'package:http/http.dart' as http;

import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/SaveLocation/saved_location.dart';
import '../views/langScreen/choose_language.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ControllerApp extends GetxController {
  RxBool theWay = false.obs;
  WhereGoingTheApp() {
    Future.delayed(Duration(seconds: 5), () async {
      if (theWay.value == false) {
        if (appServices.sharedPreferences.containsKey('Name')) {
          Get.to(HomeScreen());
          theWay.value = true;
        } else {
          Get.to(ChooseLanguage());
          theWay.value = true;
        }
      } else {}
    });
  }

  final crud = Crud();
  AppServices appServices = Get.find();
  TextEditingController passwordAuthLoginController = TextEditingController();
  final keyAuthLogin = GlobalKey();

  RxString passwordAuthLogin = "".obs;
  RxBool waitLoginSignAuth = false.obs;
  RxBool isLoginSignAuthSuccessfully = false.obs;
  RxBool errorLoginSignAuth = false.obs;

  RxString ID = "".obs;
  RxString Name = "".obs;
  RxString Phone = "".obs;
  RxString theNameOFServiceType = "".obs;
  RxInt tyeTypeOFSerivces = 0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble latitudePlus = 0.0.obs;
  RxDouble latitudeMinus = 0.0.obs;
  RxDouble latitudeOP = 0.03.obs;
  RxInt Thewallet = 0.obs;
  RxInt ratio = 0.obs;

  RxDouble longitude = 0.0.obs;
  RxDouble longitudePlus = 0.0.obs;
  RxDouble longitudeMinus = 0.0.obs;
  RxDouble longitudeOP = 0.08.obs;

  login(String password) async {
    waitLoginSignAuth.value = true;
    var response = await crud
        .postRequest(AppLinksApi.login, {"password": password.toString()});

    if (response['status'] == "success") {
      await Future.delayed(const Duration(seconds: 2), () async {
        waitLoginSignAuth.value = false;
        showTheOrderPage.value = true;
        ID.value = response['data'][0]['id'].toString();
        Name.value = response['data'][0]['name'].toString();
        GetWallteAndRatio(ID.value.toString());

        theNameOFServiceType.value =
            response['data'][0]['services_main_name_en'].toString();
        Phone.value = response['data'][0]['phone'].toString();
        tyeTypeOFSerivces.value =
            int.parse(response['data'][0]['service_type'].toString());

        Thewallet.value = int.parse(response['data'][0]['wallet'].toString());
        ratio.value = int.parse(response['data'][0]['ratio'].toString());

        latitude.value =
            double.parse(response['data'][0]['latitude'].toString());
        longitude.value =
            double.parse(response['data'][0]['longitude'].toString());

        appServices.sharedPreferences.setString('Name', Name.value);
        appServices.sharedPreferences
            .setString('services_main_name_en', theNameOFServiceType.value);
        appServices.sharedPreferences
            .setInt('service_type', tyeTypeOFSerivces.value);
        appServices.sharedPreferences.setString('ID', ID.value);
        appServices.sharedPreferences.setInt('wallet', Thewallet.value);
        appServices.sharedPreferences.setInt('ratio', ratio.value);
        appServices.sharedPreferences.setString('phone', Phone.value);
        appServices.sharedPreferences.setDouble('Long', longitude.value);
        appServices.sharedPreferences.setDouble('Lat', latitude.value);
        isLoginSignAuthSuccessfully.value = true;
      });
    } else {}
    return response;
  }

  @override
  void onInit() {
    if (appServices.sharedPreferences.containsKey('isLocationReady')) {
      if (appServices.sharedPreferences.containsKey('Name')) {
        Name.value = appServices.sharedPreferences.getString('Name') as String;
        theNameOFServiceType.value = appServices.sharedPreferences
            .getString('services_main_name_en') as String;
        tyeTypeOFSerivces.value =
            appServices.sharedPreferences.getInt('service_type') as int;
        Thewallet.value = appServices.sharedPreferences.getInt('wallet') as int;
        ratio.value = appServices.sharedPreferences.getInt('ratio') as int;

        ID.value = appServices.sharedPreferences.getString('ID') as String;

        Phone.value =
            appServices.sharedPreferences.getString('phone') as String;
        longitude.value =
            appServices.sharedPreferences.getDouble('Long') as double;
        latitude.value =
            appServices.sharedPreferences.getDouble('Lat') as double;

        latitudePlus.value = latitude.value + latitudeOP.value;
        latitudeMinus.value = latitude.value - latitudeOP.value;

        longitudePlus.value = longitude.value + longitudeOP.value;
        longitudeMinus.value = longitude.value - longitudeOP.value;
        GetWallteAndRatio(ID.value);
      }
    }

    if (ID.value != 0) {
      GetWallteAndRatio(ID.value);
    }

    super.onInit();
  }

  //////////////////////The Orders................................./////////////////

//////////////////////.Get The Orders And Show .................///////////
  RxBool showTheOrderPage = true.obs;
  RxBool isHaveTheUserOrders = false.obs;
  String idOfOrder = "";
  String nameOfMainTypeOrder = "";
  String nameOfMainTypeOrderEn = "";
  String totalOfOrder = "";
  String numberOfOrder = "";
  String dateOfOrder = "";
  String timeOfOrder = "";
  String descriptionOfOrder = "";
  String urlImageOfOrder = "";
  double longitudeOrder = 0.0;
  double latitudeOrder = 0.0;
  String theWayToPayTheOrder = "";
  String tokenTheUser = "";
  String idUser = "";
  String nameUser = "";

  RxBool showTheDetails = false.obs;

  Future getOrders(String idType, String Lati, String latiMin, String latiPlus,
      String longMin, String long, String longPlus) async {
    var response = await crud.postRequest(AppLinksApi.getOrders, {
      'type_id': idType.toString(),
      'latitude': Lati.toString(),
      'latitudeMinus': latiMin.toString(),
      'latitudePlus': latiPlus.toString(),
      'longitudeMinus': longMin.toString(),
      'longitude': long.toString(),
      'longitudePlus': longPlus.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheUserOrders.value = true;
    } else {
      isHaveTheUserOrders.value = false;
    }

    return response;
  }

  /*

Future getOrders(String idType, String Lati, String latiMin, String latiPlus,
      String longMin, String long, String longPlus) async {
    var response = await crud.postRequest(AppLinksApi.getOrders, {
      'type_id': tyeTypeOFSerivces.value.toString(),
      'latitude': latitude.value.toString(),
      'latitudeMinus': latitudeMinus.value.toString(),
      'latitudePlus': latitudePlus.value.toString(),
      'longitudeMinus': longitudeMinus.value.toString(),
      'longitude': longitude.value.toString(),
      'longitudePlus': longitudePlus.value.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheUserOrders.value = true;
    } else {
      isHaveTheUserOrders.value = false;
    }

    return response;
  }


  */

  RxBool isHaveTheUserSubOrders = false.obs;

  String theNumberPhoneUser ="";

  Future getSubOfOrders(String numberOfOrder) async {
    var response = await crud.postRequest(AppLinksApi.getTypeOrders, {
      'order_number': numberOfOrder.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheUserSubOrders.value = true;
    } else {
      isHaveTheUserSubOrders.value = false;
    }

    return response;
  }

  RxBool showTheLocation = false.obs;
  RxString address = "لايوجد عنوان".obs;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  void ConvertIntoTextAddress(double lat, double log) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, log);
    Placemark placeMark = placemarks[0];

    address.value = placeMark.toString();
  }

  /////////////Save Location in Database................../////////////////////
  /////////////////............................Get The Location..............///////////////////////

  Future getDataUserAfterAddLocation() async {
    var response = await crud.postRequest(AppLinksApi.getDataUser, {
      'id': ID.toString(),
    });

    if (response['status'] == "success") {
      await Future.delayed(const Duration(seconds: 2), () async {
        waitLoginSignAuth.value = false;
        showTheOrderPage.value = true;
        ID.value = response['data'][0]['id'].toString();
        Name.value = response['data'][0]['name'].toString();
        Phone.value = response['data'][0]['phone'].toString();
        tyeTypeOFSerivces.value =
            int.parse(response['data'][0]['service_type'].toString());

        latitude.value =
            double.parse(response['data'][0]['latitude'].toString());
        longitude.value =
            double.parse(response['data'][0]['longitude'].toString());

        appServices.sharedPreferences.setString('Name', Name.value);
        appServices.sharedPreferences
            .setInt('service_type', tyeTypeOFSerivces.value);
        appServices.sharedPreferences.setString('ID', ID.value);
        appServices.sharedPreferences.setString('phone', Phone.value);
        appServices.sharedPreferences.setDouble('Long', longitude.value);
        appServices.sharedPreferences.setDouble('Lat', latitude.value);
        isLoginSignAuthSuccessfully.value = true;

        appServices.sharedPreferences.setString('isLocationReady', "ready");
      });
    } else {}
    return response;
  }

  RxBool loadingTheLocationAndSave = false.obs;
  Future saveLocation(double Latitude, double Longitude) async {
    var response = await crud.postRequest(AppLinksApi.saveLocation, {
      'id': ID.toString(),
      'latitude': Latitude.toString(),
      'longitude': Longitude.toString(),
    });

    return response;
  }

  RxBool aboutLocation = false.obs;
  RxBool locationPage = false.obs;

  RxBool checkTheLocation = false.obs;
  var myCurrentPositionLatitude = 2.2;
  var myCurrentPositionLongitude = 2.2;
  RxBool IsrequestPermissionDenied = false.obs;

  Future checkIsEnableLocationServices() async {
    checkTheLocation.value = true;
    bool services;
    LocationPermission per;
    await Future.delayed(Duration(seconds: 3), () async {
      services = await Geolocator.isLocationServiceEnabled();
      if (services == true) {
        per = await Geolocator.checkPermission();
        if (per == LocationPermission.denied) {
          IsrequestPermissionDenied.value = true;
          per = await Geolocator.requestPermission();
        } else {
          await Geolocator.getCurrentPosition().then((value) async {
            myCurrentPositionLatitude = value.latitude;
            myCurrentPositionLongitude = value.longitude;
            saveLocation(value.latitude, value.longitude);
            await Future.delayed(Duration(seconds: 2), () async {
              getDataUserAfterAddLocation();
            });

            await Future.delayed(Duration(seconds: 4), () async {
              loadingTheLocationAndSave.value = false;

              Get.to(SaveeLocation());
            });
          });
        }
      } else {}
    });
  }

  Future askPermissionOfLocation() async {
    // ignore: unused_local_variable
    loadingTheLocationAndSave.value = true;
    // ignore: unused_local_variable
    LocationPermission per;
    per = await Geolocator.requestPermission();
    checkIsEnableLocationServices();
  }

  ////////////////Get My Orders Chosed................/

  Future chooseTheOrder(String idOrder) async {
    var response = await crud.postRequest(AppLinksApi.chooseTheOrder,
        {'services_man': ID.value.toString(), 'order_id': idOrder.toString()});

    showTheDetails.value = false;
    Get.to(HomeScreen());

    return response;
  }

  RxBool showMyTheOrderPage = false.obs;
  RxBool showMyOrderTheDetails = false.obs;
  RxBool isHaveTheOrders = false.obs;

  Future getMyOrders() async {
    var response = await crud.postRequest(AppLinksApi.getMyOrder, {
      'services_man': ID.value.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheOrders.value = true;
    } else {
      isHaveTheOrders.value = false;
    }

    return response;
  }

  ////////////End The Order,,,,,,,,,,,....................////////
  TextEditingController newPricdeCotroller = TextEditingController();
  String newPriceText = "";

  Future endTheOrder(String idOrder, String token, String body) async {
    var response = await crud
        .postRequest(AppLinksApi.endTheOrder, {'order_id': idOrder.toString()});

    if (response['status'] == "success") {
      showMyOrderTheDetails.value = false;
      sendNo(token.toString(), body.toString());
      Get.to(HomeScreen());
    } else {}
    return response;
  }

  Future endTheOrderWithNewPrice(
      String idOrder, String newPrice, String token, String body) async {
    var response =
        await crud.postRequest(AppLinksApi.endTheOrderWithChangeThePrice, {
      'order_id': idOrder.toString(),
      'price_totle': newPrice.toString(),
    });

    if (response['status'] == "success") {
      showMyOrderTheDetails.value = false;
      sendNo(token.toString(), body.toString());
      Get.to(HomeScreen());
    } else {}

    return response;
  }

  sendNo(String token, String Thebody) async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAG1L9LFo:APA91bGxzrfDo94mD1i7BmA9QKK_KkXJy1xSnoe--K5Zo5pwrVjtTcQnSxtH4eirPGfGJRz8eA2aFYB1vl_dT5GXFa3zwA8h4fcq0wQAXmre2Tp35Y2wSuiTPBRKx53D2-8U8sgRzXfm'
    };
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    var body = {
      "to": "${token.toString()}",
      "notification": {
        "title": "اشعار حول تقديم الخدمة",
        "body": "${Thebody.toString()}",
        "sound": "default",
        "image":
            "https://firebasestorage.googleapis.com/v0/b/jalai-45565.appspot.com/o/logo.png?alt=media&token=4c593126-a27b-4449-bf32-7fd37f1a9b47"
      },
      "data": {
        "message": "Offer!",
        "image_url":
            "https://firebasestorage.googleapis.com/v0/b/jalai-45565.appspot.com/o/logo.png?alt=media&token=4c593126-a27b-4449-bf32-7fd37f1a9b47",
        "image":
            "https://firebasestorage.googleapis.com/v0/b/jalai-45565.appspot.com/o/logo.png?alt=media&token=4c593126-a27b-4449-bf32-7fd37f1a9b47",
      }
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }
  //////////////////////////////.......Settings ###################>>............................

  RxBool showTheSettings = false.obs;
  RxBool showTheAccountInfo = false.obs;
  RxBool showLang = false.obs;

  /////////////////services Chosed..............////////
  Map<String, String> choseService = {};
  RxInt idSubType = 0.obs;

  RxBool isNoDataTypeOFSubTypes = false.obs;
  getTypeOFSubTyps(String idSubType) async {
    var response = await crud.postRequest(AppLinksApi.getTypeOfSubType,
        {"sub_type_id_key": idSubType.toString()});
    response['status'] == "success"
        ? isNoDataTypeOFSubTypes.value = false
        : isNoDataTypeOFSubTypes.value = true;

    return response;
  }

///////////////
  getOrdersUsers(String numberOrder) async {
    var response = await crud.postRequest(
        AppLinksApi.getOrdersUser, {"order_number": numberOrder.toString()});
    if (response['status'] == "success") {
      idSubType.value =
          int.parse(response['data'][0]['sub_type_id'].toString());
    } else {}
    return response;
  }

  ///////////////////////////////////
  editTheTimeAndOrderTime(String idOfOrder) async {
    var response =
        await crud.postRequest(AppLinksApi.editTheTimeAndDateOFOrder, {
      "order_id": idOfOrder.toString(),
      "order_time": "مؤجل".toString(),
      "order_date": "مؤجل".toString(),
    });

    return response;
  }

  canleOrder(String idOfOrder) async {
    var response = await crud.postRequest(AppLinksApi.cancelTheOrder, {
      "order_id": idOfOrder.toString(),
    });

    return response;
  }

  AddNotice(String theNoticeBody) async {
    var response = await crud.postRequest(AppLinksApi.addNoti, {
      'notice_body': theNoticeBody.toString(),
      'add_by': ID.value.toString(),
    });

    return response;
  }

  void sendMessage(String title, String id) async {
    var response = await crud.postRequest(AppLinksApi.sendMessage, {
      'user_id': id.toString(),
      'body': title.toString(),
    });

    return response;
  }

  upIm(File? mfile) async {
    // ignore: unused_local_variable
    var response =
        await crud.postRequestFile(AppLinksApi.uploadimage, {}, mfile!);
  }

  void savePdf(String idOfOrder, String nameServiceMan, String nameOfUser,
      String price, String typeOfService, String idTheUser) async {
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
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
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
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
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
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
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
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
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
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
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

    print(output.path);
    print(file.path);
    print(output);
    upIm(fileOne);

    addIntoDataBaseInvoice(idTheUser.toString(), idOfOrder.toString());
  }

  addIntoDataBaseInvoice(String idUser, String pdf) async {
    var response = await crud.postRequest(AppLinksApi.add_invoice, {
      'id_user': idUser.toString(),
      'service_man': ID.toString(),
      'pdf': "https://larra.xyz/thenewImages/${pdf.toString()}.pdf",
    });

    return response;
  }

  RxBool anotherTask = false.obs;

////////////////...................................Change The Wallte.//////////////////

  changeWallet(String wallet) async {
    var response = await crud.postRequest(AppLinksApi.edit_wallte_service_man,
        {'id': ID.value.toString(), 'wallet': wallet.toString()});

    await Future.delayed(Duration(seconds: 7), () async {
      GetWallteAndRatio(ID.value);
    });

    return response;
  }

  ///////////////////Get Wallet And Ratio:.....................////////

  RxDouble wallet = 0.0.obs;
  RxDouble ratioS = 0.0.obs;
  String price = "1000";
  RxDouble priceAfterRatio = 0.0.obs;
  RxDouble walletNew = 0.0.obs;
  GetWallteAndRatio(String idThe) async {
    var response = await crud
        .postRequest(AppLinksApi.getDataRatio, {'id': idThe.toString()});
    if (response['status'] == "success") {
      wallet.value = double.parse(response['data'][0]['wallet'].toString());
      ratioS.value = double.parse((response['data'][0]['ratio'].toString()));

      return response;
    }
  }
}
