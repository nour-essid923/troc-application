import 'package:flutter/material.dart';
import 'package:project_application/models/Product.dart';



class Phone extends StatelessWidget {
  const Phone({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Spacer(flex: 3,);
    return
     
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 45.0),
      
      child: Text(
        product.phone,
        style: TextStyle(height: 4),
      ),
      
    );
    //child: Text("Contact"),
  }
}