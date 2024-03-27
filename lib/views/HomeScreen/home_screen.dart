import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:services_man_karaz/views/HomeScreen/show_location.dart';

import 'MainOrdersWidgets/order_details.dart';
import 'MainOrdersWidgets/order_list_main_new.dart';
import 'MainOrdersWidgets/orders_list.dart';
import 'MenuWidget/menu_widget.dart';
import 'MyOrdersWidgets/my_order_details.dart';
import 'MyOrdersWidgets/my_order_details_list_new.dart';
import 'MyOrdersWidgets/my_orders_list.dart';
import 'SettingsWidgets/info_account.dart';
import 'SettingsWidgets/lang.dart';
import 'SettingsWidgets/settings_screen.dart';
import 'SettingsWidgets/show_my_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Stack(
              children: [
                OrdersList(),
                MyOrdersList(),
                Align(alignment: Alignment.bottomCenter, child: MenuWidget()),
                OrderListMainNew(),
                //   MyOrdersDetails(),
                MyOrderListMainNew(),
                SettingsMenu(),
                InfoAcount(),
                Lang(),
                ShowTheMyLocation(),
                Align(alignment: Alignment.center, child: ShowTheLocation()),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
