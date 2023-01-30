import 'package:flutter/material.dart';
import 'package:project_application/screens/crud/AddProduce.dart';

class Product {
  final String image, title, description,phone,id;
  
  final Color? color;
  //final double? price; 
  Product({
    this.id="",
    this.image="",
    this.title="",
    this.description="",
    //this.size,
    this.color,
    //this.price,
    this.phone="",
  });

     factory Product.fromMap(map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      phone: map['phone'],
     image:map['image'],
     color:map['color'],
    
    );
  }

  factory Product.fromJson(Map<String, dynamic> j) => Product(
      id: j['id'],
       title: j['title'],
      description: j['description'],
      phone: j['phone'],
     image:j['image'],
     color:j['color'],
     );

     Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'phone':phone,
      'image':image,
      'color': color,
      
    };
  }}
  List<Product> products = [
  Product(
      id: "1",
      title: "robe",
     phone: "26665002",
      //size: 12,
      description: 'courte robe rouge avec des points blanc portée  une seule fois  de taille S de la marque ZARA ancienne collection.je veux faire un échange avec une autre de mme style ou bien la vendre a 30 dinars . ',
      image: "assets/images/robe1.png",
      color: Color(0xC3588162)
      ),
      
  Product(
      id: "2",
      title: "jeans",
     phone: "26665002",
      //size: 8,
      description: dummyText,
      image: "assets/images/jeans.jpg",
      //color: Color(0xFFD3A984)
      ),
  Product(
      id: "3",
      title: "console table",
      phone: "26665002",
      //size: 10,
      description: dummyText,
      image: "assets/images/console.jpg",
      color: Color(0xFF989493)),
  Product(
      id: "4",
      title: "casque",
      phone: "26665002",
      //size: 11,
      description: dummyText,
      image: "assets/images/casque.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id:" 5",
      title: "chargeur iphone",
     phone:"26665002",
      //size: 12,
      description: dummyText,
      image: "assets/images/chargeur_iphone.jpg",
      color: Color.fromARGB(255, 156, 130, 133)),
  Product(
    id: "6",
    title: "chemise_homme",
    phone: "26665002",
    //size: 12,
    description: dummyText,
    image: "assets/images/chemise_homme.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText = "";