

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/screens/login.dart';
import 'package:project_application/screens/home_screen/home.dart';
import 'package:project_application/screens/signup/signup_screen.dart';
import 'package:project_application/models/UserModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Api{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  late CollectionReference ref;

  Api( this.path ) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.doc(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  
 

    
 Future<Product?> get product async {
    final Product = FirebaseAuth.instance.currentUser;
    return product;
  }
  final CollectionReference productcol =
       FirebaseFirestore.instance.collection("product");
  Future saveProduct(Product product) async {
    try {
      await productcol.doc(product.id).set(product.toMap());
      return true;
    } catch (e) {
      return false;
    }
    
  }}

  
  


   
  
  
 