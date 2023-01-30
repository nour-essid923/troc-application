class UserModel {
  String uid;
  String email;
  String firstname;
  String lastname;
  String phone;
  
  String password;
  
  String confpass;
  

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.password,
      required this.confpass
     });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      phone: map['phone'],
     
      email: map['email'],
      password: map[' Password'],
      confpass: map['confpass'],
    
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> j) => UserModel(
      uid: j['id'],
      
      firstname: j['firstName'],
      lastname: j["lastname"],
       phone: j['phone'],
      
      email: j['email'],
      password: j['password'],
      confpass: j['confpass'],
     );

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstname,
      'secondName': lastname,
      'phone':phone,
      
      'email': email,
      'password':password,
      
    };
  }
}
