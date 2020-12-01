import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/shop/screens/product_overview_screen.dart';

class MyShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProductOverviewScreen(),
      ),
    );
  }
}
