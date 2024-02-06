//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:services_man_karaz/views/HomeScreen/home_screen.dart';
import '../core/class/class/crud.dart';

import '../core/constant/appcolors.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';

class ControllerApp extends GetxController {
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
  RxInt tyeTypeOFSerivces = 0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  login(String password) async {
    waitLoginSignAuth.value = true;
    var response = await crud
        .postRequest(AppLinksApi.login, {"password": password.toString()});

    if (response['status'] == "success") {
      await Future.delayed(const Duration(seconds: 5), () async {
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
      });
    } else {}
    return response;
  }

  @override
  void onInit() {
    if (appServices.sharedPreferences.containsKey('Name')) {
      Name.value = appServices.sharedPreferences.getString('Name') as String;
      tyeTypeOFSerivces.value =
          appServices.sharedPreferences.getInt('service_type') as int;

      ID.value = appServices.sharedPreferences.getString('ID') as String;
      Phone.value = appServices.sharedPreferences.getString('phone') as String;
      longitude.value =
          appServices.sharedPreferences.getDouble('Long') as double;
      latitude.value = appServices.sharedPreferences.getDouble('Lat') as double;
    }
    super.onInit();
  }

  //////////////////////The Orders................................./////////////////

//////////////////////.Get The Orders And Show .................///////////
  RxBool showTheOrderPage = true.obs;
  RxBool showTheConfirmationOrderDetials = false.obs;
  RxBool showTheOrderAndConfirmationThat = false.obs;

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

  RxBool showTheDetails = false.obs;

  Future getOrders() async {
    var response = await crud.postRequest(AppLinksApi.getOrders, {
      'type_id': tyeTypeOFSerivces.value.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheUserOrders.value = true;
    } else {
      isHaveTheUserOrders.value = false;
    }

    return response;
  }

  RxBool isHaveTheUserSubOrders = false.obs;

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
          await Geolocator.getCurrentPosition().then((value) {
            myCurrentPositionLatitude = value.latitude;
            myCurrentPositionLongitude = value.longitude;
            saveLocation(value.latitude, value.longitude);

            Get.to(HomeScreen());
          });
        }
      } else {}
    });
  }

  Future askPermissionOfLocation() async {
    // ignore: unused_local_variable
    LocationPermission per;
    per = await Geolocator.requestPermission();
    checkIsEnableLocationServices();
  }
}
