import 'package:flutter/material.dart';
import 'package:project_application/models/Product.dart';



class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                //copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
             
              SizedBox(width: 20.0),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image ,width: 200,height: 200,
                      
                    fit: BoxFit.fill,
                    
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}