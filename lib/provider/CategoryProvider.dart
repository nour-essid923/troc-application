import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_application/models/Categoryicon.dart';
import 'package:project_application/models/Product.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> shirt = [];
  Product? shirtData;
  List<Product> dress = [];
  Product? dressData;
  List<Product> shoes = [];
  Product? shoesData;
 
  List<CategoryIcon> dressIcon = [];
  CategoryIcon? dressiconData;

  Future<void> getDressIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot dressSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("SiNJYcU8RRVrXaLUL9v3")
        .collection("dress")
        .get();
    dressSnapShot.docs.forEach(
      (element) {
        dressiconData = CategoryIcon(image: element["image"]);
        newList.add(dressiconData!);
      },
    );
    dressIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getDressIcon {
    return dressIcon;
  }

  List<CategoryIcon> shirtIcon = [];
  CategoryIcon? shirticonData;
  Future<void> getShirtIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("SiNJYcU8RRVrXaLUL9v3")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirticonData = CategoryIcon(image: element["image"]);
        newList.add(shirticonData!);
      },
    );
    shirtIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShirtIconData {
    return shirtIcon;
  }

  List<CategoryIcon> shoesIcon = [];
  CategoryIcon? shoesiconData;
  Future<void> getshoesIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shoesSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("SiNJYcU8RRVrXaLUL9v3")
        .collection("shoe")
        .get();
    shoesSnapShot.docs.forEach(
      (element) {
        shoesiconData = CategoryIcon(image: element["image"]);
        newList.add(shoesiconData!);
      },
    );
    shoesIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShoeIcon {
    return shoesIcon;
  }

 

  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("hKyfiWV7zSLen6HYJgVf")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            image: element["image"],
            title: element["name"],
            //price: element["price"]
            );
        newList.add(shirtData!);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirtList {
    return shirt;
  }

  Future<void> getDressData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("hKyfiWV7zSLen6HYJgVf")
        .collection("dress")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            image: element["image"],
            title:element["name"],
            //price: element["price"]
            );
        newList.add(shirtData!);
      },
    );
    dress = newList;
    notifyListeners();
  }

  List<Product> get getDressList {
    return dress;
  }

  Future<void> getShoesData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("hKyfiWV7zSLen6HYJgVf")
        .collection("shoes")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            image: element["image"],
            title: element["name"],
            //price: element["price"]
            );
        newList.add(shirtData!);
      },
    );
    shoes = newList;
    notifyListeners();
  }

  List<Product> get getshoesList {
    return shoes;
  }
}
  

 

 