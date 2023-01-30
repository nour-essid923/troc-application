import 'package:flutter/material.dart';
import 'package:project_application/models/Product.dart';


class Items extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const Items({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image,width: 220,height: 220,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 / 2),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: Color(0xFFACACAC)),
            ),
          ),
         
        ],
      ),
    );
  }
}