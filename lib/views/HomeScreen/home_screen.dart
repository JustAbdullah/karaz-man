import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:services_man_karaz/views/HomeScreen/show_location.dart';

import 'MainOrdersWidgets/order_details.dart';
import 'MainOrdersWidgets/orders_list.dart';
import 'MenuWidget/menu_widget.dart';
import 'MyOrdersWidgets/my_order_details.dart';
import 'MyOrdersWidgets/my_orders_list.dart';
import 'SettingsWidgets/info_account.dart';
import 'SettingsWidgets/settings_screen.dart';

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
          child: Stack(
            children: [
              OrdersList(),
              MyOrdersList(),
              Align(alignment: Alignment.bottomCenter, child: MenuWidget()),
              OrdersDetails(),
              MyOrdersDetails(),
              SettingsMenu(),
              InfoAcount(),
              Align(alignment: Alignment.center, child: ShowTheLocation()),
            ],
          ),
        ),
      )),
    );
  }
}
