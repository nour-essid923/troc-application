import 'package:meta/meta.dart';

import '../api/utils.dart';



class UserField {
  //static final String lastMessageTime = 'lastMessageTime';
}

class User {
  final String uid ;
  final String name;
  final String urlAvatar;
  //final DateTime lastMessageTime;

  const User({
   required  this.uid,
    required this.name,
    required this.urlAvatar,
    //required this.lastMessageTime,
  });

  User copyWith({
    String? uid,
    String? name,
    String ?urlAvatar,
    //String ?lastMessageTime,
  }) =>
      User(
        uid :uid ?? this.uid,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        //lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        uid: json['idUser'],
        name: json['name'],
        urlAvatar: json['urlAvatar'],
        //lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': uid,
        'name': name,
        'urlAvatar': urlAvatar,
        //'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
      };
}