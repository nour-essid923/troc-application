import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_application/models/Product.dart';
import '../../details/detailscreen.dart';

import 'items.dart';
import 'package:project_application/screens/Home_Screen/component/categories.dart';


class Body extends StatelessWidget {
  final Product product;
  Body({Key? key,required this.product}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "ALL",
            style: Theme.of(context)
                .textTheme
                .headline5
                !.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
       Categories(),
       
     Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => Items(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}