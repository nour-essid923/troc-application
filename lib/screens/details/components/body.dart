import 'package:flutter/material.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/screens/details/components/phone.dart';


import 'color_and_size.dart';

import 'description.dart';
import 'product_title.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20.0,
                    right: 20.0,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  
                  child: Column(
                    children: <Widget>[
                      Spacer(flex:3),
                      //ColorAndSize(product: product),
                      //SizedBox(height:20.0 / 2),
                      Description(product: product),
                      SizedBox(height: 20.0 / 2),
                      //CounterWithFavBtn(),
                      Spacer(flex: 2),
                      Phone(product: product),
                      SizedBox(height: 20.0 / 2),
                     
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}