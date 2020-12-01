import 'package:flutter/material.dart';
import 'package:learn_flutter_basic/shop/widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body:  ProductsGrid(),
    );
  }
}
