import 'package:flutter/material.dart';
import 'package:project_application/models/Product.dart';



class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Spacer(flex: 3,);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45.0),
      
      child: Text(
        product.description,
        style: TextStyle(height: 2),
      ),
    );
  }
}