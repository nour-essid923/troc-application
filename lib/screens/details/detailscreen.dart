import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/profile.dart';
import 'package:project_application/screens/home_screen/home.dart';
import 'package:project_application/screens/messages/Discussion.dart';
import'package:project_application/screens/details/components/body.dart';
import 'package:project_application/screens/details/components/color_and_size.dart';
import 'package:project_application/screens/details/components/description.dart';
import 'package:project_application/screens/details/components/product_title.dart';


class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key,required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomeScreen()),
  );
}
      ),
      actions: <Widget>[
       
        IconButton(
          icon: SvgPicture.asset("assets/icons/comment.svg",height: 250,width: 250,),
          onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MessagesScreen ()),);},
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}