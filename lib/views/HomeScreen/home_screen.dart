import 'package:flutter/material.dart';
import 'package:services_man_karaz/views/HomeScreen/show_location.dart';

import 'OrdersWidgets/order_details.dart';
import 'OrdersWidgets/orders_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            OrdersList(),
            OrdersDetails(),
            Align(alignment: Alignment.center, child: ShowTheLocation()),
          ],
        ),
      )),
    );
  }
}
