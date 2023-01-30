
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_application/profile.dart';
import 'package:project_application/provider/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:project_application/provider/Auth.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:project_application/models/Product.dart';
import 'package:project_application/screens/Home_Screen/home.dart';
import 'package:project_application/screens/details/components/description.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

import '../../provider/Api.dart';


class ADD extends StatefulWidget  {
@override
  _AddPage createState()=>_AddPage();}
//Api _api = locator<Api>();
final _product= FirebaseFirestore.instance;
  
    File ?_image;
   late String title,description,phone,fullname;
    final _auth = FirebaseAuth.instance;
 final TextEditingController titleController = new TextEditingController();
  final TextEditingController descriptionController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController fullnameController = new TextEditingController();
     final _formKey = GlobalKey<FormState>(); 



   
    //on PlatformException catch(e) {print('failed to pick image: $e');}}

  //widget buildButton()
 
 


 class _AddPage extends State<ADD> {
   File? image;
Future pickImage() async{
      //try{
      final image= await ImagePicker().pickImage(source:ImageSource.gallery);
      if(image==null) return ;
     final imageTemporary=File(image.path);
      setState(()=> this.image = imageTemporary);
    }





   Future  getImage() async {
      final  image = await ImagePicker().pickImage(source: ImageSource.gallery);
 
      setState(() {
        File? _image ;
          print('Image Path $_image');
      }
      );
    }
      Future  uploadPic(BuildContext context) async{
      String fileName = basename(_image!.path);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
       UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
       TaskSnapshot taskSnapshot=await uploadTask;
       setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
       });
    }
    @override
     Widget build(BuildContext context) {
        bool _passwordVisible;
    //AuthServices authServices = AuthServices();
        //Api apiservice = Api();
    
     final titleField = TextFormField(
        autofocus: false,
        controller: titleController,
        keyboardType: TextInputType.emailAddress,
       
        onSaved: (value) {
          titleController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.add_box),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

final descriptionField = TextFormField(
        autofocus: false,
        controller: descriptionController,
        //obscureText: true,
       
        onSaved: (value) {
          descriptionController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.description),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


         final phoneField = TextFormField(
        autofocus: false,
        controller: phoneController,
        keyboardType: TextInputType.text,
       
        onSaved: (value) {
          phoneController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "phone",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        //final imageField=getImage();


      final addButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 94, 82, 102),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
                  final CollectionReference productcol =
       FirebaseFirestore.instance.collection("product");
  Future saveProduct(Product product) async {
    try {
      await productcol.doc(product.id).set(product.toMap());
      return true;
    } catch (e) {
      return false;
    }
    
  }
                    Navigator.pop( context,
    MaterialPageRoute(builder: (context) =>  HomeScreen()),
  ); ;
            }
          },
          color: Color(0xC3588162),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          

                        ),
          child: const Text(
                         "add", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                          color: Colors.white,

                        ),),
    ));
Widget buildButton({
    required String title,
    required IconData iconData,
    required Function onClicked,
  })=>ElevatedButton(
    style:ElevatedButton.styleFrom(
      minimumSize:Size.fromHeight(56),
      primary:Colors.white,
      onPrimary: Colors.black,
      textStyle:TextStyle(fontSize: 20),
    ),
    child: Row(children: [const SizedBox(height: 48),
    buildButton(title: 'image', iconData: Icons.image_outlined, onClicked: ()=>pickImage(),
  )]),
  onPressed: onClicked(),);



    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(132,187,153,129),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size: 14,
          color: Colors.black,),


        ),),
         body: Builder(
        builder: (context) =>  Container(
           color:  Color.fromARGB(132, 187, 153, 129),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        child: Image.asset(
                          "assets/images/troc.png",
                          fit: BoxFit.contain,
                        )),
                        
                    SizedBox(height: 45),
                  
                  titleField,
                    SizedBox(height: 20),
                    descriptionField,
                    SizedBox(height: 20),
                   phoneField,
                    SizedBox(height: 20),

                    
                     MaterialButton(
                color: Color.fromARGB(255, 92, 93, 94),
                child: const Text(
                    "Pick Image from Gallery",
                  style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold
                  )
                ),
                onPressed: () {
                  pickImage();
                }
            ),
                   
                    addButton,
                    SizedBox(height: 15),
                  ],),))))); 
                       

    
  }
 















 }